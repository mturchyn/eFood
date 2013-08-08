package app.controllers;

import app.models.DishCategory;
import app.models.User;
import org.javalite.activeweb.AppController;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

import java.util.Collection;

/**
 * Created with IntelliJ IDEA.
 * User: Artem
 * Date: 05.08.13
 * Time: 16:58
 * To change this template use File | Settings | File Templates.
 */
public class LoginController extends AppController {
    public final static String ROLE_ADMIN = "ROLE_ADMIN";
    public final static String ROLE_USER = "ROLE_USER";

    public void index() {
        render().noLayout();
        Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        if (!authorities.isEmpty()) {
            for (GrantedAuthority role : authorities) {
                if (role.getAuthority().equals(ROLE_ADMIN)) {
                    redirect(AdminController.class);
                } else if (role.getAuthority().equals(ROLE_USER)) {
                    redirect(UserController.class);
                }
            }
        }
    }

    public void loginFailure(){
        index();
    }
}
