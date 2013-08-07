package app.controllers;

import org.javalite.activeweb.AppController;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Collection;

/**
 * Created with IntelliJ IDEA.
 * User: Artem
 * Date: 05.08.13
 * Time: 16:58
 * To change this template use File | Settings | File Templates.
 */
public class AdminController extends AppController {
    public void index() {
        view("name",SecurityContextHolder.getContext().getAuthentication().getName());
    }
}
