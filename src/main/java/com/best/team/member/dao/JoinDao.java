package com.best.team.member.dao;
import com.best.team.member.bean.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface JoinDao {
    Boolean idDupleCheck(String member);
    String nickNameDupleCheck(Member member);
    String emailDupleCheck(Member member);
}
