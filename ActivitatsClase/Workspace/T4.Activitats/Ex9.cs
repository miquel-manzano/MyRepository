namespace T4.Activitats
{
    internal class Ex9
    {
        public static void ExerciseMain()
        {
            // No pueden haver dos nombres iguales, ya que lo usamos como identificador unico.
            Dictionary<string, int> studentsDic = new Dictionary<string, int>();
            studentsDic.Add("Marc", 21);
            studentsDic.Add("Laura", 19);
            studentsDic.Add("Pau", 22);
            foreach (var item in studentsDic)
            {
                Console.WriteLine($"{item.Key}: {item.Value}");
            }

            Console.WriteLine("Escriu un nom:");
            string userName = Console.ReadLine();
            if (studentsDic.ContainsKey(userName))
            {
                Console.WriteLine($"{userName}: {studentsDic[userName]}");
            }

            studentsDic.Remove("Laura");

            foreach (var item in studentsDic)
            {
                Console.WriteLine($"{item.Key}: {item.Value}");
            }
        }
    }
}
