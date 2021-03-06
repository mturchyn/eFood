package app.controllers;

import app.entities.Week;
import app.entities.WeeklyMenus;
import app.logic.CategoriesUtil;
import app.logic.DateUtils;
import app.models.*;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.javalite.activejdbc.LazyList;
import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.GET;
import org.javalite.activeweb.annotations.POST;

import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
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

    @POST
    public void qqq(){
        if (isXhr()) {
            try {
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!"+param("date"));
                ObjectWriter writer = new ObjectMapper().defaultPrettyPrintingWriter();
                String menuForWeekAsJson=writer.writeValueAsString("good");
                respond(menuForWeekAsJson).contentType("json;charset=utf-8").status(200);
            } catch (IOException e) {
                // todo
                e.printStackTrace();
            }
        } else {
            flash("error", "big Error");
        }
    }


    @GET
    public void getWeeklyMenuToAjax() {

        if (isXhr()) {
            try {
                ObjectWriter writer = new ObjectMapper().defaultPrettyPrintingWriter();
                String menuForWeekAsJson=writer.writeValueAsString(getMenusForWeek());
                respond(menuForWeekAsJson).contentType("json;charset=utf-8").status(200);
            } catch (IOException e) {
                // todo
                e.printStackTrace();
            }
        } else {
            flash("error", "big Error");
        }
    }


    public List<Menu> getMenusForWeek() {
        Calendar cal = DateUtils.getPastMonday();
        Date monday = cal.getTime();
        cal.add(Calendar.DAY_OF_MONTH, 6);
        Date sunday = cal.getTime();
//        return Menu.where("date >= ? and date <= ?", DateUtils.formatDate(monday), DateUtils.formatDate(sunday));// todo delete comment
        return Menu.findAll();
    }

    public void adminViewAllMenu() {


    }

    public void newMenu() {
        List<DishCategory> listOfCategories = CategoriesUtil.getDishCategoriesWithDishesList();
        view("listOfCategories", listOfCategories);
        view("listOfDays", Week.values());


    }



    @POST
    public void create() {
        String[] days = params().get("day");
        if (days != null) {
            final int weekLength = days.length;

            List<DishCategory> dishCategories = DishCategory.findAll();


            for (int dayCounter = 0; dayCounter < weekLength; dayCounter++) {


                int day = Integer.valueOf(days[dayCounter]);
                String DATE_FORMAT = "yyyy-MM-dd";
                //;
                SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
                try {
                    Date menuDate = sdf.parse(params1st().get("date"));

                    GregorianCalendar gregorianCalendar = new GregorianCalendar();
                    gregorianCalendar.setTime(menuDate);
                    Menu menu = new Menu();
                    menu.set("date", gregorianCalendar.get(Calendar.YEAR) + "-" + (gregorianCalendar.get(Calendar.MONTH) + 1) + "-" + (gregorianCalendar.get(Calendar.DAY_OF_MONTH) + day));
                    menu.saveIt();
                    Iterator<DishCategory> dishCategoryIterator = dishCategories.iterator();
                    while (dishCategoryIterator.hasNext()) {
                        DishCategory dishCategory = dishCategoryIterator.next();
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

    public static void main(String[] args) {
        int a = a();
        System.out.println(a);
    }

    private static int a() {
        try {
            System.out.println();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            return 2;
        } finally {
            System.out.println("asd");
            return 3;
        }
    }

}
