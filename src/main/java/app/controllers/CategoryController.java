package app.controllers;

import app.models.DishCategory;
import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.POST;


public class CategoryController extends AppController {
    public void index() {
        DishCategory.findAll();
        view("categories", DishCategory.findAll());
    }

    public void edit() {
        DishCategory category = (DishCategory) DishCategory.findById(getId());
        if (category != null) {
            view("category", category);
        } else {
            view("message", "are you trying to hack the URL?");
            render("/system/404");
        }
    }

    @POST
    public void updateCategory() {
        DishCategory category = (DishCategory) DishCategory.findById(getId());
        if (!param("price").matches("[0-9]+")) {
            flash("error", "Enter valid price(only digits)");
            view("category", category);
            redirect(CategoryController.class, "edit",category.getId());
        } else {
            category.set("price", param("price")).saveIt();
            flash("message", "Category " + category.get("category") + " was edit successful");
            redirect(CategoryController.class);
        }
    }
}
