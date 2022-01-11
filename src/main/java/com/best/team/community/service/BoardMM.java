package com.best.team.community.service;
import com.best.team.community.bean.BoardPaging;
import com.best.team.community.bean.BoardType;
import com.best.team.community.bean.FreeBoard;
import com.best.team.community.bean.LaneBoard;
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

@Service
@Slf4j
public class BoardMM {

    private BoardDao boardDao;

    @Autowired
    public BoardMM(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    public String getPreviewBList(String boardType) throws JsonProcessingException {
        log.info("getPreviewBList call");
        List<?> previewBList;
        if (boardType.equals("free")) {
            previewBList = boardDao.getPreviewFreeBList();
        } else {
            previewBList = boardDao.getPreviewLaneBList();
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String previewBListJson = objectMapper.writeValueAsString(previewBList);
        return previewBListJson;
    }

    public boolean getBList(BoardType boardType, Integer pageNum, Model model) {
        log.info("getBList call");
        log.info("boardType = {}", boardType.getBoardType());
        pageNum = (pageNum == null) ? 1 : pageNum;
        List<?> bList;

        if (boardType.getBoardType().equals("free")) {
            bList = boardDao.getFreeBList(pageNum);
        } else {
            if (boardType.getLane() == null) {
                boardType.setLane("TOP");
            }
            bList = boardDao.getLaneBList(pageNum, boardType.getLane());
        }

        if (bList != null && bList.size() != 0) {
            model.addAttribute("bList", bList);
            model.addAttribute("boardPaging", getPaging(pageNum, boardType));
            return true;
        } else {
            return false;
        }
    }

    private BoardPaging getPaging(Integer pageNum, BoardType boardType) {
        int maxNum = boardType.getBoardType().equals("free") ? boardDao.getFreeBoardCount() :
                boardDao.getLaneBoardCount(boardType.getLane());
        int listCount = 10;
        int pageCount = 2;
        Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardType.getBoardType(), boardType.getLane());
        return paging.getBoardPaging();
    }
}