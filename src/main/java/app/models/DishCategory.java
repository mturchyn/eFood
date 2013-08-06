package app.models;

import org.javalite.activejdbc.LazyList;
import org.javalite.activejdbc.Model;
import org.javalite.activejdbc.annotations.Table;

import java.util.List;


public class DishCategory extends Model {
    private List<Dish> listOfDishes = null;

    public void setListOfDishes(List<Dish> listOfDishes) {
        this.listOfDishes = listOfDishes;
    }

    public List<Dish> getListOfDishes() {
        return this.listOfDishes;
    }

}
