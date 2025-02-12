using static Program;
using ClassLibrary;
using System.Collections;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography.X509Certificates;
using Microsoft.VisualBasic;

public class Program
{
    public delegate int Operacio(int a, int b);
    public delegate void Notificacio(string msg);

    
    public static int Multiplicar(int a, int b) { return a * b ; }
    public static int Dividir(int a, int b) { return a / b; }

    /*public static void ExecutarOperacio(int a, int b, Operacio op)
    {
        int result = op(a, b);
        Console.WriteLine(result);
    }*/

    public static int ExecutarOperacio(int a, int b, Operacio op) => op(a, b); // se puede poner valor de retorno y no hace falte el return, lambo goes crazy
    public static void MostrarMissatgeConsola(string msg) { Console.WriteLine(msg); }
    public static void MostrarMissatgeConsolaAmbEstrellas(string msg) { Console.WriteLine($"*******{msg}*******"); }

    public static void ExecutaAmbMetodeAnonim(Notificacio myMsg, string msg) { myMsg(msg); }

    private static void Main(string[] args)
    {
        Console.WriteLine("\r\n\r\n                                                        \r\n _____ ___      _____     _   _     _ _       _         \r\n|_   _| | |    |  _  |___| |_|_|_ _|_| |_ ___| |_ ___   \r\n  | | |_  |_   |     |  _|  _| | | | |  _| .'|  _|_ -|  \r\n  |_|   |_|_|  |__|__|___|_| |_|\\_/|_|_| |__,|_| |___|  \r\n                                                        \r\n\r\n");

        /*
        Notificacio myNotification;
        myNotification = MostrarMissatgeConsola;
        myNotification += MostrarMissatgeConsolaAmbEstrellas;

        myNotification("miaw");*/

        string myMessagge = "hola";

        ExecutaAmbMetodeAnonim((msg) => Console.WriteLine(msg), myMessagge);



        /*
        Func<int, int, double> pow = (a, b) => Math.Pow(a, b);
        Console.WriteLine(pow(2, 4));

        Operacio potenciaAnonima = (a, b) => (int)Math.Pow(a,b);
        Console.WriteLine(potenciaAnonima(2, 4));

        ExecutarOperacio(5, 5, Multiplicar);


        Action<string> printP = msg => Console.WriteLine(msg);

        Func<int, int, int> multiplicacio = (a, b) => a* b;
        Console.WriteLine(multiplicacio(5, 5));

        Action<int, int> printSuma = (a,b) => Console.WriteLine(a + b);
        printSuma(5, 5);
        */

        /*
        const string Name1 = "Jowi";
        const string Name2 = "Zoe";

        Console.WriteLine(Name1.CompareTo(Name2));
        Console.WriteLine(Name2.CompareTo(Name1));*/

        /*
        // Ex1
        Pair<string, int> StringIntP = new Pair<string, int>("miaw", 5);
        Pair<double, bool> DoubleBoolP = new Pair<double, bool>(99.99, true);
        StringIntP.ShowValues();
        DoubleBoolP.ShowValues();


        // Ex2
        var myArrayList = new ArrayList();

        bool flag = true;

        while (flag)
        {
            Console.WriteLine("Write value");
            myArrayList.Add(Console.ReadLine());
            Console.WriteLine("Exit? (y) (n) Default: (n)");
            if (Console.ReadLine() == "y")
            {
                flag = false;
            }
        }
        

        foreach (Object obj in myArrayList)
        {
            Console.Write("   {0} ", obj);
            Console.WriteLine();
        }


        // Ex3
        // No pueden haver dos nombres iguales???
        Dictionary<string, int> studentsName = new Dictionary<string, int>();

        flag = true;
        int count = 0;

        while (flag)
        {
            count ++;
            Console.WriteLine("Write student name:");
            studentsName.Add(Console.ReadLine(), count);
            Console.WriteLine("Exit? (y) (n) Default: (n)");
            if (Console.ReadLine() == "y")
            {
                flag = false;
            }
        }

        foreach (var item in studentsName)
        {
            Console.WriteLine($"{item.Key} {item.Value}");
            Console.WriteLine();
        }*/

        /*



        DateTime todayDate = DateTime.Today;
        string userIntput;
        DateTime userDate;
        bool isCorrect;
        do
        {
            Console.WriteLine("Escriu una data en format dd/mm/yyyy");
            userIntput = Console.ReadLine();
            isCorrect = DateTime.TryParse(userIntput, out userDate);
            if (!isCorrect)
            {
                Console.WriteLine("incorrecte");
            }
        } while (!isCorrect);





        int result = DateTime.Compare(userDate, todayDate);
        string relationship;

        if (result < 0)

        {
            Console.WriteLine("Data introducida es mas pequeña que actual");
            TimeSpan diferencia = todayDate - userDate;
            Console.WriteLine($"Diferencia de dies: {diferencia.Days}");
        }
        else if (result == 0)
        {
            Console.WriteLine("Data introducida es igual que actual");
        }
        else
        {
            Console.WriteLine("Data introducida es mas grande que actual");
            TimeSpan diferencia = userDate - todayDate;
            Console.WriteLine($"Diferencia de dies: {diferencia.Days}");
        }
        
        // Ex
        Operacio multiplicar = Multiplicar;
        Operacio dividir = Dividir;
        Console.WriteLine(dividir(15, 3));
        Console.WriteLine(multiplicar(5, 3));


         */
    }
}