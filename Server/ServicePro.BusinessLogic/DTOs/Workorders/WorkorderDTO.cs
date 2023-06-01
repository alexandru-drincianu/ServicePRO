using ServicePro.BusinessLogic.MappingProfiles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ServicePro.DataAccess.Entities;
using ServicePro.Common.Enums;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServicePro.BusinessLogic.DTOs.Orders
{

    public class WorkorderDTO
    {
        public int Id { get; set; }
        public Vehicle Vehicle { get; set; }
        public WorkorderStatus Status { get; set; }
        public string? Remarks { get; set; }
        public DateTime? ArrivedDate { get; set; }
        public DateTime? DepartedDate { get; set; }
        public decimal TotalCost { get; set; }
        public bool IsInvoiced { get; set; }
    }
}
