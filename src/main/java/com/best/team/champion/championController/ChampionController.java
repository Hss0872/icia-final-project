package com.best.team.champion.championController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/champion")
@Slf4j
public class ChampionController {

    @RequestMapping()
    public String champion() {
        return "champion";
    }

    @RequestMapping("/{championName}")
    public String championInfo(@PathVariable String championName) {
        System.out.println("championName = " + championName);
        return "/";
    }
}
