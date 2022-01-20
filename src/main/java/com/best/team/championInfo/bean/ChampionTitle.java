package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("ChampionTitle")
@ToString
public class ChampionTitle {

    private int championid;            //챔피언 코드 (id)
    private String champion_name_kr;   //챔피언 이름 (한국)
    private String champion_name_eng;  //챔피언 이름 (영어)
    private String title;              //챔피언별 타이틀

}