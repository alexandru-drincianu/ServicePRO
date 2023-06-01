using ServicePro.BusinessLogic.DTOs.Users;
using ServicePro.Common.Enums;

namespace ServicePro.BusinessLogic.DTOs.Vehicles
{
    public class VehicleResponseDTO
    {
        public int Id { get; set; }
        public UserDetailsModel User { get; set; }
        public string Registration { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string VIN { get; set; }
        public decimal Mileage { get; set; }
        public FuelType FuelType { get; set; }
        public int? WorkorderId { get; set; }
    }
}
