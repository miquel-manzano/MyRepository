using System;


internal class Program
{
    public static void Main(string[] args)
    {
        int a = int.Parse(Console.ReadLine());
        int b = int.Parse(Console.ReadLine());
        int c = int.Parse(Console.ReadLine());
        int n = int.Parse(Console.ReadLine());

        if (n == a || n == b || n == c )
        {
            Console.WriteLine("NO");
        }
        else
        {
            Console.WriteLine("SI");
        }
    }
}
