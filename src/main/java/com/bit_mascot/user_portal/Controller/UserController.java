package com.bit_mascot.user_portal.Controller;

import com.bit_mascot.user_portal.DAO.UserDao;
import com.bit_mascot.user_portal.Service.UpUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
public class UserController {

    @Autowired
    UpUserService upUserService;
    @Autowired
    UserDao userDao;

    @GetMapping("/profile")
    public Object getUser(Model model, Principal principal){
        String userEmail = principal.getName();
        model.addAttribute("user", userDao.findByEmailAndRoleId(userEmail, 2));
        return "profile";
    }

    @GetMapping("/admin")
    public Object userList(Model model, HttpServletRequest request){
        model.addAttribute("users", userDao.findByRoleId(2));
        return "list";
    }

    @PostMapping("/is-unique-email")
    @ResponseBody
    public Object UniqueEmailChecker(@RequestParam("email") String email){
        return upUserService.isUniqueEmail(email);
    }

    @GetMapping("/change-password")
    public Object changePasswordView(Model model){ return "change-password"; }

    @PostMapping("/change-password")
    public Object savePassWord(HttpServletRequest request, Principal principal,
                               RedirectAttributes  redirectAttributes, Model model) throws Exception {
        String userEmail = principal.getName();
        String errorMessage = upUserService.getChangePasswordErrorMessage(request, userEmail);
        if(errorMessage.equals("")){
            redirectAttributes.addFlashAttribute("successMessage", "Password has been changed.");
            upUserService.saveUserPassword(request, userEmail);
            return new ModelAndView("redirect:/profile");
        }
        model.addAttribute("errorMessage", errorMessage);
        return "change-password";
    }



}
