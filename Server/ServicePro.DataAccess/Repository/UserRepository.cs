﻿using Microsoft.EntityFrameworkCore;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;
using System.Collections.Generic;
using System.Linq;
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

        public async Task<User> GetUserByIdAsync(int id)
        {
            return await _context.Set<User>().Include(user => user.Address).Where(user => user.Id == id).FirstOrDefaultAsync();
        }
    }
}
