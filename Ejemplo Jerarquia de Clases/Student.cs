public class Student : Person
{
    private int numberStudent;

    public int GetNumberStudent() { return numberStudent; }

    public void SetNumberStudent(int number) { this.numberStudent = number; }


    public Student()
    {
        this.SetNumberStudent(00);
    }

    public Student(int number, string name) : base(name)
    {
        this.SetNumberStudent(number);
    }
    public override string GetName()
    {
        return "Mi nombre es: " + base.GetName();
    }
}


