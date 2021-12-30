package com.best.team.gameRecode.controller;




import com.best.team.gameRecode.service.SummonerInfoMM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/summoner")
public class ControllerV1 {

    ModelAndView mav;

    @Autowired
    private SummonerInfoMM sm;



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
