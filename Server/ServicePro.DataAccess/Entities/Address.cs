#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class Address
    {
        public int Id { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string County { get; set; }
    }
}
