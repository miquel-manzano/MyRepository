using System;

namespace TestOOP
{
    public class Donut
    {
        private int calories;
        private string flavour;
        private float price;
        private float weight;

        public int GetCalories() { return this.calories; }
        public int GetFlavour() { return this.flavour; }
        public int GetPrice() { return this.price; }
        public int GetWeight() { return this.weight; }

        public void SetCalories(int calories) { this.calories = calories; }
        public void SetFlavour(int flavour) { this.flavour = flavour; }
        public void SetPrice(int price) { this.price = price; }
        public void SetWeight(int weight) { this.weight = weight; }


        public Donut(int calories, string flavour, float price, float weight)
        {
            this.SetCalories(calories);
            this.SetFlavour(flavour);
            this.SetPrice(price);
            this.SetWeight(weight);
        }
    }
}

