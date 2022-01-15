package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Alias("FreeReply")
@Getter
@Setter
@ToString
public class FreeReply {

    private int r_free_num;
    private String r_free_id;
    private int r_free_bnum;
    private String r_free_nickname;
    private Timestamp r_free_date;
    private String r_free_content;
    private int r_free_lcount;
}
