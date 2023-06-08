using Microsoft.EntityFrameworkCore;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Repository.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ServicePro.DataAccess.Repository
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        private readonly ServiceProDbContext _context;
        public Repository(ServiceProDbContext context)
        {
            _context = context;
        }

        public async Task AddAsync(TEntity item, bool applyChanges = true)
        {
            _context.Set<TEntity>().Add(item);
            if (applyChanges)
            {
                await SaveChangesAsync();
            }
        }

        public async Task<TEntity?> Find(Expression<Func<TEntity, bool>> predicate)
        {
            return await _context.Set<TEntity>().Where(predicate).FirstOrDefaultAsync();
        }

        public async Task<bool> AnyAsync(Expression<Func<TEntity, bool>> predicate)
        {
            return await _context.Set<TEntity>().AnyAsync(predicate);
        }

        public async Task<IQueryable<TEntity>> GetAll()
        {
            return _context.Set<TEntity>();
        }

        public async Task<List<TEntity>> GetAllAsync()
        {
            return await _context.Set<TEntity>().ToListAsync();
        }


        public async Task<TEntity> GetByIdAsync<TId>(TId id)
        {
            return await _context.Set<TEntity>().FindAsync(id);
        }

        public async Task UpdateAsync(TEntity updatedItem, int id, bool applyChanges = true)
        {
            var existingItem = await _context.Set<TEntity>().FindAsync(id);

            if (existingItem != null && applyChanges)
            {
                _context.Entry(existingItem).CurrentValues.SetValues(updatedItem);
                await SaveChangesAsync();
            }
        }

        public async Task RemoveAsync(TEntity item, bool applyChanges = true)
        {
            _context.Set<TEntity>().Remove(item);
            if (applyChanges)
            {
                await SaveChangesAsync();
            }
        }

        public async Task RemoveRangeAsync(IEnumerable<TEntity> items, bool applyChanges = true)
        {
            _context.Set<TEntity>().RemoveRange(items);
            if (applyChanges)
            {
                await SaveChangesAsync();
            }
        }

        protected Task SaveChangesAsync()
        {
            return _context.SaveChangesAsync();
        }
    }
}
