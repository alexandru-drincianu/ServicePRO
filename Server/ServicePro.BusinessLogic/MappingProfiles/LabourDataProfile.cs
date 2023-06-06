using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.DataAccess.Entities;
using AutoMapper;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class LabourDataProfile : Profile
    {
        public LabourDataProfile()
        {
            CreateMap<Labour, LabourDTO>().ReverseMap();
        }
    }
}
