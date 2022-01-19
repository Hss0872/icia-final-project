package com.best.team.championInfo.service;

import com.best.team.championInfo.bean.*;
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

        String ChampionPassiveName = championName+"Passive";
        List<ItemBulidWinRate> itemBulidWinRates = championInfoDao.getItemBulidWinRate(championName);
        List<RuneBulidWinRate> runeBulidWinRates = championInfoDao.getRuneBulidWinRate(championName);
        List<SkillWinRate> skillWinRates = championInfoDao.getSkillWinRate(championName);
        List<StartItemWinRate> startItemWinRates = championInfoDao.getStartItemWinRate(championName);
        List<MasterPoint> masterPoints = championInfoDao.getMasterPoint(championName);
        ChampionPassive championPassives = championInfoDao.getChampionPassive(ChampionPassiveName);
        ChampionBlurb championBlurbs = championInfoDao.getChampionBlurb(championName);
        ChampionSkillDesc championSkillDescs = championInfoDao.getChampionSkillDesc(championName);
        ChampionTitle championTitles = championInfoDao.getChampionTitle(championName);

        System.out.println("itemBulidWinRates = " + itemBulidWinRates);
        System.out.println("runeBulidWinRates = " + runeBulidWinRates);
        System.out.println("skillWinRates = " + skillWinRates);
        System.out.println("startItemWinRates = " + startItemWinRates);
        System.out.println("masterPoints = " + masterPoints);
        System.out.println("championPassive = " + championPassives);
        System.out.println("championBlurb = " + championBlurbs);
        System.out.println("championSkillDesc = " + championSkillDescs);
        System.out.println("championTitle = " + championTitles);

        mav = new ModelAndView();

        String itemBulidWinRates_json = objectMapper.writeValueAsString(itemBulidWinRates);
        String runeBulidWinRates_json = objectMapper.writeValueAsString(runeBulidWinRates);
        String skillWinRates_json = objectMapper.writeValueAsString(skillWinRates);
        String startItemWinRates_json = objectMapper.writeValueAsString(startItemWinRates);
        String masterPoints_json = objectMapper.writeValueAsString(masterPoints);
        String championPassive_json = objectMapper.writeValueAsString(championPassives);
        String championBlurb_json = objectMapper.writeValueAsString(championBlurbs);
        String championSkillDesc_json = objectMapper.writeValueAsString(championSkillDescs);
        String championTitle_json = objectMapper.writeValueAsString(championTitles);

        mav.addObject("itemBulidWinRates", itemBulidWinRates_json);
        mav.addObject("runeBulidWinRates", runeBulidWinRates_json);
        mav.addObject("skillWinRates", skillWinRates_json);
        mav.addObject("startItemWinRates", startItemWinRates_json);
        mav.addObject("masterPoints", masterPoints_json);
        mav.addObject("championPassives", championPassive_json);
        mav.addObject("championBlurb", championBlurb_json);
        mav.addObject("championSkillDesc", championSkillDesc_json);
        mav.addObject("championTitle", championTitle_json);

        mav.setViewName("champion_info");
        return mav;
    }

}
