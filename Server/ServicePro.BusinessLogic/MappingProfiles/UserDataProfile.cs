using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Users;
using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class UserDataProfile : Profile
    {
        public UserDataProfile()
        {
            CreateMap<User, UserDTO>().ReverseMap();
            CreateMap<User, ClientDTO>().ReverseMap();
            CreateMap<User, UserDetailsModel>().ReverseMap();
        }
    }
}
