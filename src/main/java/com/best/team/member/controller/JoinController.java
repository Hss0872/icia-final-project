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

@Controller
@RequestMapping("/member")
@Slf4j
public class JoinController {
    ModelAndView mav;

    @Autowired
    private JoinMM joinMM;
                                                    //json 한글깨짐 방지
    @RequestMapping(value = "/dupleCheck", produces = "application/json; charset=utf8",
            method= RequestMethod.POST)
    @ResponseBody   // 응답 헤더로 리턴 값이 넘어감
    public ResponseEntity dupleCheck(@RequestBody() String json_duple) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();  //객체를 json , json을 객체로 바꿔주는 jackson꺼
        Member member = objectMapper.readValue(json_duple, Member.class); //json -> object
        Boolean dupleResult = joinMM.dupleCheck(member); //중복일때 true 들어옴
        ResponseEntity<?> result = null;

        System.out.println("dupleResult = " + dupleResult);

        if (dupleResult) {    //중복일 때
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(objectMapper.writeValueAsString("1"));
            /*result = "duple";*/
        } else {    //중복이 아닐 때
            result = ResponseEntity.ok(objectMapper.writeValueAsString("0"));
        }
        return result;
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
