using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface ILabourRepository
    {
        Task AddAsync(Labour item, bool applyChanges = true);
        Task UpdateAsync(Labour item, int id, bool applyChanges = true);
        Task RemoveAsync(Labour item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<Labour> items, bool applyChanges = true);
        Task<IQueryable<Labour>> GetAll();
        Task<List<Labour>> GetAllAsync();
        Task<Labour?> Find(Expression<Func<Labour, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<Labour, bool>> predicate);
        Task<Labour> GetByIdAsync<TId>(TId id);
    }
}
