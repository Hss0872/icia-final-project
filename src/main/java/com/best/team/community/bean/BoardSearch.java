package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Alias("BoardSearch")
@Getter
@Setter
@ToString
public class BoardSearch {

    private String b_search;
    private String keyword;

}
