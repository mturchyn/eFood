package app.controllers;

import java.util.List;
import app.models.Menu;
import org.junit.Test;

/**
 * Created with IntelliJ IDEA.
 * User: Artem
 * Date: 11.08.13
 * Time: 0:51
 * To change this template use File | Settings | File Templates.
 */
public class MenuControllerTest {
    @Test
    public void testGetMenusForWeek() throws Exception {
//      MenuController a=new MenuController();
//        List<Menu> q=a.getMenusForWeek();
//        System.out.println(q);
        Menu.findAll();
    }
}
