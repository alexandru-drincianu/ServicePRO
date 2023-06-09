using ServicePro.Common.Enums;
using ServicePro.DataAccess.Entities;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServicePro.BusinessLogic.DTOs.Orders
{
    public class WorkorderItemDTO
    {
        public int Id { get; set; }
        public WorkorderItemType ItemType { get; set; }
        public decimal Quantity { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Minutes { get; set; }
        public int? ConsumableId { get; set; }
        public int? LabourId { get; set; }
    }
}
