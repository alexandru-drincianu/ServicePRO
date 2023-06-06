using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface ILabourService
    {
        public Task<IEnumerable<LabourDTO>> GetAll();
        public Task<LabourDTO> AddAsync(LabourDTO item, bool applyChanges = true);
        public Task<LabourDTO> UpdateAsync(LabourDTO item, int id, bool applyChanges = true);
        public Task<LabourDTO> RemoveAsync(int Id, bool applyChanges = true);
        public Task<LabourDTO> GetByIdAsync(int Id, bool applyChanges = true);
    }
}
