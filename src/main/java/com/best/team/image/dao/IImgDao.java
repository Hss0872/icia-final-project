package com.best.team.image.dao;

import com.best.team.image.bean.ChampionDto;

import com.best.team.image.bean.ItemDto;
import com.best.team.image.bean.RuneDto;
import com.best.team.image.bean.SkillDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface IImgDao {


    List<ChampionDto> getChampionList();

    List<ItemDto> getItemInfo();

    List<SkillDto> getSkillInfo();

    List<RuneDto> getRuneInfo();
}
