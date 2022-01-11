package com.best.team.community.service;
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

    public boolean getBList(String type, String lane, Integer pageNum, Model model) {
        log.info("getBList call");
        log.info("boardType = {}", type);
        pageNum = (pageNum == null) ? 1 : pageNum;
        if (type.equals("free")) {
            List<FreeBoard> bList = boardDao.getFreeBList(pageNum);
            String freeBPaging = getPaging(pageNum, type, lane);
        } else {
            lane = (lane == null) ? "top" : lane;
            List<LaneBoard> bList = boardDao.getLaneBList(pageNum, lane);
            String laneBPaging = getPaging(pageNum, type, lane);
        }

        if (boardList != null && boardList.size() != 0) {
            model.addAttribute("boardList", boardList);
            model.addAttribute("paging", getPaging(pageNum));
            return true;
        } else {
            return false;
        }
    }

    private String getPaging(Integer pageNum, String type, String lane) {
        int maxNum = type.equals("free") ? boardDao.getFreeBoardCount() : boardDao.getLaneBoardCount(lane);
        int listCount = 10;
        int pageCount = 2;
        Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, type, lane);
        return paging.makeHtmlPaging(); // return <a href ...1,2
    }
}