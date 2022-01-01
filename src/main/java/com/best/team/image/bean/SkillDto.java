package com.best.team.image.bean;


import lombok.Data;
import org.apache.ibatis.type.Alias;

@Alias("Skill")
@Data
public class SkillDto {

    private String champion_name;
    private String q;
    private String w;
    private String e;
    private String r;

}
