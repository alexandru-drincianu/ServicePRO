using Microsoft.AspNetCore.Mvc;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Helpers.TokenAuthentication;
using ServicePro.BusinessLogic.Services.Abstractions;
using System;
using System.Net;
using System.Threading.Tasks;

namespace ServicePro.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {
        private readonly IAuthenticateService _authenticateService;
        private readonly ITokenManager _tokenManager;

        public AuthenticateController(ITokenManager tokenManager, IAuthenticateService authenticateService)
        {
            _authenticateService = authenticateService;
            _tokenManager = tokenManager;
        }

        [HttpPost("login")]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.Unauthorized)]
        [ProducesResponseType(typeof(LoginResponseDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Login(LoginDTO loginModel)
        {
            if (loginModel == null || string.IsNullOrEmpty(loginModel.Username) || string.IsNullOrEmpty(loginModel.Password))
            {
                return BadRequest("Invalid request.");
            }

            var user = await _authenticateService.Login(loginModel);
            if (user != null)
            {
                return Ok(new LoginResponseDTO { Token = _tokenManager.NewToken(user), FullName = user.FullName, Id = user.Id, Role = user.Role });
            }
            else
            {
                return Unauthorized("You are not authorized");
            }
        }

        [HttpPost("register")]
        [ProducesResponseType(typeof(RegisterResponseDTO), (int)HttpStatusCode.Created)]
        public async Task<IActionResult> Register([FromBody] UserDTO newUser)
        {
            try
            {
                var result = await _authenticateService.Register(newUser);
                return Ok(new RegisterResponseDTO { FullName = result.FullName, Id = result.Id });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
