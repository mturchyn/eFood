package app.models;

import org.javalite.activejdbc.LazyList;
import org.javalite.activejdbc.Model;
import org.javalite.activejdbc.annotations.Many2Many;

import java.util.jar.Attributes;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 05.08.13
 * Time: 5:15
 * To change this template use File | Settings | File Templates.
 */
@Many2Many(other = Dish.class, join = "menu_has_dishes", sourceFKName = "menu_id", targetFKName = "dishes_id")
public class Menu extends Model {

    public String getJSON() {

        String listOfDishesJSON = this.getAll(Dish.class).toJson(true, "id", "name", "description", "dish_categories_id");
        return ("{\"id\": \""+ this.get("id")+"\",\"date\": \""+ this.get("date")+"\",\"listOfDishes\":" +listOfDishesJSON+"}");
//        return listOfDishesJSON;
    }


}
