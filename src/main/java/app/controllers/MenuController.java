package app.controllers;

import app.entities.Week;
import app.entities.WeeklyMenus;
import app.logic.DateUtils;
import app.models.*;
import org.codehaus.jackson.map.ObjectMapper;
import org.javalite.activejdbc.LazyList;
import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.POST;

import java.io.IOException;
import java.io.StringWriter;
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

    public void getWeeklyMenuAsJson() {
        if (xhr()) {
            ObjectMapper mapper = new ObjectMapper();
            try {
                String menuForWeekAsJson = mapper.writeValueAsString(getMenusForWeek());
                respond(menuForWeekAsJson).contentType("application/json").status(200);
            } catch (IOException e) {
                // todo
            }
        } else {
            flash("error", "big Error");
        }
    }

    private List<Menu> getMenusForWeek() {
        Calendar cal = DateUtils.getPastMonday();
        Date monday = cal.getTime();
        cal.add(Calendar.DAY_OF_MONTH, 6);
        Date sunday = cal.getTime();
        return Menu.where("date >= ? and date <= ?", DateUtils.formatDate(monday), DateUtils.formatDate(sunday));
    }

    public void viewAllMenu() {


    }

    public void newMenu() {
        List<DishCategory> l = DishCategory.findAll();
        DishCategory dishCategory = DishCategory.findFirst("category=?", "side_dishes");
        List<DishCategory> listOfCategories = new ArrayList<DishCategory>(l);
        for (int t = 0; t < listOfCategories.size(); t++) {
            if (listOfCategories.get(t).get("category").equals("side_dishes")) {
                listOfCategories.add(t, dishCategory);
                break;
            }

        }
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
        if (days != null) {
            String allDaysFlashMessage;
            int weekLength = days.length;

            List<DishCategory> dishCategories = DishCategory.findAll();


            for (int dayCounter = 0; dayCounter < weekLength; dayCounter++) {


                Iterator<DishCategory> iterator = dishCategories.iterator();
                int day = Integer.valueOf(days[dayCounter]);
                String DATE_FORMAT = "yyyy-MM-dd";
                //;
                SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
                try {
                    Date menuDate = sdf.parse(params1st()
                            .get("date"));

                    GregorianCalendar gregorianCalendar = new GregorianCalendar();
                    gregorianCalendar.setTime(menuDate);
                    Menu menu = new Menu();
                    menu.set("date", gregorianCalendar.get(Calendar.YEAR) + "-" + (gregorianCalendar.get(Calendar.MONTH) + 1) + "-" + (gregorianCalendar.get(Calendar.DAY_OF_MONTH) + day));
                    menu.saveIt();
                    while (iterator.hasNext()) {
                        DishCategory dishCategory = iterator.next();
                        String categoryName = (String) dishCategory.get("category");
                        if (!categoryName.equals("side_dishes")) {
                            String s = params().get(categoryName)[day];
                            if (!s.equals("...")) {
                                MenuHasDish.createIt("menu_id", menu.getId(), "dishes_id", Integer.parseInt(s));
                            } else {
                            }
                        } else {
                            String firstSideDish = params().get(categoryName)[day * 2];
                            String secondSideDish = params().get(categoryName)[day * 2 + 1];
                            if (!firstSideDish.equals(secondSideDish)) {

                                if (!firstSideDish.equals("...")) {
                                    MenuHasDish.createIt("menu_id", menu.getId(), "dishes_id", Integer.parseInt(firstSideDish));
                                } else {
                                }

                                if (!secondSideDish.equals("...")) {
                                    MenuHasDish.createIt("menu_id", menu.getId(), "dishes_id", Integer.parseInt(secondSideDish));
                                } else {

                                }
                            } else {
                                if (!firstSideDish.equals("...")) {
                                    MenuHasDish.createIt("menu_id", menu.getId(), "dishes_id", Integer.parseInt(firstSideDish));
                                } else {
                                }
                            }

                        }
                    }
                } catch (ParseException e) {
                    redirect(MenuController.class, "newMenu");
                }
            }
            flash("message", "New menu was created");
            redirect(MenuController.class);
        } else {
            flash("message", "Something went wrong, please  fill out anything fields");
        }
    }
}
