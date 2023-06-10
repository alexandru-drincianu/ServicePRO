using ServicePro.Common.Enums;
using System;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class Invoice
    {
        public int Id { get; set; }
        public string Number { get; set; }
        public int WorkorderId { get; set; }
        [ForeignKey("WorkorderId")]
        public Workorder Workorder { get; set; }
        public InvoiceStatus InvoiceStatus { get; set; }
        public DateTime CreatedTime { get; set; }
    }
}
