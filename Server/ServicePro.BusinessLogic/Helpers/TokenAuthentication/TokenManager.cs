
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using ServicePro.DataAccess.Context;
using System.Linq;
using ServicePro.DataAccess.Entities;
using System;
using Microsoft.AspNetCore.DataProtection;

namespace ServicePro.BusinessLogic.Helpers.TokenAuthentication;
public class TokenManager : ITokenManager
{
    private JwtSecurityTokenHandler tokenHandler;
    private byte[] secretKey = Encoding.ASCII.GetBytes(".NET Licenta-ServicePro-API");
    protected readonly ServiceProDbContext _context;
    private readonly IDataProtector _dataProtector;



    public TokenManager(ServiceProDbContext context, IDataProtectionProvider protectionProvider)
    {
        tokenHandler = new JwtSecurityTokenHandler();
        _context = context;
        _dataProtector = protectionProvider.CreateProtector("Affiliate_PlanI");
    }
    public User? Authenticate(string username, string password)
    {
        if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
        {
            var user = _context.Users.Where(b => b.Username == username).FirstOrDefault();
            if (user == null || password != _dataProtector.Unprotect(user.Password))
            {
                throw new Exception("Credentials are not correct");
            }

            return user;
        }
        return null;
    }

    public string NewToken(User user)
    {
        var tokenDescriptor = new SecurityTokenDescriptor()
        {
            Subject = new ClaimsIdentity(new Claim[] { new Claim(ClaimTypes.Name, user.FullName) }),
            Expires = DateTime.Now.AddDays(31),
            SigningCredentials = new SigningCredentials(
                new SymmetricSecurityKey(secretKey),
                SecurityAlgorithms.HmacSha256Signature
                )
        };

        var token = tokenHandler.CreateToken(tokenDescriptor);

        var jwtString = tokenHandler.WriteToken(token);

        return jwtString;
    }

    public ClaimsPrincipal VerifyToken(string tokenValue)
    {
        var claims = tokenHandler.ValidateToken(tokenValue,
            new TokenValidationParameters()
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(secretKey),
                ValidateLifetime = true,
                ValidateAudience = false,
                ValidateIssuer = false,
                ClockSkew = TimeSpan.Zero
            },
            out SecurityToken validateToken
            );
        return claims;
    }

}
