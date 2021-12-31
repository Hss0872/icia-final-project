package com.best.team.image.bean;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Alias("ItemDto")
@Data
public class ItemDto {

    private String item_name_eng;
    private String item_name_kor;
    private String item_code;
}
