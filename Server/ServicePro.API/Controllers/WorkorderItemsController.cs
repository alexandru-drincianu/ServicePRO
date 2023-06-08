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
    public class WorkorderItemsController : ControllerBase
    {
        private readonly IWorkorderItemService _workorderItemService;

        public WorkorderItemsController(IWorkorderItemService workorderItemService)
        {
            _workorderItemService = workorderItemService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<WorkorderItemDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Get()
        {
            var workorderItems = await _workorderItemService.GetAll();
            return Ok(workorderItems);
        }

        [HttpGet]
        [Route("workorder/{workorderId}")]
        [ProducesResponseType(typeof(IEnumerable<WorkorderItemDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetWorkorderItems(int workorderId)
        {
            var workorderItems = await _workorderItemService.GetAllForWorkorder(workorderId);
            return Ok(workorderItems);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(WorkorderItemDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetById(int id)
        {
            var workorderItem = await _workorderItemService.GetByIdAsync(id);
            return Ok(workorderItem);
        }

        [HttpPost]
        [ProducesResponseType(typeof(WorkorderItemDTO), (int)HttpStatusCode.Created)]
        public async Task<IActionResult> Create([FromBody] WorkorderItemDTO newWorkorderItem)
        {
            var workorderItem = await _workorderItemService.AddAsync(newWorkorderItem);
            return Created(nameof(GetById), workorderItem); ;
        }

        [HttpPut("{id}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(WorkorderItemDTO), (int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] WorkorderItemDTO newWorkorderItem)
        {
            if (id != newWorkorderItem.Id)
            {
                return BadRequest("Invalid request");
            }

            var workorderItem = await _workorderItemService.UpdateAsync(newWorkorderItem, id);
            return Ok(workorderItem);
        }

        [HttpDelete("{workorderItemId}")]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Delete(int workorderItemId)
        {
            var dbWorkorderItem = await _workorderItemService.RemoveAsync(workorderItemId);
            if (dbWorkorderItem != null)
            {
                return NoContent();
            }

            return BadRequest("Something went wrong...");
        }
    }
}
