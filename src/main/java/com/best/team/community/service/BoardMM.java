package com.best.team.community.service;

import com.best.team.community.bean.*;
import com.best.team.community.dao.BoardDao;
import com.best.team.community.dao.LikeDao;
import com.best.team.community.dao.ReplyDao;
import com.best.team.community.userClass.Paging;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class BoardMM {

    private BoardDao boardDao;
    private ReplyDao replyDao;
    private LikeDao likeDao;

    @Autowired
    public BoardMM(BoardDao boardDao, ReplyDao replyDao, LikeDao likeDao) {
        this.boardDao = boardDao;
        this.replyDao = replyDao;
        this.likeDao = likeDao;
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

    public void getBoardList(BoardType boardType, Integer pageNum, Model model, BoardSearch boardSearch) {
        log.info("getBoardList call");
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
        } else {
            BoardPaging boardPaging = new BoardPaging();
            boardPaging.setType(boardType.getBoardType());
            boardPaging.setLane(boardType.getLane());
            model.addAttribute("boardPaging", boardPaging);
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

    public boolean getBoardInfo(String type, int bNum, Model model, HttpServletRequest request, HttpServletResponse response) {
        log.info("getBoardInfo call");
        Optional<?> op_boardInfo;
        HttpSession session = request.getSession();

        if (type.equals("free")) {
            if (boardDao.checkExistFreeBoard(bNum)) {
                ViewCountUp(type, bNum, request, response);
                op_boardInfo = Optional.ofNullable(boardDao.getFreeBoardInfo(bNum));
            } else {
                log.info("해당 번호의 게시글이 존재하지 않습니다.");
                return false;
            }
        } else {
            if (boardDao.checkExistLaneBoard(bNum)) {
                ViewCountUp(type, bNum, request, response);
                op_boardInfo = Optional.ofNullable(boardDao.getLaneBoardInfo(bNum));
            } else {
                log.info("해당 번호의 게시글이 존재하지 않습니다.");
                return false;
            }
        }

        log.info("op_boardInfo = {}", op_boardInfo.isPresent());
        log.info("op_boardInfo.get() = {}", op_boardInfo.get());

        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        log.info("op_id = {}", op_id.orElse("sessionId does not exist"));

        if (op_boardInfo.isPresent()) {
            if (type.equals("free")) {
                if (op_id.isPresent()) {    //회원 로그인 여부 확인 후 좋아요 클릭 여부 확인
                    boolean currentStatus = likeDao.checkFreeBoardLike(bNum, op_id.get().toString());
                    model.addAttribute("currentStatus", currentStatus);
                }
                model.addAttribute("freeBoardInfo", op_boardInfo.get());
            } else {
                if (op_id.isPresent()) {
                    boolean currentStatus = likeDao.checkLaneBoardLike(bNum, op_id.get().toString());
                    model.addAttribute("currentStatus", currentStatus);
                }
                model.addAttribute("laneBoardInfo", op_boardInfo.get());
            }
            model.addAttribute("boardType", type);
            return true;
        } else {
            return false;
        }
    }

    private void ViewCountUp(String type, int bNum, HttpServletRequest request, HttpServletResponse response) {
        log.info("조회수 로직 처리");
        Cookie[] cookies = request.getCookies();
        Cookie viewCookie = null;

        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie" + type + bNum)) {
                    log.info("이미 생성한 쿠키가 있음");
                    viewCookie = cookies[i];
                }
            }
        }

        if (viewCookie == null) {
            log.info("조회수 로직 쿠키 없음");
            Cookie newCookie = new Cookie("cookie" + type + bNum, "|" + bNum + "|");
            response.addCookie(newCookie);

            boolean result = type.equals("free") ? boardDao.freeBoardViewCountUp(bNum) :
                    boardDao.laneBoardViewCountUp(bNum);

            if (result) {
                System.out.println("조회수 증가");
            } else {
                System.out.println("조회수 증가 에러");
            }
        }

        else {
            System.out.println("cookie 있음");
            // 쿠키 값 받아옴.
            String value = viewCookie.getValue();
            System.out.println("cookie 값 : " + value);
        }
    }
}