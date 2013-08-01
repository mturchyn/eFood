package app.controllers;

import app.models.Dish;
import org.javalite.activeweb.AppController;

/**
 * Created with IntelliJ IDEA.
 * User: test
 * Date: 01.08.13
 * Time: 14:35
 * To change this template use File | Settings | File Templates.
 */
public class MenuController extends AppController {
    public void index(){

    }
    public void new_Menu(){
        view("categories","");
    }
}
