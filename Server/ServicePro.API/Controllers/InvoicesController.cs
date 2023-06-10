using Microsoft.AspNetCore.Mvc;
using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using ServicePro.BusinessLogic.Services.Abstractions;
using System.Threading.Tasks;
using ServicePro.API.Filters;
using System.Net;
using ServicePro.BusinessLogic.DTOs.Invoices;

namespace ServicePro.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [TokenAuthenticationFilter]
    public class InvoicesController : ControllerBase
    {
        private readonly IInvoiceService _invoiceService;

        public InvoicesController(IInvoiceService invoiceService)
        {
            _invoiceService = invoiceService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<InvoiceDTO>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> Get()
        {
            var invoices = await _invoiceService.GetAll();
            return Ok(invoices);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(InvoiceDTO), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetById(int id)
        {
            var consumable = await _invoiceService.GetByIdAsync(id);
            return Ok(consumable);
        }

        [HttpPost]
        [ProducesResponseType(typeof(InvoiceDTO), (int)HttpStatusCode.Created)]
        public async Task<IActionResult> Create([FromBody] InvoiceDTO newInvoice)
        {
            var consumable = await _invoiceService.AddAsync(newInvoice);
            return Created(nameof(GetById), consumable); ;
        }

        [HttpPut("{id}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(InvoiceDTO), (int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] InvoiceDTO newInvoice)
        {
            if (id != newInvoice.Id)
            {
                return BadRequest("Invalid request");
            }

            var consumable = await _invoiceService.UpdateAsync(newInvoice, id);
            return Ok(consumable);
        }

        [HttpDelete("{invoiceId}")]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Delete(int invoiceId)
        {
            var dbInvoice = await _invoiceService.RemoveAsync(invoiceId);
            if (dbInvoice != null)
            {
                return NoContent();
            }

            return BadRequest("Something went wrong...");
        }
    }
}
