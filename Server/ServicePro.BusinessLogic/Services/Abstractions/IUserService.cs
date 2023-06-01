using ServicePro.BusinessLogic.DTOs.Pagination;
using ServicePro.BusinessLogic.DTOs.Users;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services.Abstractions
{
    public interface IUserService
    {
        public Task<IEnumerable<UserDTO>> GetAll();
        public Task<ClientDTO> UpdateAsync(ClientDTO item, int id);
        public Task<UserDTO> RemoveAsync(int orderId, bool applyChanges = true);
        public Task<ClientDTO> GetByIdAsync(int Id, bool applyChanges = true);
        public Task<PaginatedListResponseDto<UserDTO>> GetUsersPaginatedAsync(PaginatedListRequest paginatedRequest);
        public Task<UserDTO> RemoveByAdminAsync(int userId, int loggedInUserId);
        public Task<List<ClientDTO>> GetAllClients();
        public Task<UserDTO> CreateClientAccount(ClientDTO clientDTO);
    }
}
