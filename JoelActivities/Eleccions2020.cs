using System;
using System.Globalization;

internal class Program
{
    public static void Main(string[] args)
    {
        /* Boe Jiden Tonald Drump Sernie Banders */
        int JidenNum = int.Parse(Console.ReadLine());
        int DrumpNum = int.Parse(Console.ReadLine());
        int BandersNum = int.Parse(Console.ReadLine());

        if (JidenNum > DrumpNum && JidenNum > BandersNum)
        {
            Console.WriteLine("Jiden");
        }
        else if (DrumpNum > JidenNum && DrumpNum > BandersNum)
        {
            Console.WriteLine("Drump");
        }
        else if (BandersNum > JidenNum && BandersNum > DrumpNum)
        {
            Console.WriteLine("Banders");
        }

    }
}
