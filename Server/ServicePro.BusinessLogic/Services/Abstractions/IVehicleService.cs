using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Microsoft.AspNetCore.Http;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IVehicleService
    {
        Task<IEnumerable<VehicleResponseDTO>> GetAll();
        Task<VehicleResponseDTO> CreateAsync(VehicleRequestDTO item);
        Task<VehicleResponseDTO> GetById(int id);
        Task<VehicleScanModel> UploadLicensePlatePhoto(IFormFile picture);
    }
}
