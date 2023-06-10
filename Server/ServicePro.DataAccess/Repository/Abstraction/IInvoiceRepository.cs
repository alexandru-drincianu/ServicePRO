using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface IInvoiceRepository
    {
        Task AddAsync(Invoice item, bool applyChanges = true);
        Task UpdateAsync(Invoice item, int id, bool applyChanges = true);
        Task RemoveAsync(Invoice item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<Invoice> items, bool applyChanges = true);
        Task<IQueryable<Invoice>> GetAll();
        Task<List<Invoice>> GetAllAsync();
        Task<Invoice?> Find(Expression<Func<Invoice, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<Invoice, bool>> predicate);
        Task<Invoice> GetByIdAsync<TId>(TId id);
        Task<Invoice> GetInvoiceByIdAsync(int id);
    }
}
