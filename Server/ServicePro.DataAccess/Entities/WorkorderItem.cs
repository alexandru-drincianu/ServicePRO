using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class WorkorderItem
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public decimal Quantity { get; set; }
        public int WorkorderId { get; set; }
        [ForeignKey("WorkorderId")]
        public Workorder Workorder { get; set; }
    }
}
