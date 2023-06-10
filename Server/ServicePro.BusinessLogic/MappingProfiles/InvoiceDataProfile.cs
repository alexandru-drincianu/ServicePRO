using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.DataAccess.Entities;
using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Invoices;

namespace ServicePro.BusinessLogic.MappingProfiles
{
    public class InvoiceDataProfile : Profile
    {
        public InvoiceDataProfile()
        {
            CreateMap<Invoice, InvoiceDTO>().ReverseMap();
        }
    }
}
