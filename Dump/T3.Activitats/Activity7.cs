public class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}

public class Bike
{
    private int idBike;
    private string nameBike;
    private string modelBike;

    public int GetIdBike() { return this.idBike; }
    public string GetNameBike() { return this.nameBike; }
    public string GetModelBike() { return this.modelBike; }

    public void SetIdBike(int id) {  this.idBike = id; }
    public void SetNameBike(string name) { this.nameBike = name; }
    public void SetModeBike(string model) { this.modelBike = model; }


    public Bike()
    {
        this.SetIdBike(00);
        this.SetNameBike("none");
    }

    public Bike(int id)
    {
        this.SetIdBike(id);
    }

    public Bike(int id, string model)
    {
        this.SetIdBike(id);
        this.SetNameBike(model);
    }

    public Bike(int id, string name, string model)
    {
        this.SetIdBike(id);
        this.SetNameBike(name);
        this.SetModeBike(model);
    }
}