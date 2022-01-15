package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("ChampionSkillDesc")
@ToString
public class ChampionSkillDesc {

    private int championid;             //챔피언 코드 (id)
    private String champion_name_kr;    //챔피언 이름 (한국)
    private String champion_name_eng;   //챔피언 이름 (영어)
    private String q;                   //챔피언 Q스킬 이름
    private String q_desc;              //챔피언 Q스킬 설명 (DESCRIPTION)
    private String w;                   //챔피언 W스킬 이름
    private String w_desc;              //챔피언 W스킬 설명 (DESCRIPTION)
    private String e;                   //챔피언 E스킬 이름
    private String e_desc;              //챔피언 E스킬 설명 (DESCRIPTION)
    private String r;                   //챔피언 R스킬 이름
    private String r_desc;              //챔피언 R스킬 설명 (DESCRIPTION)
}