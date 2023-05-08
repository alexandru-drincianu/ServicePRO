using AutoMapper;
using Dashboard.Core.Extensions;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.Common.Enums;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class UserService : IUserService
    {
        private readonly IRepository<User> _userRepository;
        private readonly IMapper _mapper;

        public UserService(IRepository<User> userRepository, IMapper mapper)
        {
            _userRepository = userRepository;
            _mapper = mapper;
        }

        public async Task<IEnumerable<UserDTO>> GetAll()
        {
            var users = await _userRepository.GetAll();
            return _mapper.Map<IEnumerable<UserDTO>>(users);
        }

        public async Task<UserDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var user = await _userRepository.GetByIdAsync(Id);
            return _mapper.Map<UserDTO>(user);

        }

        public async Task<UserDTO> UpdateAsync(UserDTO item, int id, bool applyChanges = true)
        {
            var order = _mapper.Map<User>(item);
            await _userRepository.UpdateAsync(order, id);

            return item;

        }

        public async Task<UserDTO> RemoveAsync(int userId, bool applyChanges = true)
        {
            var user = await _userRepository.GetByIdAsync(userId);
            if (user != null)
            {
                await _userRepository.RemoveAsync(user);

                return _mapper.Map<UserDTO>(user);
            }
            return null;
        }

        public async Task<UserDTO> RemoveByAdminAsync(int userId, int loggedInUserId)
        {
            var loggedInUser = await _userRepository.GetByIdAsync(loggedInUserId);
            if (loggedInUser.Role != UserRole.Admin)
            {
                throw new Exception(string.Format("Only administrators can delete this user!"));
            }
            var user = await _userRepository.GetByIdAsync(userId);
            if (user != null)
            {
                await _userRepository.RemoveAsync(user);
                return _mapper.Map<UserDTO>(user);
            }
            return null;
        }

        public async Task<PaginatedListResponseDto<UserDTO>> GetUsersPaginatedAsync(PaginatedListRequest paginatedRequest)
        {
            paginatedRequest.SearchTerm = paginatedRequest.SearchTerm.Trim();
            var baseQuery = await _userRepository.GetAll();

            if (!string.IsNullOrEmpty(paginatedRequest.SearchTerm))
            {
                baseQuery = baseQuery.Where(o => o.FullName.Contains(paginatedRequest.SearchTerm));
            }

            var itemsCount = baseQuery.Count();

            var items = baseQuery
            .OrderBy(o => o.Username)
            .Skip(paginatedRequest.PageIndex * paginatedRequest.ItemsNumber)
            .Take(paginatedRequest.ItemsNumber)
            .Select(u => new UserDTO()
            {
                Id = u.Id,
                Username = u.Username,
                Role = u.Role,
                FullName = u.FullName,
            })
            .ToList();

            return new PaginatedListResponseDto<UserDTO> { RowsCount = itemsCount, Data = items, };
        }
    }
}
