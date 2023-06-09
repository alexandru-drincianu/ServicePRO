using ServicePro.Common.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class WorkorderItem
    {
        public int Id { get; set; }
        public WorkorderItemType ItemType { get; set; }
        public decimal Quantity { get; set; }
        public int Minutes { get; set; }
        public int WorkorderId { get; set; }
        [ForeignKey("WorkorderId")]
        public Workorder Workorder { get; set; }
        public int? ConsumableId { get; set; }
        [ForeignKey("ConsumableId")]
        public Consumable? Consumable { get; set; }
        public int? LabourId { get; set; }
        [ForeignKey("LabourId")]
        public Labour? Labour { get; set; }
    }
}
