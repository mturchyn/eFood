package app.models;

import org.javalite.activejdbc.Model;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 05.08.13
 * Time: 5:15
 * To change this template use File | Settings | File Templates.
 */
public class Menu extends Model {

    private HashMap<DishCategory,Dish> listOfDishes;
    private Date dateOfMonday;


    public HashMap<DishCategory, Dish> getListOfDishes() {
        return listOfDishes;
    }

    public void setListOfDishes(HashMap<DishCategory, Dish> listOfDishes) {
        this.listOfDishes = listOfDishes;
    }

    public Date getDate() {
        return dateOfMonday;
    }

    public void setDate(Date date) {
        this.dateOfMonday = date;
    }
}
