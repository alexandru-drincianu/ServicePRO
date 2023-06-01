using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using ServicePro.BusinessLogic.Services.Abstractions;
using System.Threading.Tasks;
using ServicePro.API.Filters;
using System.Net;
using System;
using ServicePro.BusinessLogic.DTOs.Users;
using ServicePro.BusinessLogic.DTOs.Pagination;

namespace ServicePro.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [TokenAuthenticationFilter]
    public class UsersController : ControllerBase
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<UserDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Get()
        {
            var users = await _userService.GetAll();
            return Ok(users);
        }

        [HttpGet]
        [Route("clients")]
        [ProducesResponseType(typeof(List<ClientDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetAllClients()
        {
            var users = await _userService.GetAllClients();
            return Ok(users);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(ClientDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetById(int id)
        {
            var user = await _userService.GetByIdAsync(id);
            return Ok(user);
        }

        [HttpPost]
        [Route("createClient")]
        [ProducesResponseType(typeof(UserDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> CreateClientAccount([FromBody] ClientDTO clientDTO)
        {
            try
            {
                var createdClient = await _userService.CreateClientAccount(clientDTO);
                return Ok(createdClient);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }


        [HttpPut]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(ClientDTO), (int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Update([FromBody] ClientDTO clientDTO)
        {
            try
            {
                var updatedUser = await _userService.UpdateAsync(clientDTO, clientDTO.Id);
                return Ok(updatedUser);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{userId}")]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Delete(int userId)
        {
            var dbUser = await _userService.RemoveAsync(userId);
            if (dbUser != null)
            {
                return NoContent();
            }

            return BadRequest("Something went wrong...");
        }

        [HttpDelete("{userId}/fromUser/{loggedInUserId}")]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> DeleteUserByAdmin([FromRoute] int userId, [FromRoute] int loggedInUserId)
        {
            try
            {
                var dbUser = await _userService.RemoveByAdminAsync(userId, loggedInUserId);
                if (dbUser != null)
                {
                    return NoContent();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
            return BadRequest("Something went wrong...");
        }

        [Route("paginated")]
        [HttpPost]
        [ProducesResponseType(typeof(PaginatedListResponseDto<UserDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetUsersPaginated([FromBody] PaginatedListRequest paginatedRequest)
        {
            var paginatedOrders = await _userService.GetUsersPaginatedAsync(paginatedRequest);
            return Ok(paginatedOrders);
        }
    }
}
