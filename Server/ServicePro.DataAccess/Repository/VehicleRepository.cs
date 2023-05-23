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
    public class VehicleRepository : Repository<Vehicle>, IVehicleRepository
    {
        private readonly ServiceProDbContext _context;
        public VehicleRepository(ServiceProDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<List<Vehicle>> GetVehiclesAsync()
        {
            return await _context.Set<Vehicle>().Include(vehicle => vehicle.User).ToListAsync();
        }

        public async Task<Vehicle> GetVehicleByIdAsync(int id)
        {
            return await _context.Set<Vehicle>().Include(vehicle => vehicle.User).Where(vehicle => vehicle.Id == id).FirstOrDefaultAsync();
        }

        public async Task<Vehicle> GetVehicleByLicensePlateAsync(string licensePlate)
        {
            return await _context.Set<Vehicle>().Include(vehicle => vehicle.User).Where(vehicle => vehicle.Registration.ToUpper() == licensePlate).FirstOrDefaultAsync();
        }
    }
}
