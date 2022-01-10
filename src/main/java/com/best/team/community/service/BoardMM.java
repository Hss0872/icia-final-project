package com.best.team.community.service;
import com.best.team.community.bean.FreeBoard;
import com.best.team.community.dao.BoardDao;
import com.best.team.community.userClass.Paging;
import com.best.team.member.bean.Member;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class BoardMM {

    private BoardDao boardDao;

    @Autowired
    public BoardMM(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    public String getPriviewBoard(String boardType) throws JsonProcessingException {
        List<?> boardList;
        if (boardType.equals("free")) {
            boardList = boardDao.getFreeBoardList(1);
            System.out.println("boardList = " + boardList);
        } else {
            boardList = boardDao.getLaneBoardList(1);
        }

        ObjectMapper objectMapper = new ObjectMapper();
        String boardListJson = objectMapper.writeValueAsString(boardList);
        return boardListJson;
    }

    public boolean getFreeboard(Integer pageNum, Model model) {
        log.info("getFreeboard call");
        pageNum = (pageNum == null) ? 1 : pageNum;
        List<FreeBoard> boardList = boardDao.getFreeBoardList(pageNum);
        if (boardList != null && boardList.size() != 0) {
            model.addAttribute("boardList", boardList);
            model.addAttribute("paging", getPaging(pageNum));
            return true;
        } else {
            return false;
        }
    }

    private String getPaging(Integer pageNum) {
        int maxNum = boardDao.getBoardCount(); // 전체 글의 수
        int listCount = 10;
        int pageCount = 2;
        String boardName = "/community/free/board"; // url
        Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
        return paging.makeHtmlPaging(); // return <a href ...1,2
    }
}