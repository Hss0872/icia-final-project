package com.best.team.member.dao;

import com.best.team.member.bean.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailDao {

    boolean confirmEmail(Member member);

    void updateAuthstatus(Member member);
}
