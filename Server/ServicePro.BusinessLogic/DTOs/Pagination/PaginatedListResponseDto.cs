using System.Collections.Generic;

namespace ServicePro.BusinessLogic.DTOs.Pagination
{
    public class PaginatedListResponseDto<T> where T : class
    {
        public int RowsCount { get; set; }
        public List<T> Data { get; set; }
    }
}
