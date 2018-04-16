package assignmentproject
import org.joda.time.DateTime
import org.joda.time.Days
import org.joda.time.Months
import org.joda.time.Period
import org.joda.time.Weeks;
import org.joda.time.format.DateTimeFormat

import java.text.SimpleDateFormat
import java.time.LocalDate
import java.time.Month;
import java.util.Calendar;
import java.util.Date;

class SalaryController {

//    def index() {
//        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
//        String fromDay = "20-02-2017";
//        String toDay = "27-05-2017";
//
//        Date fromDate = formatter.parse(fromDay);
//        Date toDate = formatter.parse(toDay);
//
//       int countDay = countDay(fromDate, toDate)
//        render countDay
//    }
//
//
//    def countDay(Date fromDate, Date toDate){
//        DateTime startDate = new DateTime(fromDate)
//        DateTime endDate = new DateTime(toDate).plusDays(1)
//
//
//        int days = Days.daysBetween(startDate , endDate).getDays()
//        int numberOfMonth = Months.monthsBetween(startDate, endDate ).getMonths()
//
//        println("Days between $startDate and $endDate: are "+ days)
//        println("Month number"+numberOfMonth)
//
//        while(startDate.isBefore(endDate)){
//            println(startDate.toString("MMM/yyyy"));
//            startDate = startDate.plus(Period.months(1));
//        }
//
//        return days
//    }

}
