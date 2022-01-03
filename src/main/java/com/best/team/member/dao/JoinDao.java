package com.best.team.member.dao;

import com.best.team.community.bean.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface JoinDao {
    String idDupleCheck(Member member);
    String nickNameDupleCheck(Member member);
    String emailDupleCheck(Member membeer);

}
