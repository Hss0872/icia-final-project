package com.best.team.community.controller;
import com.best.team.community.bean.BoardType;
import com.best.team.community.bean.ReplyParam;
import com.best.team.community.service.BoardMM;
import com.best.team.community.service.LikeMM;
import com.best.team.community.service.ReplyMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/community")
public class CommunityRestController {

    private BoardMM boardMM;
    private ReplyMM replyMM;
    private LikeMM likeMM;

    @Autowired
    public CommunityRestController(BoardMM boardMM, ReplyMM replyMM, LikeMM likeMM) {
        this.boardMM = boardMM;
        this.replyMM = replyMM;
        this.likeMM = likeMM;
    }

    @PostMapping(value = "/board/preview", produces = "application/json;utf-8")
    public ResponseEntity<?> getPriviewBList(@RequestBody() BoardType boardType) throws JsonProcessingException {
        String previewBListJson = boardMM.getPreviewBList(boardType);
        return ResponseEntity.ok(previewBListJson);
    }

    @RequestMapping(value = "/board/{type}/{bNum}", method = RequestMethod.POST, produces = "application/json;utf-8")
    public ResponseEntity<?> getReplyList(@PathVariable String type, @PathVariable int bNum) throws JsonProcessingException {
        String getReplyListJson = replyMM.getReplyList(type, bNum);
        return ResponseEntity.ok(getReplyListJson);
    }

    @RequestMapping(value = "/board/{type}/{bNum}/reply", method = RequestMethod.POST, produces = "application/json;utf-8")
    public ResponseEntity<?> addReply(@PathVariable String type, @PathVariable int bNum,
                                      @RequestBody() ReplyParam replyParam, HttpSession session, Model model) throws JsonProcessingException {
        boolean getReplyListJson = replyMM.addReply(type, bNum, replyParam, session, model);
        return getReplyListJson ? ResponseEntity.ok(model.getAttribute("replyListJson").toString())
                : ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("");
    }

    @RequestMapping(value = "/board/{type}/{bNum}/reply/delete", method = RequestMethod.POST, produces = "application/json;utf-8")
    public ResponseEntity<?> deleteReply(@PathVariable String type, @PathVariable int bNum,
                                         @RequestBody() ReplyParam replyParam, HttpSession session, Model model) throws JsonProcessingException {
        boolean getReplyListJson = replyMM.deleteReply(type, bNum, replyParam, session, model);
        return getReplyListJson ? ResponseEntity.ok(model.getAttribute("replyListJson").toString())
                : ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("");
    }

    @RequestMapping(value = "/board/{type}/{bNum}/like", method = RequestMethod.POST, produces = "application/json;utf-8")
    public ResponseEntity<?> addBoardLike(@PathVariable String type, @PathVariable int bNum, HttpSession session, Model model) throws JsonProcessingException {
        boolean result = likeMM.addBoardLike(type, bNum, session, model);
        return result ? ResponseEntity.ok(
                new ObjectMapper().writeValueAsString(model.getAttribute("likeCount").toString())) :
                ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("");
    }
}