package com.best.team.image.bean;


import lombok.Data;
import org.apache.ibatis.type.Alias;

@Alias("ChampionDto")
@Data
public class ChampionDto {


    private int championid;
    private String champion_name_kr;
    private String champion_name_eng;
}
