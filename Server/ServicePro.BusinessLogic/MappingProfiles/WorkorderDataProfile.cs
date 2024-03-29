﻿using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.DataAccess.Entities;
using AutoMapper;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class WorkorderItemDataProfile : Profile
    {
        public WorkorderItemDataProfile()
        {
            CreateMap<WorkorderItem, WorkorderItemDTO>().ReverseMap();
        }
    }
}
