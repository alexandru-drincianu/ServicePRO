using ServicePro.Common.Enums;
using ServicePro.DataAccess.Entities;

namespace ServicePro.BusinessLogic.DTOs
{
    public class VehicleRequestDTO
    {
        public int UserId { get; set; }
        public string Registration { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string VIN { get; set; }
        public decimal Mileage { get; set; }
        public FuelType FuelType { get; set; }
    }
}
