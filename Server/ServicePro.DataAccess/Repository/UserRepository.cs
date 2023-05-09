using Microsoft.EntityFrameworkCore;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;
using ServicePro.DataAccess.Repository.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        private readonly ServiceProDbContext _context;
        public UserRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<List<User>> GetAllClients()
        {
            return await _context.Set<User>().Include(user => user.Address).ToListAsync();
        }
    }
}
