package com.best.team.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityWriteController {

    @RequestMapping("/board/write")
    public String communityWrite() {
        return "boardWriter_modify";
    }
}