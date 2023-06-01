using FluentValidation;
using ServicePro.BusinessLogic.DTOs.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Validation
{
    public class ClientValidator : AbstractValidator<ClientDTO>
    {
        public ClientValidator()
        {
            RuleFor(x => x.FullName).NotEmpty().Matches("^[A-Za-z ]+$");
            RuleFor(x => x.Email).NotEmpty().EmailAddress();
        }
    }

}
