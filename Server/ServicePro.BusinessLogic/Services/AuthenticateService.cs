using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Helpers.TokenAuthentication;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class AuthenticateService : IAuthenticateService
    {
        private readonly IRepository<User> _userRepository;
        private readonly IMapper _mapper;
        private readonly ITokenManager _tokenManager;

        public AuthenticateService(IRepository<User> userRepository, IMapper mapper, ITokenManager tokenManager)
        {
            _userRepository = userRepository;
            _mapper = mapper;
            _tokenManager = tokenManager;
        }

        public async Task<User> Login(LoginDTO loginModel)
        {
            var user = _tokenManager.Authenticate(loginModel.Username, loginModel.Password);
            return await Task.FromResult(_mapper.Map<User>(user));
        }

        public async Task<User> Register(UserDTO item, bool applyChanges = true)
        {
            if(await _userRepository.AnyAsync(user => user.Username == item.Username))
            {
                throw new Exception("Username already exists");
            }
            var user = _mapper.Map<User>(item);
            await _userRepository.AddAsync(user);

            var createdUser = await _userRepository.Find(user => user.Username == item.Username);

            return createdUser;
        }
    }
}
