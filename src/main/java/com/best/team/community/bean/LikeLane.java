package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@Alias("LikeLane")
public class LikeLane {

    private int lc_lane_bnum;
    private String lc_lane_id;
    private String lc_lane_nickname;
    private Timestamp lc_lane_date;
}
