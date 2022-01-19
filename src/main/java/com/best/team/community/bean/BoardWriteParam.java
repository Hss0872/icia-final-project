package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@Alias("BoardWriteParam")
public class BoardWriteParam {

    private int b_write_num;
    private String b_write_id;
    private String b_write_nickname;
    private String b_write_type;
    private String b_write_title;
    private String b_write_content;
}
