package com.best.team.image.bean;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Alias("Spell")
@Data
public class SpellDto {

    private int key;
    private String id;
    private String name_en;
    private String name_kr;
    private String description;
    private String modes;


}
