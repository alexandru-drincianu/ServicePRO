using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface IWorkorderRepository
    {
        Task<List<Workorder>> GetAllWorkordersAsync();
        Task<List<Workorder>> GetAllWorkordersForUserAsync(int userId);
        Task<Workorder> GetWorkorderByIdAsync(int id);
        Task<int?> GetWorkorderIdForVehicleAsync(int vehicleId);
        Task AddAsync(Workorder item, bool applyChanges = true);
        Task UpdateAsync(Workorder item, int id, bool applyChanges = true);
        Task RemoveAsync(Workorder item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<Workorder> items, bool applyChanges = true);
        Task<Workorder?> Find(Expression<Func<Workorder, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<Workorder, bool>> predicate);
        Task<Workorder> GetByIdAsync<TId>(TId id);
    }
}
