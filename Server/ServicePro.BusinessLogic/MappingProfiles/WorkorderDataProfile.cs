using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.DataAccess.Entities;
using AutoMapper;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class WorkorderDataProfile : Profile
    {
        public WorkorderDataProfile()
        {
            CreateMap<Workorder, WorkorderDTO>().ReverseMap();
        }
    }
}
