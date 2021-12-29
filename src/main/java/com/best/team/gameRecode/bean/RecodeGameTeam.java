package com.best.team.gameRecode.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.util.List;


@Alias("RecodeGameChampion")
@Setter
@Getter
@ToString
public class RecodeGameTeam {


    private int teamid;
    private int champion_kills;
    private int baron_kills;
    private int dragon_kills;
    private int riftherald_kills;
    private int tower_kills;
    private int teamtotalgold;
    private boolean win;


    private List<RecodeGameSummoner> recodeGameSummoners;
    private List<Integer> bans;

















}
