package com.best.team.member.controller;

import com.best.team.image.bean.ChampionDto;
import com.best.team.image.bean.ItemDto;
import com.best.team.image.bean.RuneDto;
import com.best.team.image.bean.SkillDto;
import com.best.team.image.sevice.ImgMM;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ImgMM im;

    @RequestMapping("/")
    public String home(HttpServletRequest request) {


        ServletContext application=request.getServletContext();
        List<ChampionDto> championDtoList;
        championDtoList=im.getChampionImg();

        List<ItemDto> itemDtoList;
        itemDtoList=im.getItemInfo();

        List<SkillDto> skillDtoList;
        skillDtoList=im.getSkillInfo();

        List<RuneDto> runeDtoList;

        runeDtoList=im.getRuneInfo();
        application.setAttribute("championInfo",championDtoList);
        application.setAttribute("itemInfo",itemDtoList);
        application.setAttribute("skillInfo",skillDtoList);
        application.setAttribute("runeInfo",runeDtoList);
        return "home";
    }




}
