package app.controllers;

import app.entities.Week;
import app.models.*;
import org.javalite.activejdbc.LazyList;
import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.POST;

import javax.swing.text.html.HTMLDocument;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 01.08.13
 * Time: 14:35
 * To change this template use File | Settings | File Templates.
 */
public class MenuController extends AppController {
    public void index() {


    }

    public void newMenu() {
        List<DishCategory> listOfCategories = DishCategory.findAll();

        Iterator<DishCategory> iterator = listOfCategories.iterator();
        while (iterator.hasNext()) {
            DishCategory dc = iterator.next();
            List<Dish> listOfDishes = Dish.where("dish_categories_id = ?", dc.get("id"));
            dc.setListOfDishes(listOfDishes);
        }
        view("listOfCategories", listOfCategories);
        view("listOfDays", Week.values());


    }

    @POST
    public void create() {
        String[] days = params().get("day");
        if(days!=null){
            String allDaysFlashMessage;
        int weekLength = days.length;

        List<DishCategory> dishCategories = DishCategory.findAll();


        for (int dayCounter = 0; dayCounter < weekLength; dayCounter++) {


            Iterator<DishCategory> iterator = dishCategories.iterator();
            int day = Integer.valueOf(days[dayCounter]);
            String DATE_FORMAT = "yyyy-mm-dd";
            //;
            SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
            try {
                Date menuDate = sdf.parse(params1st()
                        .get("date"));

                GregorianCalendar gregorianCalendar = new GregorianCalendar();
                gregorianCalendar.setTime(menuDate);
                Menu menu = new Menu();
                menu.set("date",gregorianCalendar.get(Calendar.YEAR)+"-"+gregorianCalendar.get(Calendar.UNDECIMBER)+"-"+(gregorianCalendar.get(Calendar.DATE)+day));
                menu.saveIt();
                while (iterator.hasNext()) {
                    DishCategory dishCategory = iterator.next();
                    String categoryName = (String) dishCategory.get("category");
                    String s = params().get(categoryName)[day];
                    if(!s.equals("...")){
                        MenuHasDish.createIt("menu_id", menu.getId(),"dishes_id",Integer.parseInt(s));
                    }
                    else{}
                }
            } catch (ParseException e) {
                redirect(MenuController.class,"newMenu");
            }



        }
        flash("message", "New menu was created");
        redirect(MenuController.class);
        }
        else{
            flash("message", "Something went wrong, please  fill out anything fields");
        }
    }
}
