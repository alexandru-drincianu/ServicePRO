using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;

namespace ServcicePro.DataAccess.Repository
{
    public class LabourRepository : Repository<Labour>, ILabourRepository
    {
        private readonly ServiceProDbContext _context;
        public LabourRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
