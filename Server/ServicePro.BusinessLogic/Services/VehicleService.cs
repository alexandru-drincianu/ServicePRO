using AutoMapper;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using IronOcr;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Text.RegularExpressions;
using ServicePro.DataAccess.Repository.Abstraction;

namespace ServicePro.BusinessLogic.Services
{
    public class VehicleService : IVehicleService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public VehicleService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<VehicleResponseDTO> CreateAsync(VehicleRequestDTO item)
        {
            if (await _unitOfWork.VehicleRepository.AnyAsync(vehicle => vehicle.Registration == item.Registration))
            {
                throw new Exception("Vehicle already exists");
            }

            var vehicle = _mapper.Map<Vehicle>(item);
            await _unitOfWork.VehicleRepository.AddAsync(vehicle);

            var createdVehicle = await _unitOfWork.VehicleRepository.Find(v => v.Registration == item.Registration);

            return _mapper.Map<VehicleResponseDTO>(createdVehicle);
        }

        public async Task<IEnumerable<VehicleResponseDTO>> GetAll()
        {
            var vehicles = await _unitOfWork.VehicleRepository.GetVehiclesAsync();
            return _mapper.Map<IEnumerable<VehicleResponseDTO>>(vehicles);
        }

        public async Task<VehicleResponseDTO> GetById(int id)
        {
            var vehicles = await _unitOfWork.VehicleRepository.GetVehicleByIdAsync(id);
            return _mapper.Map<VehicleResponseDTO>(vehicles);
        }

        public async Task<VehicleScanModel> UploadLicensePlatePhoto(IFormFile picture)
        {
            byte[] photoBytes;
            var licensePlate = string.Empty;
            using (var memoryStream = new MemoryStream())
            {
                await picture.CopyToAsync(memoryStream);
                photoBytes = memoryStream.ToArray();
            }

            IronTesseract ocr = new IronTesseract();
            using (OcrInput Input = new OcrInput(photoBytes))
            {
                Input.Rotate(180);
                Input.DeNoise();
                Input.ToGrayScale();
                Input.Deskew();
                OcrResult result = ocr.Read(Input);
                licensePlate =  result.Text;
            }

            var vehicle = await _unitOfWork.VehicleRepository.GetVehicleByLicensePlateAsync(RemoveSpecialCharacters(licensePlate));
            return new VehicleScanModel
            {
                LicensePlate = licensePlate,
                Vehicle = _mapper.Map<VehicleResponseDTO>(vehicle),
            };
        }

        private string RemoveSpecialCharacters(string input)
        {
            // Remove special characters, trim spaces, and convert to uppercase
            string result = Regex.Replace(input, @"[^A-Za-z0-9\s]", "").Trim().ToUpper();
            return result;
        }
    }

}
