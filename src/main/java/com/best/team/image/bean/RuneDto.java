package com.best.team.image.bean;


import lombok.Data;
import org.apache.ibatis.type.Alias;

@Alias("Rune")
@Data
public class RuneDto {
    private String rune_category;
    private int id;
    private String name_eng;
    private String name_kor;
    private String short_desc;
    private String icon_img;

}
