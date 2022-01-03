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

@Controller
@RequestMapping("/member")
@Slf4j
public class JoinController {

    @Autowired
    private JoinMM joinMM;
                                                    //json 한글깨짐 방지
    @RequestMapping(value = "/idDupleCheck", produces = "application/json; charset=utf8",
            method= RequestMethod.POST)
    @ResponseBody   // 응답 헤더로 리턴 값이 넘어감
    public ResponseEntity idDupleCheck(@RequestBody() String json_m_id) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();  //객체를 json , json을 객체로 바꿔주는 jackson꺼
        Member member = objectMapper.readValue(json_m_id, Member.class); //json -> object
        log.info("member.getM_id() = {}", member.getM_id());
        System.out.println(json_m_id);
        Boolean idDupleResult = joinMM.idDupleCheck(member.getM_id());
        ResponseEntity<?> result = null;

        if (idDupleResult) {    //중복일 때

            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(objectMapper.writeValueAsString("중복된 아이디 입니다."));
            /*result = "duple";*/
        } else {    //중복이 아닐 때
            result = ResponseEntity.ok(objectMapper.writeValueAsString("사용가능한 아이디 입니다."));
        }
        return result;
    }

    @RequestMapping ("/nickNameDupleCheck")
    public String nickNameDupleCheck(Member member){
        String nickNameDuple = joinMM.nickNameDupleCheck(member);

        return nickNameDuple;
    }

    @RequestMapping("/emailDupleCheck")
    public String emailDupleCheck(Member member){
        String emailDuple = joinMM.emailDupleCheck(member);

        return emailDuple;
    }



}
