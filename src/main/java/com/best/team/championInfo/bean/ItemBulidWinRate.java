package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("ItemBulidWinRate")
@ToString
public class ItemBulidWinRate {

    private String championName;    //챔피언 이름
    private String item_Bulid;      //아이템 빌드
    private int cnt;             //채용횟수
    private int win_cnt;         //승리횟수
    private float win_rate;         //승률

}