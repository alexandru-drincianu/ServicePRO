using Microsoft.EntityFrameworkCore;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;
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

        public async Task<int?> GetWorkorderIdForVehicleAsync(int vehicleId)
        {
            var workorder = await _context.Workorders.FirstOrDefaultAsync(w => w.VehicleId == vehicleId);
            return workorder?.Id;
        }
    }
}
