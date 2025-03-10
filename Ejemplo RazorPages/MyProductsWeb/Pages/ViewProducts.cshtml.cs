using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MyProductsWeb.Model;
using System.Diagnostics;
using System.Globalization;
using FileWork = System.IO;

namespace MyProductsWeb.Pages
{
    public class ViewProductsModel : PageModel
    {
        public string FileErrorMessage;
        public List<Product> Products { get; set; }
        public void OnGet()
        {
            Products = new List<Product>();
            string filePath = "./Data/products.txt";
            if (FileWork.File.Exists(filePath))
            {
                string[] lines = FileWork.File.ReadAllLines(filePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split('|');
                    if (parts.Length == 4)
                    {
                        Product product = new Product();
                        // Control de errores
                        product.Id = int.Parse(parts[0]);
                        product.Name = parts[1];
                        product.Amount = int.Parse(parts[2]);
                        product.Price = decimal.Parse(parts[3],CultureInfo.InvariantCulture);
                        Products.Add(product);
                    }
                    else
                    {
                        FileErrorMessage = "Error, product attributes exception";
                    }
                }
            }
            else
            {
                FileErrorMessage = "Error, missing file";
            }
        }
    }
}
