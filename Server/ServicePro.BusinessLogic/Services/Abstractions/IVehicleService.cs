using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IVehicleService
    {
        public Task<IEnumerable<VehicleResponseDTO>> GetAll();
        public Task<VehicleResponseDTO> CreateAsync(VehicleRequestDTO item);
    }
}
