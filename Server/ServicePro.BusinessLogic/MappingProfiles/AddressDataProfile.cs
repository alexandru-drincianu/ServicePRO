using AutoMapper;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.DataAccess.Entities;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class AddressDataProfile : Profile
    {
        public AddressDataProfile()
        {
            CreateMap<Address, AddressDTO>().ReverseMap();
        }
    }
}
