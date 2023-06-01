using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using ServicePro.BusinessLogic.Services.Abstractions;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;
using ServicePro.API.Filters;
using System.Net;
using System;
using ServicePro.BusinessLogic.DTOs.Vehicles;

namespace ServicePro.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [TokenAuthenticationFilter]
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

        [HttpGet]
        [Route("{id}")]
        [ProducesResponseType(typeof(VehicleResponseDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetVehicleById([FromRoute] int id)
        {
            var vehicle = await _vehicleService.GetById(id);
            return Ok(vehicle);
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

        [HttpPost]
        [Route("upload")]
        [ProducesResponseType(typeof(VehicleScanModel), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> UploadPicture(IFormFile photo)
        {
            var vehicleScanModel = await _vehicleService.UploadLicensePlatePhoto(photo);
            return Ok(vehicleScanModel);
        }
    }
}
