using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IConsumableService
    {
        public Task<IEnumerable<ConsumableDTO>> GetAll();
        public Task<ConsumableDTO> AddAsync(ConsumableDTO item, bool applyChanges = true);
        public Task<ConsumableDTO> UpdateAsync(ConsumableDTO item, int id, bool applyChanges = true);
        public Task<ConsumableDTO> RemoveAsync(int Id, bool applyChanges = true);
        public Task<ConsumableDTO> GetByIdAsync(int Id, bool applyChanges = true);
    }
}
