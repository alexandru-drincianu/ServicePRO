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
    public class WorkorderController : ControllerBase
    {
        private readonly IWorkorderService _workorderService;

        public WorkorderController(IWorkorderService testService)
        {
            _workorderService = testService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<WorkorderDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Get()
        {
            var workorders = await _workorderService.GetAll();
            return Ok(workorders);
        }

        [HttpGet]
        [Route("user/{userId}")]
        [ProducesResponseType(typeof(IEnumerable<WorkorderDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetAllForUser(int userId)
        {
            var workorders = await _workorderService.GetAllForUser(userId);
            return Ok(workorders);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(WorkorderDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetById(int id)
        {
            var workorder = await _workorderService.GetByIdAsync(id);
            return Ok(workorder);
        }

        [HttpPost]
        [ProducesResponseType(typeof(WorkorderDTO), (int)HttpStatusCode.Created)]
        public async Task<IActionResult> Create([FromBody] WorkorderDTO newWorkorder)
        {
            var workorder = await _workorderService.AddAsync(newWorkorder);
            return Created(nameof(GetById), workorder); ;
        }

        [HttpPut("{id}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(WorkorderDTO), (int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] WorkorderDTO newWorkorder)
        {
            if (id != newWorkorder.Id)
            {
                return BadRequest("Invalid request");
            }

            var workorder = await _workorderService.UpdateAsync(newWorkorder, id);
            return Ok(workorder);
        }

        [HttpDelete("{orderId}")]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Delete(int workorderId)
        {
            var dbWorkorder = await _workorderService.RemoveAsync(workorderId);
            if (dbWorkorder != null)
            {
                return NoContent();
            }

            return BadRequest("Something went wrong...");
        }
    }
}
