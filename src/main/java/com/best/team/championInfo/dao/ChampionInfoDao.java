package com.best.team.championInfo.dao;

import com.best.team.championInfo.bean.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChampionInfoDao {

    List<ItemBulidWinRate> getItemBulidWinRate(@Param("championName") String championName);

    List<RuneBulidWinRate> getRuneBulidWinRate(@Param("championName") String championName);

    List<SkillWinRate> getSkillWinRate(@Param("championName") String championName);

    List<StartItemWinRate> getStartItemWinRate(@Param("championName") String championName);

    List<MasterPoint> getMasterPoint(@Param("championName") String championName);

    ChampionPassive getChampionPassive(@Param("ChampionPassiveName") String ChampionPassiveName);

    ChampionBlurb getChampionBlurb(@Param("championName") String championName);

    ChampionSkillDesc getChampionSkillDesc(@Param("championName") String championName);

    ChampionTitle getChampionTitle(@Param("championName") String championName);

}