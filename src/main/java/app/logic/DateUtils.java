package app.logic;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 07.08.13
 * Time: 12:35
 * To change this template use File | Settings | File Templates.
 */
public final class DateUtils {

    private DateUtils() {}

    private static final String DATE_FORMAT = "yyyy-MM-dd";

    public static Calendar getPastMonday() {
       return getPastMonday(Calendar.getInstance());
    }

    public static Calendar getPastMonday(Calendar cal) {
        int dayWeekNumber = cal.get(Calendar.DAY_OF_WEEK);
        if (isNotSunday(dayWeekNumber)) {
            cal.set(Calendar.DAY_OF_WEEK, 2);
        } else {
            cal.add(Calendar.DAY_OF_MONTH, -6);
        }
        return cal;
    }

    private static boolean isNotSunday(int dayWeekNumber) {
        return dayWeekNumber != 1;
    }

    public static String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
        return sdf.format(date);

    }
}
