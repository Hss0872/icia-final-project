package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@Alias("LaneReply")
public class LaneReply {

    private int r_lane_num;
    private String r_lane_id;
    private int r_lane_bnum;
    private String r_lane_nickname;
    private Timestamp r_lane_date;
    private String r_lane_content;
    private int r_lane_lcount;
}
