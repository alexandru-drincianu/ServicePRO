using AutoMapper;
using Dashboard.Core.Extensions;
using ServicePro.BusinessLogic.DTOs;
using ServicePro.BusinessLogic.DTOs.Orders;
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
    public class OrderService : IOrderService
    {
        private readonly IRepository<Order> _orderRepository;
        private readonly IMapper _mapper;

        public OrderService(IRepository<Order> orderRepository, IMapper mapper)
        {
            _orderRepository = orderRepository;
            _mapper = mapper;
        }

        public async Task<IEnumerable<OrderDto>> GetAll()
        {
            var orders = await _orderRepository.GetAll();
            return _mapper.Map<IEnumerable<OrderDto>>(orders).Where(order => !order.IsDeleted);
        }

        public async Task<OrderDto> GetByIdAsync(int Id, bool applyChanges = true)
        {
            var order = await _orderRepository.GetByIdAsync(Id);
            return _mapper.Map<OrderDto>(order);

        }

        public async Task<OrderDto> AddAsync(OrderDto item, bool applyChanges = true)
        {
            var order = _mapper.Map<Order>(item);
            await _orderRepository.AddAsync(order);

            return item;

        }

        public async Task<OrderDto> UpdateAsync(OrderDto item, int id, bool applyChanges = true)
        {
            var order = _mapper.Map<Order>(item);
            await _orderRepository.UpdateAsync(order, id);

            return item;

        }

        public async Task<OrderDto> RemoveAsync(int orderId, bool applyChanges = true)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order != null)
            {
                order.IsDeleted = true;
                await _orderRepository.UpdateAsync(order, orderId);

                return _mapper.Map<OrderDto>(order);
            }
            return null;
        }

        public async Task<OrderDto> ArchiveAsync(int orderId, bool applyChanges = true)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order != null)
            {
                order.IsActive = false;
                await _orderRepository.UpdateAsync(order, orderId);

                return _mapper.Map<OrderDto>(order);
            }
            return null;
        }

        public async Task<PaginatedListResponseDto<OrderDto>> GetOrdersPaginatedAsync(int pageIndex, int itemsNumber, string sortField, string? sortDirection, OrderListFilterDto filter, bool applyChanges = true)
        {
            filter.SearchTerm = filter.SearchTerm?.Trim();
            var baseQuery = await _orderRepository.GetAll();

            if (!string.IsNullOrEmpty(filter.SearchTerm))
            {
                baseQuery = baseQuery.Where(o => o.Number.Contains(filter.SearchTerm) || o.Client.Contains(filter.SearchTerm));
            }

            var itemsCount = baseQuery.Count();

            var items = baseQuery
            .OrderByDynamic(sortField, sortDirection)
            .Where(o => !o.IsDeleted)
            .Skip(pageIndex * itemsNumber)
            .Take(itemsNumber)
            .Select(o => new OrderDto()
            {
                Id = o.Id,
                Number = o.Number,
                Client = o.Client,
                Capacity = o.Capacity,
                Value = o.Value,
                DeliveryDate = o.DeliveryDate,
                IsActive = o.IsActive,
                IsDeleted = o.IsDeleted
            })
            .ToList();

            return new PaginatedListResponseDto<OrderDto> { RowsCount = itemsCount, Data = items };
        }
    }
}
