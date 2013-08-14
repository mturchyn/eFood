package app.controllers;

import app.models.Book;
import app.models.DishCategory;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.DELETE;
import org.javalite.activeweb.annotations.GET;
import org.javalite.activeweb.annotations.POST;

import java.io.IOException;
import java.util.HashMap;

import static javax.security.auth.login.Configuration.getConfiguration;


public class CategoryController extends AppController {

    public void index() {
        view("categories", DishCategory.findAll());
    }

    @GET
    public void getAllCategoriesAjax() {
        if (isXhr()) {
            String categoriesJson = DishCategory.findAll().toJson(true, "id", "category", "price");
            respond(categoriesJson).contentType("json;charset=utf-8").status(200);
        }
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
    public void update() {
        DishCategory category = (DishCategory) DishCategory.findById(getId());
        category.set("price", param("price"));
        category.set("category", param("category"));
        if (validateData(category)) {
            category.saveIt();
            flash("message", "Category " + category.get("category") + " was edit successful");
            redirect(CategoryController.class);
        } else {
            flash("error", "Enter valid price(only digits)");
            view("category", category);
            redirect(CategoryController.class, "edit", category.getId());
        }
    }

    @POST
    public void create() {
        DishCategory category = new DishCategory();
        category.fromMap(params1st());
        if (validateData(category)) {
            category.saveIt();
            flash("message", "New category \"" + category.get("category") + "\" was added: ");
            redirect(CategoryController.class);
        } else {
            flash("message", "Something went wrong, please  fill out all fields, and check price(only digits)");
            flash("params", params1st());
            redirect(CategoryController.class, "new_category");
        }
    }

    public void newCategory() {

    }

    private boolean validateData(DishCategory category) {
        try {
            if (!((String) category.get("category")).isEmpty() && ((String) category.get("price")).matches("[0-9]+"))
                return true;
            else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @POST
    public void delete() {
        DishCategory category = (DishCategory) DishCategory.findById(getId());
        String title = category.getString("category");
        category.delete();
        flash("message", "Category: '" + title + "' was deleted");
        redirect(CategoryController.class);
    }
}