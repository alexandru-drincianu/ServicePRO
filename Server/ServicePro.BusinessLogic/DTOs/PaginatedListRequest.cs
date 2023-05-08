namespace ServicePro.BusinessLogic.DTOs
{
    public class PaginatedListRequest
    {
        public int PageIndex { get; set; }
        public int ItemsNumber { get; set; }
        public string SearchTerm { get; set; }
    }
}
