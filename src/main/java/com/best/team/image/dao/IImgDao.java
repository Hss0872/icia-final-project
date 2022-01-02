package com.best.team.image.dao;

import com.best.team.image.bean.ChampionDto;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface IImgDao {


    List<ChampionDto> getChampionList();
}
