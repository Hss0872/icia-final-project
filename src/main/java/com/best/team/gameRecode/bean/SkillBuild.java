package com.best.team.gameRecode.bean;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.util.List;
import java.util.Set;
@Alias("SkillBuild")
@Setter
@Getter
public class SkillBuild {


    private List<Integer> skill_tree;


}
