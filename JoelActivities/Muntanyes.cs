using System;
using System.Globalization;

internal class Program
{
    public static void Main(string[] args)
    {
        int f1 = int.Parse(Console.ReadLine());
        int f2 = int.Parse(Console.ReadLine());
        int f3 = int.Parse(Console.ReadLine());
        int f4 = int.Parse(Console.ReadLine());
        int f5 = int.Parse(Console.ReadLine());

        if (f1 < f2 && f5 < f4 && (f2 < f3 || f2 > f3) && (f4 < f3 || f4 > f3))
        {
            Console.WriteLine("SI");
        }
        else
        {
            Console.WriteLine("NO");
        }
    }
}
