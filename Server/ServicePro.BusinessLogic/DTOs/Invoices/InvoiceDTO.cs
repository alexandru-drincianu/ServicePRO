using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.Common.Enums;
using System;

namespace ServicePro.BusinessLogic.DTOs.Invoices
{
    public class InvoiceDTO
    {
        public int Id { get; set; }
        public string Number { get; set; }
        public int WorkorderId { get; set;}
        public WorkorderDTO Workorder { get; set; }
        public InvoiceStatus InvoiceStatus { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
