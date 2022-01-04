package com.best.team.member.dao;

import com.best.team.member.bean.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {

    public abstract boolean join(Member member);
}
