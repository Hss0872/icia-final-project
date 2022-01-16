package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("ChampionPassive")
@ToString
public class ChampionPassive {

    private String champion_passive_kor;    //챔피언별 패시브 스킬명 (한국어)
    private String champion_passive_eng;    //챔피언별 패시브 스킬명 (영어)
    private String split;                   //챔피언별 패시브 스킬 설명 (한국어)

}