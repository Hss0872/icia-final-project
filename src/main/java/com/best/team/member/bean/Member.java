package com.best.team.member.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Alias("Member")
@Data
public class Member {

    private String m_id;
    private String m_nickname;
    private String m_email;
    private String m_pw;
    private int m_point;
    private String g_name;
    
    private String m_birth;
    private String authkey;     //인증키
    private int authstatus;
}