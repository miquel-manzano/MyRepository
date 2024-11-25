using System;

internal class Program
{
    public static void Main(string[] args)
    {
        GameCore();        
    }

    public static void GameCore()
    {
        string MsgInvalidNum = "ERROR";
        bool isCorrect = true;
        int jugador1Num = UserNumInput(1, 3, ref isCorrect);
        int jugador2Num = UserNumInput(1, 3, ref isCorrect);

        if (isCorrect)
        {
            Console.WriteLine(FightResult(jugador1Num, jugador2Num));
        }
        else
        {
            Console.WriteLine(MsgInvalidNum);
        }
    }

    public static string FightResult(int jugador1Num, int jugador2Num)
    {
        const string MsgEmpate = "EMPATE";
        const string MsgJugador1Win = "Jugador1";
        const string MsgJugador2Win = "Jugador2";
        switch (jugador1Num - jugador2Num)
        {
            case -2:
                return MsgJugador1Win;
            case -1:
                return MsgJugador2Win;
            case 0:
                return MsgEmpate;
            case 1:
                return MsgJugador1Win;
            case 2:
                return MsgJugador2Win;
            default:
                return MsgEmpate;
        }
    }

    public static int UserNumInput(int min, int max, ref bool isCorrect) // SUPERMEGA UTIL FUNCIO ñam
    {
        int userNum;

        bool chekUserNum = int.TryParse(Console.ReadLine(), out userNum);

        if (!chekUserNum || (userNum < min || userNum > max))
        {
            isCorrect = false;
        }
        return userNum;
    }
}
