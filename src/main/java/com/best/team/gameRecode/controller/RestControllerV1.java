package com.best.team.gameRecode.controller;

import com.best.team.gameRecode.bean.RecodeGame;

import com.best.team.gameRecode.service.SummonerInfoMM;

import com.best.team.image.bean.ChampionDto;
import com.best.team.image.bean.ItemDto;
import com.best.team.image.bean.RuneDto;
import com.best.team.image.bean.SkillDto;
import com.best.team.image.sevice.ImgMM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/summoner")
public class RestControllerV1 {
    @Autowired
    private SummonerInfoMM sm;
    @Autowired
    private ImgMM im;

    @PostMapping("/summoner_info/getjson" )
    public Map<String,?> test3(String puuid) throws Exception {


        System.out.println(puuid);
        List<RecodeGame> recodeGameList =new ArrayList<>();
        recodeGameList=sm.getGameRecode(puuid);
        Map<String, Object> hMap=new HashMap<>();

        List<ChampionDto> championDtoList;
        championDtoList=im.getChampionImg();

        List<ItemDto> itemDtoList;
        itemDtoList=im.getItemInfo();
        
        List<SkillDto> skillDtoList;
        skillDtoList=im.getSkillInfo();

        List<RuneDto> runeDtoList;

        runeDtoList=im.getRuneInfo();
        hMap.put("recodeGameList",recodeGameList);
        hMap.put("championinfo",championDtoList);
        hMap.put("iteminfo",itemDtoList);
        hMap.put("skillinfo",skillDtoList);
        hMap.put("runeinfo",runeDtoList);
        return hMap;
    }
}
