using Microsoft.EntityFrameworkCore;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository
{
    public class WorkorderItemRepository : Repository<WorkorderItem>, IWorkorderItemRepository
    {
        private readonly ServiceProDbContext _context;
        public WorkorderItemRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<List<WorkorderItem>> GetAllForWorkorderAsync(int workorderId)
        {
            return await _context.Set<WorkorderItem>()
                .Include(wi => wi.Labour)
                .Include(wi => wi.Consumable)
                .Where(wi => wi.WorkorderId == workorderId)
                .ToListAsync();
        }
    }
}
