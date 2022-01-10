package com.best.team.community.controller;
import com.best.team.community.bean.BoardType;
import com.best.team.community.service.BoardMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/community")
public class CommunityRestController {

    private BoardMM boardMM;

    @Autowired
    public CommunityRestController(BoardMM boardMM) {
        this.boardMM = boardMM;
    }

    @PostMapping(value = "/boardlist", produces = "application/json;utf-8")
    public ResponseEntity<?> getPriviewBoard(@RequestBody() BoardType boardType) throws JsonProcessingException {
        String boardListJson = boardMM.getPriviewBoard(boardType.getBoardType());
        return ResponseEntity.ok(boardListJson);
    }
}
