using ServcicePro.DataAccess.Repository.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.DataAccess.Repository.Abstraction
{
    public interface IUnitOfWork
    {
        int CommitChanges();
        Task<int> CommitChangesAsync();
        void CreateTransaction();
        void RollbackTransaction();
        void CommitTransaction();
        IUserRepository UserRepository { get; }
        IVehicleRepository VehicleRepository { get; }
        IAddressRepository AddressRepository { get; }
        IWorkorderRepository WorkorderRepository { get; }
        IWorkorderItemRepository WorkorderItemRepository { get; }
        IConsumableRepository ConsumableRepository { get; }
        ILabourRepository LabourRepository { get; }

    }
}
