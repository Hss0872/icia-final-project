package com.best.team.community.controller;
import com.best.team.community.bean.BoardSearch;
import com.best.team.community.bean.BoardType;
import com.best.team.community.service.BoardMM;
import com.best.team.community.service.ReplyMM;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {

    private BoardMM boardMM;
    private ReplyMM replyMM;

    @Autowired
    public CommunityController(BoardMM boardMM, ReplyMM replyMM) {
        this.boardMM = boardMM;
        this.replyMM = replyMM;
    }

    @RequestMapping()
    public String community() {
        log.info("community call");
        return "redirect:/community/board/free";
    }

    @RequestMapping(value = "/board/{type}", method = RequestMethod.GET)
    public String getBList(@PathVariable() String type, BoardType boardType, Integer pageNum, Model model,
                           BoardSearch boardSearch) {
        log.info("getBList call");
        boardType.setBoardType(type);
        boolean result = boardMM.getBList(boardType, pageNum, model, boardSearch);
        log.info(type + "board");
        return type + "board_modify";
    }

    @RequestMapping(value = "/board/{type}/{bNum}", method = RequestMethod.GET)
    public String getBoardInfo(@PathVariable String type, @PathVariable int bNum, Model model,
                               HttpServletRequest request, HttpServletResponse response) {
        log.info("getBoardInfo call");
        boolean result = boardMM.getBoardInfo(type, bNum, model, request, response);
        return result ? "boardContents_modify" : "redirect:/community/board/free";
    }
}