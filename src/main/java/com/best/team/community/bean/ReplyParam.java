package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("ReplyParam")
public class ReplyParam {

    private String content;
    private int r_type_num;

}
