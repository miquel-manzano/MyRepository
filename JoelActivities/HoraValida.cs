using System;


internal class Program
{
    public static void Main(string[] args)
    {
        int h = int.Parse(Console.ReadLine());
        int m = int.Parse(Console.ReadLine());
        int s = int.Parse(Console.ReadLine());


        Console.WriteLine(ClockCheckH(h) && ClockCheck(m) && ClockCheck(s) ? "SI" : "NO");
    }

    public static bool ClockCheckH(int num)
    {
        if (num >= 0 && num < 24)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static bool ClockCheck(int num)
    {
        if (num >= 0 && num < 60)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
