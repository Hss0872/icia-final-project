package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Alias("FreeBoard")
@Getter
@Setter
@ToString
public class FreeBoard {

    private int b_free_num;
    private String b_free_id;
    private String b_free_nickname;
    private String b_free_title;
    private String b_free_content;
    private Timestamp b_free_date; //년월일 시분초 다 나오는 클래스이다.
    private int b_free_view;
    private int b_free_lcount;
    private int b_free_rcount;
    private int b_free_rycount;

}
