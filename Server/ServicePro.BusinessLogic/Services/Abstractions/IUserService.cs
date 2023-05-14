using ServicePro.BusinessLogic.DTOs;
using ServicePro.BusinessLogic.DTOs.Orders;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IUserService
    {
        public Task<IEnumerable<UserDTO>> GetAll();
        public Task<UserDTO> UpdateAsync(UserDTO item, int id, bool applyChanges = true);
        public Task<UserDTO> RemoveAsync(int orderId, bool applyChanges = true);
        public Task<UserDTO> GetByIdAsync(int Id, bool applyChanges = true);
        public Task<PaginatedListResponseDto<UserDTO>> GetUsersPaginatedAsync(PaginatedListRequest paginatedRequest);
        public Task<UserDTO> RemoveByAdminAsync(int userId, int loggedInUserId);
        public Task<List<ClientDTO>> GetAllClients();
        public Task<UserDTO> CreateClientAccount(ClientDTO clientDTO);
    }
}
