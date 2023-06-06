using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class LabourService : ILabourService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public LabourService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IEnumerable<LabourDTO>> GetAll()
        {
            var labours = await _unitOfWork.LabourRepository.GetAll();
            return _mapper.Map<IEnumerable<LabourDTO>>(labours);
        }

        public async Task<LabourDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var labour = await _unitOfWork.LabourRepository.GetByIdAsync(Id);
            return _mapper.Map<LabourDTO>(labour);

        }

        public async Task<LabourDTO> AddAsync(LabourDTO item, bool applyChanges = true)
        {
            var labour = _mapper.Map<Labour>(item);
            await _unitOfWork.LabourRepository.AddAsync(labour);

            return item;

        }

        public async Task<LabourDTO> UpdateAsync(LabourDTO item, int id, bool applyChanges = true)
        {
            var labour = _mapper.Map<Labour>(item);
            await _unitOfWork.LabourRepository.UpdateAsync(labour, id);

            return item;

        }

        public async Task<LabourDTO> RemoveAsync(int id, bool applyChanges = true)
        {
            var labour = await _unitOfWork.LabourRepository.GetByIdAsync(id);
            if (labour != null)
            {
                await _unitOfWork.LabourRepository.RemoveAsync(labour);

                return _mapper.Map<LabourDTO>(labour);
            }
            return null;
        }
    }
}
