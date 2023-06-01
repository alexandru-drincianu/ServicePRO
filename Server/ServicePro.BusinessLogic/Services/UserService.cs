using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.DataProtection;
using ServicePro.BusinessLogic.DTOs.Pagination;
using ServicePro.BusinessLogic.DTOs.Users;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.Common.Enums;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using ServicePro.ThirdPartyProviders.TwilioServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        private readonly IValidator<ClientDTO> _clientValidator;
        private readonly IDataProtector _dataProtector;
        private readonly ISmsService _smsService;
        private readonly IUnitOfWork _unitOfWork;

        public UserService(IUnitOfWork unitOfWork, IMapper mapper, IValidator<ClientDTO> clientValidator, IDataProtectionProvider protectionProvider, ISmsService smsService)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _clientValidator = clientValidator;
            _dataProtector = protectionProvider.CreateProtector("Affiliate_PlanI");
            _smsService = smsService;
        }

        public async Task<IEnumerable<UserDTO>> GetAll()
        {
            var users = await _unitOfWork.UserRepository.GetAll();
            return _mapper.Map<IEnumerable<UserDTO>>(users);
        }

        public async Task<List<ClientDTO>> GetAllClients()
        {
            var users = (await _unitOfWork.UserRepository.GetAllClients()).Where(user => user.Role == UserRole.Client);
            return _mapper.Map<List<ClientDTO>>(users);
        }

        public async Task<ClientDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var user = await _unitOfWork.UserRepository.GetUserByIdAsync(Id);
            return _mapper.Map<ClientDTO>(user);

        }

        public async Task<UserDTO> CreateClientAccount(ClientDTO client)
        {
            if (await _unitOfWork.UserRepository.AnyAsync(user => user.Username == client.Username))
            {
                throw new Exception("Username already exists");
            }

            if (await _unitOfWork.UserRepository.AnyAsync(user => user.Email == client.Email))
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

            await _unitOfWork.UserRepository.AddAsync(user);


            var createdUser = await _unitOfWork.UserRepository.Find(user => user.Username == client.Username);

            return _mapper.Map<UserDTO>(createdUser);
        }

        public async Task<ClientDTO> UpdateAsync(ClientDTO item, int id)
        {
            _unitOfWork.CreateTransaction();
            try
            {
                var user = await _unitOfWork.UserRepository.GetUserByIdAsync(id);
                if (user == null)
                {
                    throw new Exception("User not found");
                }

                var newAddress = _mapper.Map<Address>(item.Address);
                if (user.Address == null)
                {
                    await _unitOfWork.AddressRepository.AddAsync(newAddress);
                    user.AddressId = newAddress.Id;
                }
                else
                {
                    newAddress.Id = (int)user.AddressId;
                    await _unitOfWork.AddressRepository.UpdateAsync(newAddress, (int)user.AddressId);
                }

                user.Notes = item.Notes;
                user.Email = item.Email;
                user.TelephoneNumber = item.TelephoneNumber;

                await _unitOfWork.UserRepository.UpdateAsync(user, id);
                _unitOfWork.CommitTransaction();
                return item;
            } catch (Exception)
            {
                _unitOfWork.RollbackTransaction();
                throw new Exception("Failed updating user");
            }
            

        }

        public async Task<UserDTO> RemoveAsync(int userId, bool applyChanges = true)
        {
            var user = await _unitOfWork.UserRepository.GetByIdAsync(userId);
            if (user != null)
            {
                await _unitOfWork.UserRepository.RemoveAsync(user);

                return _mapper.Map<UserDTO>(user);
            }
            return null;
        }

        public async Task<UserDTO> RemoveByAdminAsync(int userId, int loggedInUserId)
        {
            var loggedInUser = await _unitOfWork.UserRepository.GetByIdAsync(loggedInUserId);
            if (loggedInUser.Role != UserRole.Admin)
            {
                throw new Exception(string.Format("Only administrators can delete this user!"));
            }
            var user = await _unitOfWork.UserRepository.GetByIdAsync(userId);
            if (user != null)
            {
                await _unitOfWork.UserRepository.RemoveAsync(user);
                return _mapper.Map<UserDTO>(user);
            }
            return null;
        }

        public async Task<PaginatedListResponseDto<UserDTO>> GetUsersPaginatedAsync(PaginatedListRequest paginatedRequest)
        {
            paginatedRequest.SearchTerm = paginatedRequest.SearchTerm.Trim();
            var baseQuery = await _unitOfWork.UserRepository.GetAll();

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
