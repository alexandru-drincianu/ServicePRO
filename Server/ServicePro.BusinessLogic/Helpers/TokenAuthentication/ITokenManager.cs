using ServicePro.DataAccess.Entities;
using System.Security.Claims;

namespace ServicePro.BusinessLogic.Helpers.TokenAuthentication;

    public interface ITokenManager
    {
        User? Authenticate(string username, string password);
        string NewToken(User user);
        ClaimsPrincipal VerifyToken(string tokenValue);
    }