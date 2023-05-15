using Microsoft.AspNetCore.Mvc;
using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using ServicePro.BusinessLogic.Services.Abstractions;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.API.Filters;
using System.Net;
using ServicePro.DataAccess.Entities;
using System;
using Microsoft.AspNetCore.Authorization;

namespace ServicePro.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    //[TokenAuthenticationFilter]
    public class VehiclesController : ControllerBase
    {
        private readonly IVehicleService _vehicleService;

        public VehiclesController(IVehicleService vehicleService)
        {
            _vehicleService = vehicleService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<VehicleResponseDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Get()
        {
            var vehicles = await _vehicleService.GetAll();
            return Ok(vehicles);
        }

        [HttpPost]
        [Route("createVehicle")]
        [ProducesResponseType(typeof(VehicleResponseDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> CreateVehicle([FromBody] VehicleRequestDTO vehicleDTO)
        {
            try
            {
                var createdVehicle = await _vehicleService.CreateAsync(vehicleDTO);
                return Ok(createdVehicle);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
    }
}
