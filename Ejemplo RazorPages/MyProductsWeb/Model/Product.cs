using System.ComponentModel.DataAnnotations;

namespace MyProductsWeb.Model
{
    public class Product
    {
        [Required(ErrorMessage = "Mandatory camp")]
        [Range(1,9999999, ErrorMessage = "Id has to be at least 8 and cannot be 0")]
        public int Id { get; set; }
        public string? Name { get; set; }
        public int Amount { get; set; }
        public decimal Price { get; set; }

        /*public Product() { }
        public Product(int id, string? name, int amount, decimal price)
        {
            this.Id = id;
            this.Name = name;
            this.Amount = amount;
            this.Price = price;
        }*/
    }
}
