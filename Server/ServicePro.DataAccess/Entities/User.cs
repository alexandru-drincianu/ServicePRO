using ServicePro.Common.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ServicePro.DataAccess.Entities
{
    public partial class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public UserRole Role { get; set; }
        public string? TelephoneNumber { get; set; }
        public string? Email { get; set; }
        public string? Notes { get; set; }
        public int? AddressId { get; set; }
        [ForeignKey("AddressId")]
        public Address Address { get; set; }

    }
}
