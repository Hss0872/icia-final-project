package com.best.team.community.service;
import com.best.team.community.bean.*;
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

    public String getPreviewBList(BoardType boardType) throws JsonProcessingException {
        log.info("getPreviewBList call");
        List<?> previewBList;
        if (boardType.getBoardType().equals("free")) {
            previewBList = boardDao.getPreviewFreeBList();
        } else {
            previewBList = boardDao.getPreviewLaneBList(boardType.getLane());
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String previewBListJson = objectMapper.writeValueAsString(previewBList);
        return previewBListJson;
    }

    public boolean getBList(BoardType boardType, Integer pageNum, Model model, BoardSearch boardSearch) {
        log.info("getBList call");
        log.info("boardType = {}", boardType.getBoardType());
        log.info("boardSearch = {}", boardSearch.getSearchType());
        pageNum = (pageNum == null) ? 1 : pageNum;
        List<?> bList;

        if (boardType.getBoardType().equals("free")) {
            bList = (boardSearch.getSearchType() == null) ? boardDao.getFreeBList(pageNum) :
                    boardDao.getFreeBSearchList(pageNum, boardSearch);
        } else {
            if (boardType.getLane() == null) {
                boardType.setLane("TOP");
            }
            bList = (boardSearch.getSearchType() == null) ? boardDao.getLaneBList(pageNum, boardType.getLane()) :
                    boardDao.getLaneBSearchList(pageNum, boardType.getLane(), boardSearch);
        }

        if (bList != null && bList.size() != 0) {
            log.info("bList select success");
            model.addAttribute("boardSearch", boardSearch);
            model.addAttribute("bList", bList);
            model.addAttribute("boardPaging", getPaging(pageNum, boardType, boardSearch));
            return true;
        } else {
            return false;
        }
    }

    private BoardPaging getPaging(Integer pageNum, BoardType boardType, BoardSearch boardSearch) {
        log.info("getPaging call");
        int maxNum;
        if (boardType.getBoardType().equals("free")) {
            maxNum = (boardSearch.getSearchType() == null) ? boardDao.getFreeBoardCount() :
                    boardDao.getFreeBSearchCount(boardSearch);
        } else {
            maxNum = (boardSearch.getSearchType() == null) ? boardDao.getLaneBoardCount(boardType.getLane()) :
                    boardDao.getLaneBSearchCount(boardType.getLane(), boardSearch);
        }
        int listCount = 10;
        int pageCount = 10;
        Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardType.getBoardType(), boardType.getLane());
        return paging.getBoardPaging();
    }

    public boolean getBoardInfo(String type, int bNum, Model model) {
        Optional<?> Op_boardInfo;
        if (type.equals("free")) {
            FreeBoard freeBoardInfo = boardDao.getFreeBoardInfo(bNum);
            Op_boardInfo = Optional.ofNullable(freeBoardInfo);
        } else {
            LaneBoard laneBoardInfo = boardDao.getLaneBoardInfo(bNum);
            Op_boardInfo = Optional.ofNullable(laneBoardInfo);
        }

        log.info("Op_boardInfo = {}" , Op_boardInfo.isPresent());
        log.info("Op_boardInfo.get() = {}", Op_boardInfo.get());

        if (Op_boardInfo.isPresent()) {
            if (type.equals("free")) {
                model.addAttribute("freeBoardInfo", Op_boardInfo.get());
            } else {
                model.addAttribute("laneBoardInfo", Op_boardInfo.get());
            }
            model.addAttribute("boardType", type);
            return true;
        } else {
            return false;
        }
    }
}