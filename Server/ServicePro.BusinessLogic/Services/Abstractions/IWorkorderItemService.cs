using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IWorkorderItemService
    {
        public Task<IEnumerable<WorkorderItemDTO>> GetAll();
        public Task<IEnumerable<WorkorderItemDTO>> GetAllForWorkorder(int workorderId);
        public Task<WorkorderItemDTO> AddAsync(WorkorderItemDTO item, bool applyChanges = true);
        public Task<WorkorderItemDTO> UpdateAsync(WorkorderItemDTO item, int id, bool applyChanges = true);
        public Task<WorkorderItemDTO> RemoveAsync(int Id, bool applyChanges = true);
        public Task<WorkorderItemDTO> GetByIdAsync(int Id, bool applyChanges = true);
    }
}
