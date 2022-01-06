package com.best.team.member.controller;

import com.best.team.member.bean.Member;
import com.best.team.member.service.MemberMM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {

    ModelAndView mav;

    @Autowired
    private MemberMM memberMM;


    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String access() {
        return "joinFrm";
    }

    @GetMapping(value = "emailconfirm")   //restController
    public ModelAndView confirmEmail(Member member, RedirectAttributes ettr){
        mav  = memberMM.checkValue(member, ettr);
        return mav;
    }



}
