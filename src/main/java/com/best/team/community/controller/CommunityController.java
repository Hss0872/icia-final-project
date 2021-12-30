package com.best.team.community.controller;

import com.best.team.community.bean.Member;
import com.best.team.community.service.MemberMM;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {

    @RequestMapping()
    public String community(){
        return "community";

    }



}