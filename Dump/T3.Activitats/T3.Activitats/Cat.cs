using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T3.Activitats
{
    public class Cat
    {
        public string Name { get; set; }
        public int Age { get; set; }
        public string Breed { get; set; }
        public string FavFood { get; set; }

        public Cat(string name, int age, string breed, string favFood)
        {
            this.Name = name;
            this.Age = age;
            this.Breed = breed;
            this.FavFood = favFood;
        }

        public void MakeMeowSound() { }

        public void Play() { }

        public void Wash() { }

        public void Eat() { }

        public void Hunt() { }
    }
}
