package app.entities;

import app.models.Menu;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 03.08.13
 * Time: 8:07
 * To change this template use File | Settings | File Templates.
 */
public class WeeklyMenus {
    private List<Menu> listOfMenu = null;
    private Date date;

    public List<Menu> getListOfMenu() {
        return listOfMenu;
    }

    public void setListOfMenu(List<Menu> listOfMenu) {
        this.listOfMenu = listOfMenu;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
