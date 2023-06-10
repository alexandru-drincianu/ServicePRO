using ServicePro.BusinessLogic.DTOs.Invoices;
using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IInvoiceService
    {
        public Task<IEnumerable<InvoiceDTO>> GetAll();
        Task<IEnumerable<InvoiceDTO>> GetAllForUser(int userId);
        public Task<InvoiceDTO> AddAsync(InvoiceDTO item, bool applyChanges = true);
        public Task<InvoiceDTO> CreateFromWorkorder(WorkorderDTO workorderDTO);
        public Task<InvoiceDTO> UpdateAsync(InvoiceDTO item, int id, bool applyChanges = true);
        public Task<InvoiceDTO> RemoveAsync(int Id, bool applyChanges = true);
        public Task<InvoiceDTO> GetByIdAsync(int Id, bool applyChanges = true);
    }
}
