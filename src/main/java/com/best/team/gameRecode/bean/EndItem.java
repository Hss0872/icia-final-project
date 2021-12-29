package com.best.team.gameRecode.bean;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;


@Alias("EndItem")
@Getter
@Setter
@ToString
public class EndItem {

    private int item0;
    private int item1;
    private int item2;
    private int item3;
    private int item4;
    private int item5;
    private int item6;
}
