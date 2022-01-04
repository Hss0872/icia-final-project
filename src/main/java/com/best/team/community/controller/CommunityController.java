package com.best.team.community.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {

    @RequestMapping()
    public String community(){
        return "community";

    }
}