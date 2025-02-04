using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T3.Activitats.Vehicle
{
    public class Bike : WheeledVehicle
    {
        private string nameBike;
        private string modelBike;

        public string GetNameBike() { return nameBike; }
        public string GetModelBike() { return modelBike; }
        public void SetNameBike(string name) { nameBike = name; }
        public void SetModeBike(string model) { modelBike = model; }


        public Bike() : base(0)
        {
            SetNameBike("none");
        }

        public Bike(int id) : base(id) { }

        public Bike(int id, string model) : base(id)
        {
            SetNameBike(model);
        }

        public Bike(int id, string name, string model) : base(id)
        {
            SetNameBike(name);
            SetModeBike(model);
        }
    }
}
