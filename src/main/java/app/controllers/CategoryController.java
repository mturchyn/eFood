package app.controllers;

import app.models.DishCategory;
import org.javalite.activeweb.AppController;


public class CategoryController extends AppController {
    public void index(){
       DishCategory.findAll();
        view("categories", DishCategory.findAll());
    }

    public void edit(){
        DishCategory category = (DishCategory) DishCategory.findById(getId());
        if(category != null){
            view("category", category);
        }else{
            view("message", "are you trying to hack the URL?");
            render("/system/404");
        }
    }
}
