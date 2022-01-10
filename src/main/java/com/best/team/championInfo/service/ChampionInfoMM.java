package com.best.team.championInfo.service;

import com.best.team.championInfo.bean.ItemBulidWinRate;
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
        System.out.println("itemBulidWinRates = " + itemBulidWinRates);
        mav = new ModelAndView();
        String itemBulidWinRates_json = objectMapper.writeValueAsString(itemBulidWinRates);
        mav.addObject("itemBulidWinRates", itemBulidWinRates_json);
        mav.setViewName("champion_info");
        return mav;
    }

}
