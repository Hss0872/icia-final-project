package com.best.team.gameRecode.controller;




import com.best.team.gameRecode.service.SummonerInfoMM;

import com.best.team.image.bean.ChampionDto;
import com.best.team.image.bean.ItemDto;
import com.best.team.image.bean.RuneDto;
import com.best.team.image.bean.SkillDto;
import com.best.team.image.sevice.ImgMM;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/summoner")
@RequiredArgsConstructor
public class ControllerV1 {

    ModelAndView mav;

    private final SummonerInfoMM sm;
    private final ImgMM im;



    @GetMapping()
    public String test(){
        return "summoner";
    }

    @GetMapping("summoner_info" )
    public ModelAndView test1(String userName) throws Exception {

        mav=new ModelAndView();


        mav=sm.getSummonerGameRecode(userName,mav);

        return mav;
    }
}
