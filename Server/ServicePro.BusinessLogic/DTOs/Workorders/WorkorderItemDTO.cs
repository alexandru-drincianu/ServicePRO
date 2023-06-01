namespace ServicePro.BusinessLogic.DTOs.Orders
{
    public class WorkorderItemDTO
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public decimal Quantity { get; set; }
    }
}
