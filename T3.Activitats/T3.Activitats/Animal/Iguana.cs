using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T3.Activitats.Animal
{
    public class Iguana : Animal
    {
        public double Roughness { get; set; }

        public Iguana(int id, string name, string description, double roughness) : base(id, name, description)
        {
            this.Roughness = roughness;
        }

        public void ChangeSkin() { }
    }
}
