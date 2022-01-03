package com.best.team.member.service;


import com.best.team.community.bean.Member;
import com.best.team.member.dao.JoinDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinMM {

    @Autowired
    private JoinDao jDao;

    public String idDupleCheck(Member member){
        String idCheckResult = jDao.idDupleCheck(member);
        return idCheckResult;
    }

    public String nickNameDupleCheck(Member member){
        String nickNameDupleResult = jDao.nickNameDupleCheck(member);
        return nickNameDupleResult;
    }

    public String emailDupleCheck(Member member){
        String emailDupleResult = jDao.emailDupleCheck(member);
        return emailDupleResult;
    }
}
