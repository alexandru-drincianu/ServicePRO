using Microsoft.AspNetCore.Mvc;
using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using ServicePro.BusinessLogic.Services.Abstractions;
using System.Threading.Tasks;
using ServicePro.API.Filters;
using System.Net;

namespace ServicePro.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [TokenAuthenticationFilter]
    public class LaboursController : ControllerBase
    {
        private readonly ILabourService _labourService;

        public LaboursController(ILabourService labourService)
        {
            _labourService = labourService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<LabourDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Get()
        {
            var labours = await _labourService.GetAll();
            return Ok(labours);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(LabourDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetById(int id)
        {
            var labour = await _labourService.GetByIdAsync(id);
            return Ok(labour);
        }

        [HttpPost]
        [ProducesResponseType(typeof(LabourDTO), (int)HttpStatusCode.Created)]
        public async Task<IActionResult> Create([FromBody] LabourDTO newLabour)
        {
            var labour = await _labourService.AddAsync(newLabour);
            return Created(nameof(GetById), labour); ;
        }

        [HttpPut("{id}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(LabourDTO), (int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] LabourDTO newLabour)
        {
            if (id != newLabour.Id)
            {
                return BadRequest("Invalid request");
            }

            var labours = await _labourService.UpdateAsync(newLabour, id);
            return Ok(labours);
        }

        [HttpDelete("{orderId}")]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Delete(int labourId)
        {
            var dbLabour = await _labourService.RemoveAsync(labourId);
            if (dbLabour != null)
            {
                return NoContent();
            }

            return BadRequest("Something went wrong...");
        }
    }
}
