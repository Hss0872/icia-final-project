package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("ChampionBlurb")
@ToString
public class ChampionBlurb {

    private int champion_code;          //챔피언 코드 (id)
    private String champion_kr;         //챔피언 이름 (한국)
    private String champion_eng;        //챔피언 이름 (영어)
    private String blurb;               //챔피언별 배경 설명 (한국어)

}