using AutoMapper;
using Dashboard.Core.Extensions;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.Common.Enums;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using ServicePro.ThirdPartyProviders.TwilioServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;
        private readonly IValidator<ClientDTO> _clientValidator;
        private readonly IDataProtector _dataProtector;
        private readonly ISmsService _smsService;

        public UserService(IUserRepository userRepository, IMapper mapper, IValidator<ClientDTO> clientValidator, IDataProtectionProvider protectionProvider, ISmsService smsService)
        {
            _userRepository = userRepository;
            _mapper = mapper;
            _clientValidator = clientValidator;
            _dataProtector = protectionProvider.CreateProtector("Affiliate_PlanI");
            _smsService = smsService;
        }

        public async Task<IEnumerable<UserDTO>> GetAll()
        {
            var users = await _userRepository.GetAll();
            return _mapper.Map<IEnumerable<UserDTO>>(users);
        }

        public async Task<List<ClientDTO>> GetAllClients()
        {
            var users = (await _userRepository.GetAllClients()).Where(user => user.Role == UserRole.Client);
            return _mapper.Map<List<ClientDTO>>(users);
        }

        public async Task<UserDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var user = await _userRepository.GetByIdAsync(Id);
            return _mapper.Map<UserDTO>(user);

        }

        public async Task<UserDTO> CreateClientAccount(ClientDTO client)
        {
            if (await _userRepository.AnyAsync(user => user.Username == client.Username))
            {
                throw new Exception("Username already exists");
            }

            if (await _userRepository.AnyAsync(user => user.Email == client.Email))
            {
                throw new Exception("Account with this email already exists");
            }

            var validationResult = _clientValidator.Validate(client);

            if (!validationResult.IsValid)
            {
                var validationFailures = "";
                foreach (var failure in validationResult.Errors)
                {
                    validationFailures += failure + "\n";
                }
                throw new Exception(validationFailures);
            }

            var user = _mapper.Map<ClientDTO, User>(client);

            user.Role = UserRole.Client;
            user.Password = GenerateRandomPassword();

            var message = $"ServicePRO: Your account password is {user.Password}";

            var resultError = await _smsService.Send(user.TelephoneNumber, message);

            if(resultError != null)
            {
                throw new Exception($"Twilio: {resultError}");
            }

            user.Password = _dataProtector.Protect(user.Password);

            await _userRepository.AddAsync(user);


            var createdUser = await _userRepository.Find(user => user.Username == client.Username);

            return _mapper.Map<UserDTO>(createdUser);
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
        private static string GenerateRandomPassword()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var password = new string(Enumerable.Repeat(chars, 8)
                                                  .Select(s => s[random.Next(s.Length)])
                                                  .ToArray());
            return password;
        }
    }

    
}
