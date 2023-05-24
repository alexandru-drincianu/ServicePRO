using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface IAddressRepository
    {
        Task AddAsync(Address item, bool applyChanges = true);
        Task UpdateAsync(Address item, int id, bool applyChanges = true);
        Task RemoveAsync(Address item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<Address> items, bool applyChanges = true);
        Task<IQueryable<Address>> GetAll();
        Task<List<Address>> GetAllAsync();
        Task<Address?> Find(Expression<Func<Address, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<Address, bool>> predicate);
        Task<Address> GetByIdAsync<TId>(TId id);
    }
}
