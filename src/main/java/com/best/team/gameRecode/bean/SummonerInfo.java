package com.best.team.gameRecode.bean;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;


@Setter
@Getter
@ToString
public class SummonerInfo {



    private String summonerName;
    private String puuid;
    private String id;
    private String tier;
    private String rank;
    private String level;


}
