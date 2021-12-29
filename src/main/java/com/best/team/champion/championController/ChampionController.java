package com.best.team.champion.championController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChampionController {

    @RequestMapping("/summoner")
    public String summonerPage() {
        return "summoner";
    }

    @RequestMapping("/summoner_info")
    public String summonerInfoPage(){
        return "summoner_info";
    }
}
