using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface IConsumableRepository
    {
        Task AddAsync(Consumable item, bool applyChanges = true);
        Task UpdateAsync(Consumable item, int id, bool applyChanges = true);
        Task RemoveAsync(Consumable item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<Consumable> items, bool applyChanges = true);
        Task<IQueryable<Consumable>> GetAll();
        Task<List<Consumable>> GetAllAsync();
        Task<Consumable?> Find(Expression<Func<Consumable, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<Consumable, bool>> predicate);
        Task<Consumable> GetByIdAsync<TId>(TId id);
    }
}
