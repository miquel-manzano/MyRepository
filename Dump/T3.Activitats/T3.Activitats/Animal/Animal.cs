using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace T3.Activitats.Animal
{
    public class Animal
    {
        public int Id {  get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public Animal(int id, string name, string description)
        {
            this.Id = id;
            this.Name = name;
            this.Description = description;
        }
    }
}
