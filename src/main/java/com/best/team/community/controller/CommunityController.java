package com.best.team.community.controller;
import com.best.team.community.bean.BoardSearch;
import com.best.team.community.bean.BoardType;
import com.best.team.community.bean.BoardWriteParam;
import com.best.team.community.service.BoardMM;
import com.best.team.community.service.BoardWriteMM;
import com.best.team.community.service.ReplyMM;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {

    private BoardMM boardMM;
    private ReplyMM replyMM;
    private BoardWriteMM boardWriteMM;

    @Autowired
    public CommunityController(BoardMM boardMM, ReplyMM replyMM, BoardWriteMM boardWriteMM)  {
        this.boardMM = boardMM;
        this.replyMM = replyMM;
        this.boardWriteMM = boardWriteMM;
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

    @RequestMapping(value = "/board/write", method = RequestMethod.GET)
    public String boardWritePage(HttpSession session) {
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
        return op_id.isPresent() ? "boardWriter_modify" : "redirect:/community";
    }

    @RequestMapping(value = "/board/write", method = RequestMethod.POST)
    public ModelAndView addBoardWrite(BoardWriteParam boardWriteParam, HttpSession session) {
        return boardWriteMM.addBoardWrite(boardWriteParam, session);
    }

    @RequestMapping(value = "/board/{type}/{bNum}/update", method = RequestMethod.GET)
    public String updateBoardPage(@PathVariable String type, @PathVariable int bNum,
                                  HttpSession session, Model model) {
        boolean result = boardWriteMM.updateBoardPage(type, bNum, session, model);
        return result ? "boardUpdate_modify" : "redirect:/community";
    }

    @RequestMapping(value = "/board/{type}/{bNum}/update", method = RequestMethod.POST)
    public ModelAndView updateBoard(BoardWriteParam boardWriteParam, HttpSession session,
                                    @PathVariable int bNum) {
        return boardWriteMM.updateBoard(boardWriteParam, session, bNum);
    }

    @RequestMapping(value = "/board/{type}/{bNum}/delete", method = RequestMethod.GET)
    public String deleteBoard(@PathVariable String type, @PathVariable int bNum, HttpSession session, Model model) {
        boolean result = boardWriteMM.deleteBoard(type, bNum, session, model);
        return result ? "redirect:/community" : "redirect:/community/board/" + type + "/" + bNum;
    }
}