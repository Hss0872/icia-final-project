package com.best.team.member.controller;


import com.best.team.community.bean.Member;
import com.best.team.member.service.JoinMM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {

    @Autowired
    private JoinMM joinMM;

    @RequestMapping("/idDupleCheck")
    public String idDupleCheck(Member member){
        String idDuple = joinMM.idDupleCheck(member);

        return idDuple;
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
