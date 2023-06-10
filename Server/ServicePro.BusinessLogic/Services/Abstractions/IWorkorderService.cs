using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.DTOs.Pagination;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IWorkorderService
    {
        public Task<IEnumerable<WorkorderDTO>> GetAll();
        Task<IEnumerable<WorkorderDTO>> GetAllForUser(int userId);
        public Task<WorkorderDTO> AddAsync(WorkorderDTO item, bool applyChanges = true);
        public Task<WorkorderDTO> UpdateAsync(WorkorderDTO item, int id, bool applyChanges = true);
        public Task<WorkorderDTO> RemoveAsync(int orderId, bool applyChanges = true);
        public Task<WorkorderDTO> GetByIdAsync(int Id, bool applyChanges = true);
    }
}
