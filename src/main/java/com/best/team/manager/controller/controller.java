package com.best.team.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controller {

    @RequestMapping("/manager")
    public String manager() {
        return "manager";
    }
}
