using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class WorkorderItemService : IWorkorderItemService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public WorkorderItemService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IEnumerable<WorkorderItemDTO>> GetAll()
        {
            var workorderItems = await _unitOfWork.WorkorderItemRepository.GetAll();
            return _mapper.Map<IEnumerable<WorkorderItemDTO>>(workorderItems);
        }

        public async Task<WorkorderItemDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var workorderItem = await _unitOfWork.WorkorderItemRepository.GetByIdAsync(Id);
            return _mapper.Map<WorkorderItemDTO>(workorderItem);

        }

        public async Task<WorkorderItemDTO> AddAsync(WorkorderItemDTO item, bool applyChanges = true)
        {
            var workorderItem = _mapper.Map<WorkorderItem>(item);
            await _unitOfWork.WorkorderItemRepository.AddAsync(workorderItem);

            return item;

        }

        public async Task<WorkorderItemDTO> UpdateAsync(WorkorderItemDTO item, int id, bool applyChanges = true)
        {
            var workorderItem = _mapper.Map<WorkorderItem>(item);
            await _unitOfWork.WorkorderItemRepository.UpdateAsync(workorderItem, id);

            return item;

        }

        public async Task<WorkorderItemDTO> RemoveAsync(int workorderItemId, bool applyChanges = true)
        {
            var workorderItem = await _unitOfWork.WorkorderItemRepository.GetByIdAsync(workorderItemId);
            if (workorderItem != null)
            {
                await _unitOfWork.WorkorderItemRepository.RemoveAsync(workorderItem);

                return _mapper.Map<WorkorderItemDTO>(workorderItem);
            }
            return null;
        }
    }
}
