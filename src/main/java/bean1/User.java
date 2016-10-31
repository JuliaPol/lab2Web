package bean1;

import javax.servlet.http.HttpSession;

/**
 * Created by Julia on 01.11.2016.
 */
public class User {
    private String name;
    private String auth;
    private String mark;

    public User() {
        this.auth="1";
    }
    public User(String name, String auth) {
        this.name = name;
        this.auth = auth;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static User get(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            user = new User();
            session.setAttribute("user", user);
        }
        return user;
    }
}
