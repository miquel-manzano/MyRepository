using System;
using System.Globalization;

internal class Program
{
    public static void Main(string[] args)
    {
        int numA = int.Parse(Console.ReadLine());
        int numB = int.Parse(Console.ReadLine());

        if (numA + 1 == numB || numB + 1 == numA)
        {
            Console.WriteLine("SI");
        }
        else
        {
            Console.WriteLine("NO");
        }
    }
}
