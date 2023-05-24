using Microsoft.EntityFrameworkCore;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository
{
    public class AddressRepository : Repository<Address>, IAddressRepository
    {
        private readonly ServiceProDbContext _context;
        public AddressRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
