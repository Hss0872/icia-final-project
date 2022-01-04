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

    public Boolean dupleCheck(Member member) {
        System.out.println("member = " + member);

        //중복 검사 매개변수 두개 만들어서 던지기
        String duple_type = null;
        String duple_member = null;

        if (member.getM_id() == null) {
            if(member.getM_nickname() == null) {
                if (member.getM_email() == null) {
                    duple_type = null;
                    duple_member = null;
                } else {
                    duple_type = "m_email";
                    duple_member = member.getM_email();
                }
            } else {
                duple_type = "m_nickname";
                duple_member = member.getM_nickname();
            }
        } else {
            duple_type = "m_id";
            duple_member = member.getM_id();
        }
        System.out.println("duple_type = " + duple_type);
        System.out.println("duple_member = " + duple_member);

        Boolean idCheckResult = jDao.idDupleCheck(duple_type, duple_member);
        System.out.println("idCheckResult = " + idCheckResult);
        return idCheckResult;
    }
}
