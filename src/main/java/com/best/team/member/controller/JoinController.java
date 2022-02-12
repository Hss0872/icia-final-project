package com.best.team.member.controller;


import com.best.team.member.bean.Member;
import com.best.team.member.service.JoinMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
@Slf4j
public class JoinController {
    ModelAndView mav;

    @Autowired
    private JoinMM joinMM;

    @RequestMapping(value = "/dupleCheck", produces = "application/json;utf-8",
            method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> dupleCheck(@RequestBody() Member member) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        return joinMM.dupleCheck(member) ? ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                body(objectMapper.writeValueAsString("1")) :
                ResponseEntity.ok(objectMapper.writeValueAsString("0"));
    }

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public ModelAndView joinComplete(Member member, RedirectAttributes rttr){
        mav = joinMM.joinComplete(member, rttr);
        return mav;
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("community");
//        return mav;
    }

}
