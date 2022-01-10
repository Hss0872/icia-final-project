package com.best.team.championInfo.controller;

import com.best.team.championInfo.service.ChampionInfoMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/champion")
@Slf4j
public class ChampionController {

    ModelAndView mav;

    @Autowired
    private ChampionInfoMM championInfoMM;

    @RequestMapping()
    public String champion() {
        return "champion";
    }

    @RequestMapping("/{championName}")
    public ModelAndView getChampionInfo(@PathVariable String championName) throws JsonProcessingException {
        log.info("championInfo call");
        System.out.println("championName = " + championName);
        mav = championInfoMM.getChampionInfo(championName);
        return mav;
    }
}
