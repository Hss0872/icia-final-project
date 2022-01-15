package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("MasterPoint")
@ToString
public class MasterPoint {

    private String championName;    //챔피언 이름
    private String summonerName;    //소환사 이름
    private int championPoints;     //챔피언 포인트 (숙련도)

}