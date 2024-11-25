using System;

internal class Program
{
    public static void Main(string[] args)
    {
        const string MsgCorrect1 = "Correcte per un any no bixest!";
        const string MsgCorrect2 = "Correcte per un any bixest!";
        const string MsgError = "Incorrecte!";

        bool isCorrect;

        int userNum = int.Parse(Console.ReadLine());

        UserNumInput(userNum, 1, 365, out isCorrect);
        if (isCorrect)
        {
            Console.WriteLine(MsgCorrect1);
        }
        else if (userNum == 366)
        {
            Console.WriteLine(MsgCorrect2);
        }
        else
        {
            Console.WriteLine(MsgError);
        }
    }

    public static void UserNumInput(int userNum, int min, int max, out bool isCorrect) // SUPERMEGA UTIL FUNCIO ñam
    {
        isCorrect = true;
        if ((userNum < min || userNum > max))
        {
            isCorrect = false;
        }
    }
}
