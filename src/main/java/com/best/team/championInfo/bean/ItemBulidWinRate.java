package com.best.team.championInfo.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("ItemBulidWinRate")
@ToString
public class ItemBulidWinRate {

    private String championName;
    private String item_Bulid;
    private String cnt;
    private String win_cnt;
    private float win_rate;

}