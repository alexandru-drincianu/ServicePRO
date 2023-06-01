using ServicePro.BusinessLogic.DTOs.Users;
using ServicePro.DataAccess.Entities;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IAuthenticateService
    {
        public Task<User> Login(LoginDTO loginModel);
        public Task<User> Register(UserDTO item, bool applyChanges = true);
    }
}
