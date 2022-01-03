package com.best.team.member.service;


import com.best.team.member.bean.Member;
import com.best.team.member.dao.JoinDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class JoinMM {

    @Autowired
    private JoinDao jDao;

    public Boolean idDupleCheck(String m_id){
        Boolean idCheckResult = jDao.idDupleCheck(m_id);
        System.out.println("idCheckResult = " + idCheckResult);
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
