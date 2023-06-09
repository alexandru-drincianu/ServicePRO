using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using System.Collections.Generic;
using System.Linq;
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

        public async Task<IEnumerable<WorkorderItemDTO>> GetAllForWorkorder(int workorderId)
        {
            var workorderItems = await _unitOfWork.WorkorderItemRepository.GetAllForWorkorderAsync(workorderId);
            return workorderItems.Select(wi => new WorkorderItemDTO
            {
                Id = wi.Id,
                ItemType = wi.ItemType,
                ConsumableId = wi.ConsumableId,
                LabourId = wi.LabourId,
                Quantity = wi.Quantity,
                Minutes = wi.Minutes,
                Description = wi.ConsumableId != null ? wi.Consumable.Description : wi.Labour.Description,
                Price = wi.ConsumableId != null ? wi.Consumable.Price * wi.Quantity : CalculateLabourPrice(wi.Labour.HourlyWage, wi.Minutes)
            }).ToList();
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

            var workorder = await _unitOfWork.WorkorderRepository.GetWorkorderByIdAsync(item.WorkorderId);
            var workorderItems = await _unitOfWork.WorkorderItemRepository.GetAllForWorkorderAsync(item.WorkorderId);

            workorder.TotalCost = CalculateWorkorderTotal(workorderItems);

            await _unitOfWork.WorkorderRepository.UpdateAsync(workorder, workorder.Id);

            return _mapper.Map<WorkorderItemDTO>(workorderItem);

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

        private decimal CalculateLabourPrice(decimal hourlyWage, int minutes)
        {
            int minutesPerHour = 60;
            decimal pricePerMinute = hourlyWage / minutesPerHour;
            decimal price = pricePerMinute * minutes;
            return price;
        }

        private decimal CalculateWorkorderTotal(List<WorkorderItem> workorderItems)
        {
            decimal totalCost = 0;
            foreach (var workorderItem in workorderItems)
            {
                if(workorderItem.LabourId != null && workorderItem.LabourId != 0)
                {
                    totalCost += CalculateLabourPrice(workorderItem.Labour.HourlyWage, workorderItem.Labour.Minutes);
                }
                if (workorderItem.ConsumableId != null && workorderItem.ConsumableId != 0)
                {
                    totalCost += workorderItem.Consumable.Price * workorderItem.Quantity;
                }
            }
            return totalCost;
        }
    }
}
