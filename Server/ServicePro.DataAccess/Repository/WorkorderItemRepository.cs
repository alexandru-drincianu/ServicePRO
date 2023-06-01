using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;

namespace ServcicePro.DataAccess.Repository
{
    public class WorkorderItemRepository : Repository<WorkorderItem>, IWorkorderItemRepository
    {
        private readonly ServiceProDbContext _context;
        public WorkorderItemRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
