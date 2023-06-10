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
    public class WorkorderRepository : Repository<Workorder>, IWorkorderRepository
    {
        private readonly ServiceProDbContext _context;
        public WorkorderRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<List<Workorder>> GetAllWorkordersAsync()
        {
            return await _context.Set<Workorder>().Include(wo => wo.Vehicle).ThenInclude(v => v.User).OrderByDescending(i => i.ArrivedDate).ToListAsync();
        }

        public async Task<List<Workorder>> GetAllWorkordersForUserAsync(int userId)
        {
            return await _context.Set<Workorder>().Include(wo => wo.Vehicle).ThenInclude(v => v.User)
                .Where(wo => wo.Vehicle.UserId == userId)
                .OrderByDescending(i => i.ArrivedDate)
                .ToListAsync();
        }

        public async Task<Workorder> GetWorkorderByIdAsync(int id)
        {
            return await _context.Set<Workorder>().Include(wo => wo.Vehicle).ThenInclude(v => v.User).FirstOrDefaultAsync(wo => wo.Id == id);
        }

        public async Task<int?> GetWorkorderIdForVehicleAsync(int vehicleId)
        {
            var workorder = await _context.Workorders.FirstOrDefaultAsync(w => w.VehicleId == vehicleId);
            return workorder?.Id;
        }
    }
}
