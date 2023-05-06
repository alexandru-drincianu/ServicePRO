using ServicePro.Common.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.DTOs
{
    public class LoginResponseDTO
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Token { get; set; }

        public UserRole Role { get; set; }
    }
}
