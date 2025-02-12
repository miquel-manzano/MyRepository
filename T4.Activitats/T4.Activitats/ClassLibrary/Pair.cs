using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Pair<T1, T2>
    {
        public T1 Value1 { get; set; }
        public T2 Value2 { get; set; }

        public Pair(T1 value1, T2 value2)
        {
            this.Value1 = value1;
            this.Value2 = value2;
        }

        public void ShowValues()
        {
            Console.WriteLine($"El valor: {Value1} es tipus: {Value1.GetType()}, i el valor: {Value2} es tipus: {Value2.GetType()}");
        }
    }
}
