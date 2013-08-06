package app.controllers;

import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.GET;
import org.javalite.activeweb.annotations.POST;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.WebAttributes;
import org.springframework.web.context.request.WebRequest;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.GregorianCalendar;

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

        Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        if (authorities != null) {
            for (GrantedAuthority role : authorities) {
                if (role.getAuthority().equals(ROLE_ADMIN)) {
                    redirect(CategoryController.class);
                } else if (role.getAuthority().equals(ROLE_USER)) {
                    redirect(BooksController.class);
                }
            }
        }
    }
}
