using System.Collections;

namespace T4.Activitats
{
    public class Ex2
    {
        public static void ExerciseMain()
        {
            var myArrayList = new ArrayList();

            bool flag = true;

            while (flag)
            {
                Console.WriteLine("Write value");
                myArrayList.Add(Console.ReadLine());
                Console.WriteLine("Do you want to Exit??");
                Console.WriteLine("[y] Yes [n] No (el valor predetermindao es \"n\"):");
                if (Console.ReadLine() == "y")
                {
                    flag = false;
                }
            }


            foreach (var obj in myArrayList)
            {
                Console.Write("   {0} ", obj);
                Console.WriteLine();
            }
        }
    }
}
