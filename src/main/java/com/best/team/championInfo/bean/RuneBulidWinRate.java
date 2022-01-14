package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("RuneBulidWinRate")
@ToString
public class RuneBulidWinRate {

    private String championName;    //챔피언 이름
    private String main_Runes;      //메인 룬
    private String sub_Runes;       //서브 룬
    private String stats_Runes;     //스탯 룬
    private int cnt;             //채용횟수
    private int win_cnt;         //승리횟수
    private float win_Rate;         //승률


}