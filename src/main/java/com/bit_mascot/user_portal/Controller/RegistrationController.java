package com.bit_mascot.user_portal.Controller;

import com.bit_mascot.user_portal.DAO.RoleDao;
import com.bit_mascot.user_portal.DAO.UserDao;
import com.bit_mascot.user_portal.Entity.RoleEntity;
import com.bit_mascot.user_portal.Entity.UserEntity;
import com.bit_mascot.user_portal.Service.UpUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Optional;

@Controller
public class RegistrationController {

    @Autowired
    UpUserService upUserService;

    @GetMapping("/registration")
    public Object formGet(Model model) {
        model.addAttribute("user", new UserEntity());
        return "registration";
    }

    @PostMapping("/registration")
    public Object formPost(@Valid @ModelAttribute("user")UserEntity user, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) throws Exception {
        if (bindingResult.hasErrors()) {
            return "registration";
        } else {
            redirectAttributes.addFlashAttribute("successMessage", "You have registered successfully.");
            upUserService.saveUser(user);
            return new ModelAndView("redirect:/");
        }
    }
}
