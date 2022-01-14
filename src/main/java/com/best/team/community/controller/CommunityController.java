package com.best.team.community.controller;
import com.best.team.community.bean.BoardSearch;
import com.best.team.community.bean.BoardType;
import com.best.team.community.service.BoardMM;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {

    private BoardMM boardMM;

    @Autowired
    public CommunityController(BoardMM boardMM) {
        this.boardMM = boardMM;
    }

    @RequestMapping()
    public String community() {
        log.info("community call");
        return "main_community";
    }

    @RequestMapping(value = "/board/{type}", method = RequestMethod.GET)
    public String getBList(@PathVariable() String type, BoardType boardType, Integer pageNum, Model model,
                           BoardSearch boardSearch) {
        log.info("getBList call");
        boardType.setBoardType(type);
        boolean result = boardMM.getBList(boardType, pageNum, model, boardSearch);
        log.info(type + "board");
        return type + "board";
    }

}