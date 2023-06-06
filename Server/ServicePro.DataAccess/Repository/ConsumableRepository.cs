using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;

namespace ServcicePro.DataAccess.Repository
{
    public class ConsumableRepository : Repository<Consumable>, IConsumableRepository
    {
        private readonly ServiceProDbContext _context;
        public ConsumableRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
