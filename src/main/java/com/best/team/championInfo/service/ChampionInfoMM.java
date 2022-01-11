package com.best.team.championInfo.service;

import com.best.team.championInfo.bean.ItemBulidWinRate;
import com.best.team.championInfo.bean.RuneBulidWinRate;
import com.best.team.championInfo.bean.SkillWinRate;
import com.best.team.championInfo.bean.StartItemWinRate;
import com.best.team.championInfo.dao.ChampionInfoDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Service
public class ChampionInfoMM {

    ModelAndView mav;

    @Autowired
    private ChampionInfoDao championInfoDao;

    public ModelAndView getChampionInfo(String championName) throws JsonProcessingException {

        ObjectMapper objectMapper = new ObjectMapper();

        List<ItemBulidWinRate> itemBulidWinRates = championInfoDao.getItemBulidWinRate(championName);
        List<RuneBulidWinRate> runeBulidWinRates = championInfoDao.getRuneBulidWinRate(championName);       //01-11
        List<SkillWinRate> skillWinRates = championInfoDao.getSkillWinRate(championName);                   //01-11
        List<StartItemWinRate> startItemWinRates = championInfoDao.getStartItemWinRate(championName);       //01-11

        System.out.println("itemBulidWinRates = " + itemBulidWinRates);
        System.out.println("runeBulidWinRates = " + runeBulidWinRates);     //01-11
        System.out.println("skillWinRates = " + skillWinRates);             //01-11
        System.out.println("startItemWinRates = " + startItemWinRates);     //01-11

        mav = new ModelAndView();

        String itemBulidWinRates_json = objectMapper.writeValueAsString(itemBulidWinRates);
        String runeBulidWinRates_json = objectMapper.writeValueAsString(runeBulidWinRates);     //01-11
        String skillWinRates_json = objectMapper.writeValueAsString(skillWinRates);             //01-11
        String startItemWinRates_json = objectMapper.writeValueAsString(startItemWinRates);     //01-11

        mav.addObject("itemBulidWinRates", itemBulidWinRates_json);
        mav.addObject("runeBulidWinRates", runeBulidWinRates_json);     //01-11
        mav.addObject("skillWinRates", skillWinRates_json);             //01-11
        mav.addObject("startItemWinRates", startItemWinRates_json);     //01-11

        mav.setViewName("champion_info");
        return mav;
    }

}
