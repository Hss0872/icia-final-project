package com.best.team.championInfo.dao;

import com.best.team.championInfo.bean.ItemBulidWinRate;
import com.best.team.championInfo.bean.RuneBulidWinRate;
import com.best.team.championInfo.bean.SkillWinRate;
import com.best.team.championInfo.bean.StartItemWinRate;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChampionInfoDao {

    List<ItemBulidWinRate> getItemBulidWinRate(@Param("championName") String championName);

    List<RuneBulidWinRate> getRuneBulidWinRate(@Param("championName") String championName);

    List<SkillWinRate> getSkillWinRate(@Param("championName") String championName);

    List<StartItemWinRate> getStartItemWinRate(@Param("championName") String championName);

}