using System;

internal class DiferenciaGranPetit
{
    public static void Main(string[] args)
    {
        int userNum1 = 0;
        int userNum2 = 0;
        int resultat = 0;

        userNum1 = int.Parse(Console.ReadLine());
        userNum2 = int.Parse(Console.ReadLine());

        resultat = (userNum1) - (userNum2);

        resultat = CheckNegatives(resultat);

        Console.WriteLine(resultat);
    }

    public static int CheckNegatives(int num)
    {
        return (num < 0) ? -num : num;
    }
}