public class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}

public class Card
{
    private int idCard;
    private string nameCard;
    private string symbolCard;

    public int GetIdCard() { return this.idCard; }
    public string GetNameCard() { return this.nameCard; }
    public string GetSymbolCard() { return this.symbolCard; }

    public void SetIdCard(int id) { this.idCard = id; }
    public void SetNameCard(string name) { this.nameCard = name; }
    public void SetSymbolCard(string symbol) { this.symbolCard = symbol; }


    public Card(int id, string name, string symbol)
    {
        this.SetIdCard(id);
        this.SetNameCard(name);
        this.SetSymbolCard(symbol);
    }


    public class Lamp
    {
        private int idLamp;
        private string nameLamp;
        private string modelLamp;

        public int GetIdLamp() { return this.idLamp; }
        public string GetNameLamp() { return this.nameLamp; }
        public string GetModelLamp() { return this.modelLamp; }

        public void SetIdLamp(int id) { this.idLamp = id; }
        public void SetNameLamp(string name) { this.nameLamp = name; }
        public void SetModelLamp(string model) { this.modelLamp = model; }


        public Lamp(int id, string name, string model)
        {
            this.SetIdLamp(id);
            this.SetNameLamp(name);
            this.SetModelLamp(model);
        }
    }

    public class Flight
    {
        private int idFlight;
        private string nameFlight;
        private string destinationFlight;

        public int GetIdFlight() { return this.idFlight; }
        public string GetNameFlight() { return this.nameFlight; }
        public string GetDestinationFlight() { return this.destinationFlight; }

        public void SetIdFlight(int id) { this.idFlight = id; }
        public void SetNameFlight(string name) { this.nameFlight = name; }
        public void SetDestinationFlight(string destination) { this.destinationFlight = destination; }


        public Flight(int id, string name, string destination)
        {
            this.SetIdFlight(id);
            this.SetNameFlight(name);
            this.SetDestinationFlight(destination);
        }
    }

}