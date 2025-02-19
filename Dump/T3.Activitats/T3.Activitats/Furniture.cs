using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace T3.Activitats
{
    public class Furniture
    {
        public float Weight {  get; set; }
        public double Price { get; set; }
        public bool Set {  get; set; }
        public string Name { get; set; }
        public string Material { get; set; }
        public string Colour { get; set; }

        public Furniture(float weight, double price, bool set, string name, string material, string colour)
        {
            this.Weight = weight;
            this.Price = price;
            this.Set = set;
            this.Name = name;
            this.Material = material;
            this.Colour = colour;
        }
    }
}
