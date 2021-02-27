package controller.nav;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import po.nav.NavF;
import service.nav.NavFService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/navController")
public class NavController {
    @Autowired
    NavFService navFService;


    @RequestMapping("/all_admin_index")
    public String query(Model model, HttpServletRequest request, @CookieValue(value = "username", required = false) String username) {
        /*String username="";
        Cookie[] cookies =request.getCookies();
        if(cookies!=null){
            System.out.println("判断cookie");
            for (Cookie cookie:cookies
                 ) {
                System.out.println(cookie.getName());
                if(cookie.getName().equals("username")){
                    username=cookie.getValue();
                }
            }
        }*/
        if (username == "" || username == null) {
            return "redirect:/userController/login";
        } else {
            int mark = 0;
            List<List<NavF>> lists = navFService.findAll(mark);
            model.addAttribute("lists", lists);
            model.addAttribute("username", username);
            return "all_admin_index";
        }

    }


}
