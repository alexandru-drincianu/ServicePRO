using ServicePro.Common.Enums;

namespace ServicePro.BusinessLogic.DTOs.Users
{
    public class UserDetailsModel
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public UserRole Role { get; set; }
    }
}
