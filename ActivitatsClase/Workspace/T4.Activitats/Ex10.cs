using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T4.Activitats
{
    internal class Ex10
    {
        public static void ExerciseMain()
        {
            Console.WriteLine("**** Primera data ****");
            DateTime userDate1 = GetUserDate();
            Console.WriteLine("**** Segona data ****");
            DateTime userDate2 = GetUserDate();


            int result = DateTime.Compare(userDate1, userDate2);
            string relationship;

            if (result < 0)

            {
                Console.WriteLine("Primera data es mas pequeña que la segona");
                TimeSpan diferencia = userDate2 - userDate1;
                Console.WriteLine($"Diferencia de dies: {diferencia.Days}");
            }
            else if (result == 0)
            {
                Console.WriteLine("Primera data es igual que la segona data");
            }
            else
            {
                Console.WriteLine("Primera data es mas grande que la segona");
                TimeSpan diferencia = userDate1 - userDate2;
                Console.WriteLine($"Diferencia de dies: {diferencia.Days}");
            }
        }

        public static DateTime GetUserDate()
        {
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
            return userDate;
        }
    }
}
