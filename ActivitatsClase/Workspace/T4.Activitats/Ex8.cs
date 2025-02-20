using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T4.Activitats
{
    internal class Ex8
    {
        public static void ExerciseMain()
        {
            // a
            List<int> numsList = new List<int>();
            numsList.Add(5);
            numsList.Add(10);
            numsList.Add(15);
            numsList.Add(20);
            numsList.Add(25);
            Console.WriteLine("a");
            foreach (int i in numsList)
            {
                Console.WriteLine(i);
            }
            // b
            numsList.Add(30);
            Console.WriteLine("b");
            foreach (int i in numsList)
            {
                Console.WriteLine(i);
            }
            // c
            numsList.Insert(0, 7);
            Console.WriteLine("c");
            foreach (int i in numsList)
            {
                Console.WriteLine(i);
            }
            // d
            numsList.RemoveAt(numsList.IndexOf(15));
            Console.WriteLine("d");
            foreach (int i in numsList)
            {
                Console.WriteLine(i);
            }
            // e
            numsList.Sort();
            numsList.Reverse();
            Console.WriteLine("e");
            foreach (int i in numsList)
            {
                Console.WriteLine(i);
            }
            // f
            List<int> pairNums = numsList.Where(n => n % 2 == 0).ToList();
            Console.WriteLine("f");
            foreach (int i in pairNums)
            {
                Console.WriteLine(i);
            }
        }
    }
}
