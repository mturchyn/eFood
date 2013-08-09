package app.logic;

import org.junit.Test;

import java.util.Calendar;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 08.08.13
 * Time: 18:30
 * To change this template use File | Settings | File Templates.
 */
public class DateUtilsTest {
    @Test
    public void testGetPastMonday() throws Exception {
        Calendar instance = Calendar.getInstance();
        instance.set(Calendar.DAY_OF_WEEK, 1);

        System.out.println("instance = " + instance.getTime());
        Calendar pastMonday = DateUtils.getPastMonday(instance);
        System.out.println(pastMonday.getTime());
    }
}
