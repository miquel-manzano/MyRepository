using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T3.Activitats.Animal
{
    public class Turtle : Animal
    {
        public int AgeStatus { get; set; }
        public Turtle(int id, string name, string description, int ageStatus) : base(id, name, description)
        {
            this.AgeStatus = ageStatus;
        }

        public void Hide() { }
    }
}
