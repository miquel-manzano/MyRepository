public class Person
{
    private string namePerson { get; set; }

    public string GetNamePerson() { return namePerson; }
    public void SetNamePerson(string name) { this.namePerson = name; }


    public Person()
    {
        this.SetNamePerson("none");
    }
    public Person(string name)
    {
        this.SetNamePerson(name);
    }

    public virtual string GetName()
    {
        return this.GetName();
    }
}


