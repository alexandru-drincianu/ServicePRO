using AutoMapper;
using Dashboard.Core.Extensions;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using ServcicePro.DataAccess.Repository;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.Common.Enums;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using ServicePro.ThirdPartyProviders.TwilioServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class VehicleService : IVehicleService
    {
        private readonly IVehicleRepository _vehicleRepository;
        private readonly IMapper _mapper;

        public VehicleService(IVehicleRepository vehicleRepository, IMapper mapper)
        {
            _vehicleRepository = vehicleRepository;
            _mapper = mapper;
        }

        public async Task<VehicleResponseDTO> CreateAsync(VehicleRequestDTO item)
        {
            if (await _vehicleRepository.AnyAsync(vehicle => vehicle.Registration == item.Registration))
            {
                throw new Exception("Vehicle already exists");
            }

            var vehicle = _mapper.Map<Vehicle>(item);
            await _vehicleRepository.AddAsync(vehicle);

            var createdVehicle = await _vehicleRepository.Find(v => v.Registration == item.Registration);

            return _mapper.Map<VehicleResponseDTO>(createdVehicle);
        }

        public async Task<IEnumerable<VehicleResponseDTO>> GetAll()
        {
            var vehicles = await _vehicleRepository.GetVehiclesAsync();
            return _mapper.Map<IEnumerable<VehicleResponseDTO>>(vehicles);
        }

        public async Task<VehicleResponseDTO> GetById(int id)
        {
            var vehicles = await _vehicleRepository.GetVehicleByIdAsync(id);
            return _mapper.Map<VehicleResponseDTO>(vehicles);
        }


    }

}
