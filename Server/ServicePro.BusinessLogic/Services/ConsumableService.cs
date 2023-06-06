using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class ConsumableService : IConsumableService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public ConsumableService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IEnumerable<ConsumableDTO>> GetAll()
        {
            var consumables = await _unitOfWork.ConsumableRepository.GetAll();
            return _mapper.Map<IEnumerable<ConsumableDTO>>(consumables);
        }

        public async Task<ConsumableDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var consumable = await _unitOfWork.ConsumableRepository.GetByIdAsync(Id);
            return _mapper.Map<ConsumableDTO>(consumable);

        }

        public async Task<ConsumableDTO> AddAsync(ConsumableDTO item, bool applyChanges = true)
        {
            var consumable = _mapper.Map<Consumable>(item);
            await _unitOfWork.ConsumableRepository.AddAsync(consumable);

            return item;

        }

        public async Task<ConsumableDTO> UpdateAsync(ConsumableDTO item, int id, bool applyChanges = true)
        {
            var consumable = _mapper.Map<Consumable>(item);
            await _unitOfWork.ConsumableRepository.UpdateAsync(consumable, id);

            return item;

        }

        public async Task<ConsumableDTO> RemoveAsync(int id, bool applyChanges = true)
        {
            var consumable = await _unitOfWork.ConsumableRepository.GetByIdAsync(id);
            if (consumable != null)
            {
                await _unitOfWork.ConsumableRepository.RemoveAsync(consumable);

                return _mapper.Map<ConsumableDTO>(consumable);
            }
            return null;
        }
    }
}
