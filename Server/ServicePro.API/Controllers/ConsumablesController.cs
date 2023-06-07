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
    public class ConsumablesController : ControllerBase
    {
        private readonly IConsumableService _consumableService;

        public ConsumablesController(IConsumableService consumableService)
        {
            _consumableService = consumableService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<ConsumableDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Get()
        {
            var consumables = await _consumableService.GetAll();
            return Ok(consumables);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(ConsumableDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetById(int id)
        {
            var consumable = await _consumableService.GetByIdAsync(id);
            return Ok(consumable);
        }

        [HttpPost]
        [ProducesResponseType(typeof(ConsumableDTO), (int)HttpStatusCode.Created)]
        public async Task<IActionResult> Create([FromBody] ConsumableDTO newConsumable)
        {
            var consumable = await _consumableService.AddAsync(newConsumable);
            return Created(nameof(GetById), consumable); ;
        }

        [HttpPut("{id}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(ConsumableDTO), (int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] ConsumableDTO newConsumable)
        {
            if (id != newConsumable.Id)
            {
                return BadRequest("Invalid request");
            }

            var consumable = await _consumableService.UpdateAsync(newConsumable, id);
            return Ok(consumable);
        }

        [HttpDelete("{consumableId}")]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Delete(int consumableId)
        {
            var dbConsumable = await _consumableService.RemoveAsync(consumableId);
            if (dbConsumable != null)
            {
                return NoContent();
            }

            return BadRequest("Something went wrong...");
        }
    }
}
