using ServicePro.DataAccess.Entities;

namespace ServicePro.BusinessLogic.DTOs.Orders
{
    public class ClientDTO
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string TelephoneNumber { get; set; }
        public AddressDTO Address { get; set; }
        public string Notes { get; set; }
    }
}
