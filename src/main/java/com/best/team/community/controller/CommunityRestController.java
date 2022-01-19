package com.best.team.community.controller;
import com.best.team.community.bean.BoardType;
import com.best.team.community.bean.ReplyParam;
import com.best.team.community.service.BoardMM;
import com.best.team.community.service.BoardWriteMM;
import com.best.team.community.service.LikeMM;
import com.best.team.community.service.ReplyMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/community")
@Slf4j
public class CommunityRestController {

    private BoardMM boardMM;
    private ReplyMM replyMM;
    private LikeMM likeMM;
    private BoardWriteMM boardWriteMM;

    @Autowired
    public CommunityRestController(BoardMM boardMM, ReplyMM replyMM, LikeMM likeMM, BoardWriteMM boardWriteMM) {
        this.boardMM = boardMM;
        this.replyMM = replyMM;
        this.likeMM = likeMM;
        this.boardWriteMM = boardWriteMM;
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

    // --- REPLY ---

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

    // --- LIKE ---

    @RequestMapping(value = "/board/{type}/{bNum}/like", method = RequestMethod.POST, produces = "application/json;utf-8")
    public ResponseEntity<?> addBoardLike(@PathVariable String type, @PathVariable int bNum, HttpSession session, Model model) throws JsonProcessingException {
        boolean result = likeMM.addBoardLike(type, bNum, session, model);
        return result ? ResponseEntity.ok(
                new ObjectMapper().writeValueAsString(model.getAttribute("likeCount").toString())) :
                ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("");
    }

    @RequestMapping(value = "/board/{type}/{bNum}/dislike", method = RequestMethod.POST, produces = "application/json;utf-8")
    public ResponseEntity<?> deleteBoardLike(@PathVariable String type, @PathVariable int bNum, HttpSession session, Model model) throws JsonProcessingException {
        boolean result = likeMM.deleteBoardLike(type, bNum, session, model);
        return result ? ResponseEntity.ok(
                new ObjectMapper().writeValueAsString(model.getAttribute("likeCount").toString())) :
                ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("");
    }

    @ResponseBody
    @RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
    public void uploadImg(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) {
        log.info("uploadImg");
        boardWriteMM.uploadImg(req, res, upload);
    }
}