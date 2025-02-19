namespace T4.Activitats
{
    public class Ex3
    {
        public static void ExerciseMain()
        {
            // No pueden haver dos nombres iguales, ya que lo usamos como identificador unico.
            Dictionary<string, int> studentsName = new Dictionary<string, int>();

            bool flag = true;
            int count = 0;

            while (flag)
            {
                count++;
                Console.WriteLine("Write student name:");
                studentsName.Add(Console.ReadLine(), count);
                Console.WriteLine("Do you want to Exit??");
                Console.WriteLine("[y] Yes [n] No (el valor predetermindao es \"n\"):");
                if (Console.ReadLine() == "y")
                {
                    flag = false;
                }
            }

            foreach (var item in studentsName)
            {
                Console.WriteLine($"{item.Key} {item.Value}");
                Console.WriteLine();
            }
        }
    }
}
