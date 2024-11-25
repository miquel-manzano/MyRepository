using System;


internal class Program
{
    public static void Main(string[] args)
    {
        int gradeNum = int.Parse(Console.ReadLine());

        if (gradeNum >= 0 && gradeNum <= 4)
        {
            Console.WriteLine("Suspes");
        }
        else if (gradeNum >= 5 && gradeNum <= 6)
        {
            Console.WriteLine("Aprovat");
        }
        else if (gradeNum >= 7 && gradeNum <= 8)
        {
            Console.WriteLine("Notable");
        }
        else if (gradeNum >= 9 && gradeNum <= 10)
        {
            Console.WriteLine("Excelent");
        }
    }
}
