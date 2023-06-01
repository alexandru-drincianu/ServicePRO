using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;

namespace ServcicePro.DataAccess.Repository
{
    public class WorkorderRepository : Repository<Workorder>, IWorkorderRepository
    {
        private readonly ServiceProDbContext _context;
        public WorkorderRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
