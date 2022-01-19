package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("LaneBFile")
public class LaneBFile {

    private int bf_lane_num;
    private int bf_lane_bnum;
    private String bf_lane_system;
    private String bf_lane_origin;
}