using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T4.Activitats
{
    public class Ex7
    {
        public static void ExerciseMain()
        {
            ArrayList MyArrayList = new ArrayList();
            MyArrayList.Add("Maria");
            MyArrayList.Add("Joan");
            MyArrayList.Add("Anna");
            MyArrayList.Add(42);
            MyArrayList.Add(true);

            Console.WriteLine("\nArrayList sense cambis\n");
            foreach(var item in MyArrayList)
            {
                Console.WriteLine(item.ToString());
            }
            Console.WriteLine();

            MyArrayList.RemoveAt(MyArrayList.IndexOf(42, 0));
            MyArrayList.RemoveAt(MyArrayList.IndexOf(true, 0));
            MyArrayList.Insert(1, "Pere");

            Console.WriteLine("\nArrayList amb cambis\n");
            foreach (var item in MyArrayList)
            {
                Console.WriteLine(item.ToString());
            }
            Console.WriteLine();

            Console.WriteLine(MyArrayList.Contains("Anna") ? "Anna is on the list" : "Anna is not on the list");
            Console.WriteLine(MyArrayList.ToString());
        }
    }
}
