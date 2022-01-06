package com.best.team.member.controller;

import com.best.team.image.bean.*;
import com.best.team.image.sevice.ImgMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ImgMM im;

    @RequestMapping("/")
    public String home(HttpServletRequest request) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        String json2 = "";




        ServletContext application=request.getServletContext();
        List<ChampionDto> championDtoList;
        championDtoList=im.getChampionImg();

        json2 = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(championDtoList);


        List<ItemDto> itemDtoList;
        itemDtoList=im.getItemInfo();
        String json1="";
        json1=mapper.writerWithDefaultPrettyPrinter().writeValueAsString(itemDtoList);

        List<SkillDto> skillDtoList;
        skillDtoList=im.getSkillInfo();
        String json3="";
        json3=mapper.writerWithDefaultPrettyPrinter().writeValueAsString(skillDtoList);

        List<RuneDto> runeDtoList;
        runeDtoList=im.getRuneInfo();
        String json4="";
        json4=mapper.writerWithDefaultPrettyPrinter().writeValueAsString(runeDtoList);

        List<SpellDto> spellDtoList;
        spellDtoList=im.getSpellInfo();
        String json5="";
        json5=mapper.writerWithDefaultPrettyPrinter().writeValueAsString(spellDtoList);


        application.setAttribute("championInfo",json2);
        application.setAttribute("itemInfo",json1);
        application.setAttribute("skillInfo",json3);
        application.setAttribute("runeInfo",json4);
        application.setAttribute("spellInfo",json5);
        return "home";
    }
}
