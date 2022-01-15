package com.best.team.member.dao;

import com.best.team.member.bean.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {

    boolean join(Member member);

    boolean checkValue(Member member);

    boolean confirmEmail(Member member);

    boolean doAccept(Member member);

    String getSecurityPwd(@Param("m_id") String m_id);

    boolean getValueEamilAccept(Member member);

    boolean hasEmail(Member member);

    boolean sendEmail(Member member);

    String getPw(Member member);

    boolean hasId(Member m_id);

    boolean changePw(Member member);

    String getId(Member member);
}
