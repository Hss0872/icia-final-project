package com.best.team.image.sevice;


import com.best.team.image.bean.ChampionDto;
import com.best.team.image.dao.IImgDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ImgMM {
    @Autowired
    private IImgDao iDao;





    public List<String> getChampioImg() {


        List<ChampionDto> cList=new ArrayList<>();
        cList=iDao.getChampionList();

        List<String> champList=new ArrayList<>();
        for (int i = 0; i < cList.size(); i++) {
            ChampionDto cd = cList.get(i);
            champList.add(cd.getChampion_name_eng());
        }

        return champList;
    }
}
