package com.best.team.gameRecode.bean;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Alias("RecodeGameSummoner")
@Setter
@Getter
@ToString
public class RecodeGameSummoner {

    private int particitantid;
    private int championlevel;
    private int championid;
    private String summonername;
    private String teamposion;

    private int kills;
    private int deaths;
    private int assists;
    private double kda;
    private int totaldamagedealttochampions;
    private int wardsplaced;
    private int goldearned;

    private ItemBuild itemBuild;
    private SkillBuild skillBuild;
    private EndItem endItem;

    private PerkBuild perkBuild;

}
