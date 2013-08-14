package app.models;

import org.javalite.activejdbc.Model;
import org.javalite.activejdbc.annotations.Table;

import java.util.List;


public class DishCategory extends Model {
    public   List<Dish> listOfDishes=null;
    public void setListOfDishes(List<Dish> list){
        this.listOfDishes = list;
    }
    public List<Dish> getListOfDishes(){
        return listOfDishes;
    }


}
