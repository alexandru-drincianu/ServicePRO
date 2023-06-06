using Microsoft.EntityFrameworkCore.Storage;
using ServcicePro.DataAccess.Repository;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Context;
using ServicePro.DataAccess.Repository.Abstraction;
using System;
using System.Threading.Tasks;

namespace ServicePro.DataAccess.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ServiceProDbContext _dbContext;
        private IDbContextTransaction _transaction;

        #region repos
        public IUserRepository UserRepository { get; }
        public IVehicleRepository VehicleRepository { get; }
        public IAddressRepository AddressRepository { get; }
        public IWorkorderRepository WorkorderRepository { get; }
        public IWorkorderItemRepository WorkorderItemRepository { get; }
        public IConsumableRepository ConsumableRepository { get; }
        public ILabourRepository LabourRepository { get; }

        #endregion

        public UnitOfWork(ServiceProDbContext dbContext)
        {
            _dbContext = dbContext;
            UserRepository = new UserRepository(dbContext);
            VehicleRepository = new VehicleRepository(dbContext);
            AddressRepository = new AddressRepository(dbContext);
            WorkorderRepository = new WorkorderRepository(dbContext);
            WorkorderItemRepository = new WorkorderItemRepository(dbContext);
            ConsumableRepository = new ConsumableRepository(dbContext);
            LabourRepository = new LabourRepository(dbContext);
            
        }

        public int CommitChanges()
        {
            return _dbContext.SaveChanges();
        }

        public async Task<int> CommitChangesAsync()
        {
            return await _dbContext.SaveChangesAsync();
        }

        public void CreateTransaction()
        {
            if (_transaction == null)
            {
                _transaction = _dbContext.Database.BeginTransaction();
            }
            else
            {
                throw new InvalidOperationException("Transaction already exists! Use Rollback or Commit to close it.");
            }
        }

        public void RollbackTransaction()
        {
            _transaction?.Rollback();
            _transaction?.Dispose();
            _transaction = null;
        }

        public void CommitTransaction()
        {
            _transaction?.Commit();
            _transaction?.Dispose();
            _transaction = null;
        }
    }
}
