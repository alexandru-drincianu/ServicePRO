using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface IUserRepository
    {
        Task<List<User>> GetAllClients();
        Task AddAsync(User item, bool applyChanges = true);
        Task UpdateAsync(User item, int id, bool applyChanges = true);
        Task RemoveAsync(User item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<User> items, bool applyChanges = true);
        Task<IQueryable<User>> GetAll();
        Task<List<User>> GetAllAsync();
        Task<User?> Find(Expression<Func<User, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<User, bool>> predicate);
        Task<User> GetByIdAsync<TId>(TId id);
    }
}
