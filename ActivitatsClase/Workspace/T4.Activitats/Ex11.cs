using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T4.Activitats
{
    internal class Ex11
    {
        public static void ExerciseMain()
        {

        }

        public static string CurrentWeekNum()
        {
            DateTime currentDate = DateTime.Now;
            return TranslateWeekDay(currentDate.DayOfWeek);
        }

        public static string TranslateWeekDay(DayOfWeek day)
        {
            return day switch
            {
                DayOfWeek.Monday => "Dilluns",
                DayOfWeek.Tuesday => "Dimarts",
                DayOfWeek.Wednesday => "Dimecres",
                DayOfWeek.Thursday => "Dijous",
                DayOfWeek.Friday => "Divendres",
                DayOfWeek.Saturday => "Dissabte",
                DayOfWeek.Sunday => "Diumenge",
                _ => "Desconegut"
            };
        }
    }
}
