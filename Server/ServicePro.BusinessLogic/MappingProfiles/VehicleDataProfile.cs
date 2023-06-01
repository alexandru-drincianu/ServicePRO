using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Users;
using ServicePro.BusinessLogic.DTOs.Vehicles;
using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class VehicleDataProfile : Profile
    {
        public VehicleDataProfile()
        {
            CreateMap<Vehicle, VehicleResponseDTO>().ReverseMap();
            CreateMap<Vehicle, VehicleRequestDTO>().ReverseMap();
            CreateMap<VehicleResponseDTO, UserDetailsModel>().ReverseMap();
        }
    }
}
