package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;
import java.sql.Timestamp;

@Alias("LaneBoard")
@Getter
@Setter
@ToString
public class LaneBoard {

    private int b_lane_num;
    private String b_lane_id;
    private String b_lane_nickname;
    private String b_lane_type;
    private String b_lane_title;
    private String b_lane_content;
    private Timestamp b_lane_date; //년월일 시분초 다 나오는 클래스이다.
    private int b_lane_view;
    private int b_lane_lcount;
    private int b_lane_rcount;
    private int b_lane_rycount;
}