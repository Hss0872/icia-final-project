package com.best.team.gameRecode.bean;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("RecodeGame")
@Getter
@Setter
public class RecodeGame {
    private String gameid;
    private String gameversion;
    private String gamemode;
    private double gametime;
    private double starttime;


    private List<RecodeGameTeam> recodeGameTeams;




}
