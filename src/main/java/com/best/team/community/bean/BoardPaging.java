package com.best.team.community.bean;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPaging {

    private int start;
    private int end;
    private int pageNum;
    private String type;
    private String lane;
}