using ServicePro.Common.Enums;
using System;
using System.Collections.Generic;

#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public UserRoles UserRoles { get; set; }
    }
}
