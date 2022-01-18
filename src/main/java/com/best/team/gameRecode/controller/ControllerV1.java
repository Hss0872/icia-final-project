package com.best.team.gameRecode.controller;




import com.best.team.gameRecode.service.SummonerInfoMM;

import com.best.team.image.sevice.ImgMM;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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

        mav.addObject("summonerName",userName);
        mav.setViewName("summoner_info");
        //mav=sm.getSummonerGameRecode(userName,mav);

        return mav;
    }
}
