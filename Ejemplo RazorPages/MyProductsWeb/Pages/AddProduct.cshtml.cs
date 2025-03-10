using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MyProductsWeb.Model;

namespace MyProductsWeb.Pages
{
    public class AddProductModel : PageModel
    {
        [BindProperty]
        public Product NewProduct { get; set; }
        public void OnGet()
        {
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            string filePath = "Data/products.txt";
            string productSt = $"\n{NewProduct.Id}|{NewProduct.Name}|{NewProduct.Amount}|{NewProduct.Price}";
            if(System.IO.File.Exists(filePath))
            {
                System.IO.File.AppendAllText(filePath, productSt + Environment.NewLine);
            }// ToDo Error message
            else
            {
                Debug.WriteLine($"-------->File error: {filePath} not found");
            }
            return Page();
        }
    }
}
