using ServicePro.Common.Enums;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class Vehicle
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        [ForeignKey("UserId")]
        public User? User { get; set; }
        public string Registration { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string VIN { get; set; }
        public decimal Mileage { get; set; }
        public FuelType FuelType { get; set; }

    }
}
