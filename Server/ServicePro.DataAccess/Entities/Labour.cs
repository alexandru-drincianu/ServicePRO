#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class Labour
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public decimal HourlyWage { get; set; }
    }
}
