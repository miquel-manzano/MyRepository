using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T3.Activitats.Animal
{
    public class Wolf : Animal
    {
        public string TeamName { get; set; }

        public Wolf(int id, string name, string description, string TeamName) : base(id, name, description)
        {
            this.TeamName = name;
        }
    }
}
