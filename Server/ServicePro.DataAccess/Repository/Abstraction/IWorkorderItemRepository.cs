using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface IWorkorderItemRepository
    {
        Task AddAsync(WorkorderItem item, bool applyChanges = true);
        Task UpdateAsync(WorkorderItem item, int id, bool applyChanges = true);
        Task RemoveAsync(WorkorderItem item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<WorkorderItem> items, bool applyChanges = true);
        Task<IQueryable<WorkorderItem>> GetAll();
        Task<List<WorkorderItem>> GetAllAsync();
        Task<List<WorkorderItem>> GetAllForWorkorderAsync(int workorderId);
        Task<WorkorderItem?> Find(Expression<Func<WorkorderItem, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<WorkorderItem, bool>> predicate);
        Task<WorkorderItem> GetByIdAsync<TId>(TId id);
    }
}
