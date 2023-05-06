using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.DataAccess.Entities;
using AutoMapper;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class OrderDataProfile : Profile
    {
        public OrderDataProfile()
        {
            CreateMap<Order, OrderDto>().ReverseMap();
        }
    }
}
