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
public class ControllerV1 {

    ModelAndView mav;

    @Autowired
    private SummonerInfoMM sm;



    @GetMapping("test")
    public String test(){
        return "test";
    }
    @GetMapping("test1" )
    public ModelAndView test1(String champ_name) throws Exception {
        mav=new ModelAndView();

        mav=sm.getSummonerGameRecode(champ_name,mav);

        return mav;
    }
}
