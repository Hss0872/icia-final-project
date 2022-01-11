package com.best.team.image.controller;




import com.best.team.image.bean.ChampionDto;
import com.best.team.image.sevice.ImgMM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ImgController {

    @Autowired
    private ImgMM im;

    @RequestMapping("/champ_img")
    public List<String> championImg(){


        List<String> cList=new ArrayList<>();
        cList=im.getChampioImg();


        return cList;
    }

}
