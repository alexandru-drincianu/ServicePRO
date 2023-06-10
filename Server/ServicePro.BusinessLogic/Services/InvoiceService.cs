using AutoMapper;
using ServicePro.BusinessLogic.DTOs.Invoices;
using ServicePro.BusinessLogic.DTOs.Orders;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.Common.Enums;
using ServicePro.DataAccess.Entities;
using ServicePro.DataAccess.Repository.Abstraction;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ServicePro.BusinessLogic.Services
{
    public class InvoiceService : IInvoiceService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public InvoiceService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<IEnumerable<InvoiceDTO>> GetAll()
        {
            var invoices = await _unitOfWork.InvoiceRepository.GetAllAsync();
            return _mapper.Map<IEnumerable<InvoiceDTO>>(invoices);
        }

        public async Task<InvoiceDTO> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var invoice = await _unitOfWork.InvoiceRepository.GetInvoiceByIdAsync(Id);
            return _mapper.Map<InvoiceDTO>(invoice);

        }

        public async Task<InvoiceDTO> AddAsync(InvoiceDTO item, bool applyChanges = true)
        {
            var invoice = _mapper.Map<Invoice>(item);
            await _unitOfWork.InvoiceRepository.AddAsync(invoice);

            return item;

        }

        public async Task<InvoiceDTO> CreateFromWorkorder(WorkorderDTO workorderDTO)
        {
            var workorder = await _unitOfWork.WorkorderRepository.GetWorkorderByIdAsync(workorderDTO.Id);
            workorder.Status = WorkorderStatus.Invoiced;
            workorder.DepartedDate = DateTime.Now;
            workorder.IsInvoiced = true;
            await _unitOfWork.WorkorderRepository.UpdateAsync(workorder, workorder.Id);

            var invoice = new Invoice
            {
                InvoiceStatus = InvoiceStatus.Open,
                CreatedDate = DateTime.Now,
                WorkorderId = workorder.Id,
                Number = $"INV-{workorder.Id}",
            };

            await _unitOfWork.InvoiceRepository.AddAsync(invoice);

            return _mapper.Map<InvoiceDTO>(invoice);

        }

        public async Task<InvoiceDTO> UpdateAsync(InvoiceDTO item, int id, bool applyChanges = true)
        {
            var invoice = _mapper.Map<Invoice>(item);
            await _unitOfWork.InvoiceRepository.UpdateAsync(invoice, id);

            return item;

        }

        public async Task<InvoiceDTO> RemoveAsync(int id, bool applyChanges = true)
        {
            var invoice = await _unitOfWork.InvoiceRepository.GetByIdAsync(id);
            if (invoice != null)
            {
                await _unitOfWork.InvoiceRepository.RemoveAsync(invoice);

                return _mapper.Map<InvoiceDTO>(invoice);
            }
            return null;
        }
    }
}
