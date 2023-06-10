using ServicePro.DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ServcicePro.DataAccess.Repository.Abstraction
{
    public interface IVehicleRepository
    {
        Task<List<Vehicle>> GetVehiclesAsync();
        Task<List<Vehicle>> GetVehiclesForUserAsync(int userId);
        Task<Vehicle> GetVehicleByIdAsync(int id);
        Task<Vehicle> GetVehicleByLicensePlateAsync(string licensePlate);
        Task AddAsync(Vehicle item, bool applyChanges = true);
        Task UpdateAsync(Vehicle item, int id, bool applyChanges = true);
        Task RemoveAsync(Vehicle item, bool applyChanges = true);
        Task RemoveRangeAsync(IEnumerable<Vehicle> items, bool applyChanges = true);
        Task<IQueryable<Vehicle>> GetAll();
        Task<List<Vehicle>> GetAllAsync();
        Task<Vehicle?> Find(Expression<Func<Vehicle, bool>> predicate);
        Task<bool> AnyAsync(Expression<Func<Vehicle, bool>> predicate);
        Task<Vehicle> GetByIdAsync<TId>(TId id);
    }
}
