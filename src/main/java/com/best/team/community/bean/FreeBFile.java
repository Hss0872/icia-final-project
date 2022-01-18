package com.best.team.community.bean;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("FreeBFile")
public class FreeBFile {

    private int bf_free_num;
    private int bf_free_bnum;
    private String bf_free_system;
    private String bf_free_origin;
}
