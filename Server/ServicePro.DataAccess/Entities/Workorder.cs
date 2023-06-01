using ServicePro.Common.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class Workorder
    {
        public int Id { get; set; }
        public string Number { get; set; }
        public int VehicleId { get; set; }
        [ForeignKey("VehicleId")]
        public Vehicle Vehicle { get; set; }
        public WorkorderStatus Status { get; set; }
        public string? Remarks { get; set; }
        public DateTime? ArrivedDate { get; set; }
        public DateTime? DepartedDate { get; set; }
        public decimal TotalCost { get; set; }
        public bool IsInvoiced { get; set; }
    }
}
