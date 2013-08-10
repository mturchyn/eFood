package app.entities;

import app.models.Menu;

import java.util.ArrayList;
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
    private String mondayDate;
                                 //todo delete
    public WeeklyMenus(){

    }

    public WeeklyMenus(ArrayList<Menu> listOfMenu, String mondayDate){
        this.listOfMenu=listOfMenu;
        this.mondayDate=mondayDate;
    }

    public List<Menu> getListOfMenu() {
        return listOfMenu;
    }

    public void setListOfMenu(List<Menu> listOfMenu) {
        this.listOfMenu = listOfMenu;
    }


    public String getMondayDate() {
        return mondayDate;
    }

    public void setMondayDate(String mondayDate) {
        this.mondayDate = mondayDate;
    }
}
