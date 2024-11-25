using System;


internal class Program
{
    public static void Main(string[] args)
    {
        int c1 = int.Parse(Console.ReadLine());
        int c2 = int.Parse(Console.ReadLine());
        int c3 = int.Parse(Console.ReadLine());

        if (c1 == c2 && c2 == c3)
        {
            Console.WriteLine("SI");
        }
        else
        {
            Console.WriteLine("NO");
        }
    }
}
