public class Teacher : Person
{
    private string titleTeacher;

    public string GetTitleTeacher() { return titleTeacher; }

    public void SetTitleTeacher(string title) {  this.titleTeacher = title; }


    public Teacher(string number, string name) : base(name)
    {
        this.SetTitleTeacher(number);
    }
}


