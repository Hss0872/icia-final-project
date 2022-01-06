package com.best.team.member.dao;

import com.best.team.member.bean.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {

    boolean join(Member member);

    boolean checkValue(Member member);

    boolean confirmEmail(Member member);

    boolean doAccept(Member member);
}
