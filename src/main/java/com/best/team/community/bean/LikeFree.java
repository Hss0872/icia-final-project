package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@Alias("LikeFree")
public class LikeFree {

    private int lc_free_bnum;
    private String lc_free_id;
    private String lc_free_nickname;
    private Timestamp lc_free_date;
}
