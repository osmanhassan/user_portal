package com.bit_mascot.user_portal.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class LoginController {

    @RequestMapping(value={"/","/login"})
    public Object login(Model model){
        return "login";
    }
}
