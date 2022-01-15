package com.best.team.member.controller;

import com.best.team.member.bean.Member;
import com.best.team.member.service.MemberMM;
import com.best.team.member.userClass.Tempkey;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Slf4j
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

    @GetMapping(value = "/emailconfirm")   //restController
    public ModelAndView confirmEmail(Member member, RedirectAttributes ettr){
        mav  = memberMM.checkValue(member, ettr);
        return mav;
    }

    @PostMapping(value ="/access")
    public ModelAndView access(Member member, HttpSession session, RedirectAttributes loginAtr){
        mav = memberMM.access(member, session, loginAtr);
        return mav;
    }

    @PostMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/community";
    }




    //아이디 찾기
    @PostMapping(value = "/id/search")
    @ResponseBody
    public ResponseEntity searchId(@RequestBody String json_value) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_value, Member.class);
        log.info("member:{}",member);

        ResponseEntity<?> result = null;
        String idSearch = memberMM.searchId(member);

        System.out.println("idSearch = " + idSearch);
        if(idSearch == "false"){
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("");
        }else{
            System.out.println("obj.writeValueAsString(idSearch) = " + obj.writeValueAsString(idSearch));
            result = ResponseEntity.ok(obj.writeValueAsString(idSearch));
        }
        return result;
    }



    //비번 찾기
    @PostMapping(value = "/pw/search", produces = "application/json;utf-8")
    @ResponseBody
    public ResponseEntity searchPw(@RequestBody String json_mail) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_mail, Member.class);
        ResponseEntity<?> result = null;

        Tempkey tempkey = new Tempkey();   //난수 키값
        String key = tempkey.getKey(5, false);

        boolean havingEmail = memberMM.searchPW(member, key);
        System.out.println("havingEmail = " + havingEmail);

        if (!havingEmail) {    //이메일이 존재하지않을때
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("1");
        } else {    //true
            result = ResponseEntity.ok(obj.writeValueAsString(key));
        }
        return result;
    }

    //비밀번호 변경
    @PostMapping (value ="/pw/change")
    @ResponseBody
    public ResponseEntity changePw(@RequestBody String json_value, Model model) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_value, Member.class);
        ResponseEntity<?> result = null;
        boolean changeNewPw = memberMM.changePw(member, model);
        System.out.println("새로운 비밀번호 = " + changeNewPw);

        if (!changeNewPw) {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("");
        } else {    //성공적으로 비번
            result = ResponseEntity.ok("");
        }
        return result;
    }
}
