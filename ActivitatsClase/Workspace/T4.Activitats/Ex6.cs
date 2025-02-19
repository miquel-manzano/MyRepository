using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T4.Activitats
{
    internal class Ex6
    {
        public static void ExerciseMain()
        {
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
        }
    }
}
