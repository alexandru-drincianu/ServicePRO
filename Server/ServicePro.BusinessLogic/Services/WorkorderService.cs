using AutoMapper;
using Dashboard.Core.Extensions;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.DTOs.Pagination;
using ServicePro.BusinessLogic.DTOs.Users;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository;
using ServicePro.DataAccess.Repository.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class WorkorderService : IWorkorderService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public WorkorderService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IEnumerable<WorkorderDTO>> GetAll()
        {
            var workorders = await _unitOfWork.WorkorderRepository.GetAllWorkordersAsync();
            return _mapper.Map<IEnumerable<WorkorderDTO>>(workorders);
        }

        public async Task<WorkorderDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var workorder = await _unitOfWork.WorkorderRepository.GetWorkorderByIdAsync(Id);
            return _mapper.Map<WorkorderDTO>(workorder);

        }

        public async Task<WorkorderDTO> AddAsync(WorkorderDTO item, bool applyChanges = true)
        {
            var workorder = _mapper.Map<Workorder>(item);
            await _unitOfWork.WorkorderRepository.AddAsync(workorder);
            workorder.Number = $"WO-{workorder.Id}";
            await _unitOfWork.CommitChangesAsync();
            return _mapper.Map<WorkorderDTO>(workorder);
        }

        public async Task<WorkorderDTO> UpdateAsync(WorkorderDTO item, int id, bool applyChanges = true)
        {
            var workorder = _mapper.Map<Workorder>(item);
            await _unitOfWork.WorkorderRepository.UpdateAsync(workorder, id);

            return item;

        }

        public async Task<WorkorderDTO> RemoveAsync(int workorderId, bool applyChanges = true)
        {
            var workorder = await _unitOfWork.WorkorderRepository.GetByIdAsync(workorderId);
            if (workorder != null)
            {
                await _unitOfWork.WorkorderRepository.RemoveAsync(workorder);

                return _mapper.Map<WorkorderDTO>(workorder);
            }
            return null;
        }
    }
}
