namespace T4.Activitats
{
    public class Ex1
    {
        public static void ExerciseMain()
        {
        Pair<string, int> StringIntP = new Pair<string, int>("miaw", 5);
        Pair<double, bool> DoubleBoolP = new Pair<double, bool>(99.99, true);
        StringIntP.ShowValues();
        DoubleBoolP.ShowValues();
        }

    }
}
