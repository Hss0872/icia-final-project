package com.best.team.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityWriteController {

    @RequestMapping("/write")
    public String communityWrite() {
        return "communityWrite";
    }
}