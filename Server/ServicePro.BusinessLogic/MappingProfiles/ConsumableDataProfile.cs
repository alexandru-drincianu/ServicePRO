using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.DataAccess.Entities;
using AutoMapper;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class ConsumableDataProfile : Profile
    {
        public ConsumableDataProfile()
        {
            CreateMap<Consumable, ConsumableDTO>().ReverseMap();
        }
    }
}
