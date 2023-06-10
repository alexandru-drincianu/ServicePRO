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
    public class InvoiceRepository : Repository<Invoice>, IInvoiceRepository
    {
        private readonly ServiceProDbContext _context;
        public InvoiceRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<Invoice> GetInvoiceByIdAsync(int invoiceId)
        {
            return await _context.Set<Invoice>()
                .Include(i => i.Workorder).ThenInclude(w => w.Vehicle).ThenInclude(v => v.User).ThenInclude(u => u.Address)
                .FirstOrDefaultAsync(i => i.Id == invoiceId);
        }

        public async Task<List<Invoice>> GetAllAsync()
        {
            return await _context.Set<Invoice>()
                .Include(i => i.Workorder).ThenInclude(w => w.Vehicle).ThenInclude(v => v.User).ThenInclude(u => u.Address)
                .OrderByDescending(i => i.CreatedDate)
                .ToListAsync();
        }
    }
}
