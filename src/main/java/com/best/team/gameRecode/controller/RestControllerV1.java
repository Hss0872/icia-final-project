package com.best.team.gameRecode.controller;

import com.best.team.gameRecode.bean.RecodeGame;

import com.best.team.gameRecode.service.SummonerInfoMM;

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

    @PostMapping("/summoner_info/getjson" )
    public Map<String,?> test3(String puuid) throws Exception {


        System.out.println(puuid);
        List<RecodeGame> recodeGameList =new ArrayList<>();
        recodeGameList=sm.getGameRecode(puuid);
        Map<String, List<RecodeGame>> hMap=new HashMap<>();
        hMap.put("recodeGameList",recodeGameList);
        return hMap;
    }
}
