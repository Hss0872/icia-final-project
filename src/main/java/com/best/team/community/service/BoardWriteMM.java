package com.best.team.community.service;

import com.best.team.community.bean.BoardWriteParam;
import com.best.team.community.bean.FreeBoard;
import com.best.team.community.bean.LaneBoard;
import com.best.team.community.dao.BoardDao;
import com.best.team.member.bean.Member;
import com.best.team.member.dao.MemberDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
public class BoardWriteMM {

    private MemberDao memberDao;
    private BoardDao boardDao;


    @Autowired
    public BoardWriteMM(MemberDao memberDao, BoardDao boardDao) {
        this.memberDao = memberDao;
        this.boardDao = boardDao;
    }

    public ModelAndView addBoardWrite(BoardWriteParam boardWriteParam, HttpSession session) {
        log.info("addBoardWrite call");
        ModelAndView mav = new ModelAndView();
        String view = null;

        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        if (!op_id.isPresent()) {
            log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
            view = "redirect:/community";
        }

        Member member = memberDao.getMemberInfo(op_id.get().toString());
        boardWriteParam.setB_write_id(member.getM_id());
        boardWriteParam.setB_write_nickname(member.getM_nickname());

        System.out.println("boardWriteParam = " + boardWriteParam.getB_write_type());

        if (boardWriteParam.getB_write_type().equals("free")) {
            if (boardDao.freeBoardWriteSelKey(boardWriteParam)) {
                System.out.println("boardWriteParam = " + boardWriteParam.getB_write_id());
                view = "redirect:/community/board/free/" + boardWriteParam.getB_write_num();
            } else {    //????????? ??????
                view = "redirect:/community/board/write";
            }
        } else {
            if (boardDao.laneBoardWriteSelKey(boardWriteParam)) {
                System.out.println("boardWriteParam = " + boardWriteParam.getB_write_id());
                view = "redirect:/community/board/lane/" + boardWriteParam.getB_write_num();
            } else {    //????????? ??????
                view = "redirect:/community/board/write";
            }
        }
        mav.setViewName(view);
        return mav;
    }

    public void uploadImg(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
        // ?????? ?????? ??????
        UUID uid = UUID.randomUUID();

        HttpSession session = req.getSession();
        String root = session.getServletContext().getRealPath("/");
        System.out.println("root=" + root);
        String path = root + "resources/ckUpload/";

        File dir = new File(path);
        if (!dir.isDirectory()) {
            dir.mkdir();
        }

        OutputStream out = null;
        PrintWriter printWriter = null;

        // ?????????
        res.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        try {

            String fileName = upload.getOriginalFilename();  // ?????? ?????? ????????????
            byte[] bytes = upload.getBytes();

            // ????????? ??????
            String ckUploadPath = path + uid + "_" + fileName;
            System.out.println("ckUploadPath = " + ckUploadPath);

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush();  // out??? ????????? ???????????? ???????????? ?????????

            String callback = req.getParameter("CKEditorFuncNum");
            printWriter = res.getWriter();
            String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // ????????????

            // ???????????? ????????? ??????
            printWriter.println("<script type='text/javascript'>"
                    + "window.parent.CKEDITOR.tools.callFunction("
                    + callback + ",'" + fileUrl + "','???????????? ????????????????????????.')"
                    + "</script>");

            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean updateBoardPage(String type, int bNum, HttpSession session, Model model) {
        log.info("updateBoardPage call");

        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        if (!op_id.isPresent()) {
            log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
            return false;
        }

        if (type.equals("free")) {
            if (boardDao.checkExistFreeBoard(bNum)) {
                FreeBoard freeBoardInfo = boardDao.getFreeBoardInfo(bNum);
                //????????? ????????? ??????????????? ??????
                if (!freeBoardInfo.getB_free_id().equals(op_id.get().toString())) {
                    log.info("????????? ????????? ???????????? ???????????? ????????????.");
                    return false;
                }
                model.addAttribute("freeBoardInfo", freeBoardInfo);
                model.addAttribute("boardType", type);
                return true;
            } else {
                log.info("?????? ????????? ???????????? ???????????? ????????????.");
                return false;
            }
        } else {
            if (boardDao.checkExistLaneBoard(bNum)) {
                LaneBoard laneBoardInfo = boardDao.getLaneBoardInfo(bNum);
                //????????? ????????? ??????????????? ??????
                if (!laneBoardInfo.getB_lane_id().equals(op_id.get().toString())) {
                    log.info("????????? ????????? ???????????? ???????????? ????????????.");
                    return false;
                }
                model.addAttribute("laneBoardInfo", laneBoardInfo);
                model.addAttribute("boardType", type);
                return true;
            } else {
                log.info("?????? ????????? ???????????? ???????????? ????????????.");
                return false;
            }
        }
    }

    public ModelAndView updateBoard(BoardWriteParam boardWriteParam, HttpSession session, int bNum) {
        log.info("updateBoard call");
        ModelAndView mav = new ModelAndView();
        String view = null;

        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        if (!op_id.isPresent()) {
            log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
            view = "redirect:/community";
        }

        Member member = memberDao.getMemberInfo(op_id.get().toString());
        boardWriteParam.setB_write_num(bNum);
        boardWriteParam.setB_write_id(member.getM_id());
        boardWriteParam.setB_write_nickname(member.getM_nickname());

        System.out.println("boardWriteParam.getB_write_type().equals(\"free\") = " + boardWriteParam.getB_write_type().equals("free"));
        System.out.println("boardWriteParam = " + boardWriteParam.getB_write_num());

        if (boardWriteParam.getB_write_type().equals("free")) {
            if (boardDao.updateFreeBoard(boardWriteParam)) {
                System.out.println("boardWriteParam = " + boardWriteParam.getB_write_id());
                view = "redirect:/community/board/free/" + boardWriteParam.getB_write_num();
            } else {    //????????? ??????
                view = "redirect:/community/board/write";
            }
        } else {
            if (boardDao.updateLaneBoard(boardWriteParam)) {
                System.out.println("boardWriteParam = " + boardWriteParam.getB_write_id());
                view = "redirect:/community/board/lane/" + boardWriteParam.getB_write_num();
            } else {    //????????? ??????
                view = "redirect:/community/board/write";
            }
        }
        mav.setViewName(view);
        return mav;
    }

    public boolean deleteBoard(String type, int bNum, HttpSession session) {
        log.info("deleteBoard call");
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        if (!op_id.isPresent()) {
            log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
            return false;
        }

        if (type.equals("free")) {
            if (boardDao.checkExistFreeBoard(bNum)) {
                FreeBoard freeBoardInfo = boardDao.getFreeBoardInfo(bNum);
                //????????? ????????? ??????????????? ??????
                if (!freeBoardInfo.getB_free_id().equals(op_id.get().toString())) {
                    log.info("????????? ????????? ???????????? ???????????? ????????????.");
                    return false;
                }
                if (!boardDao.deleteFreeBoard(bNum, op_id.get().toString())) {
                    log.info("delete ??????");
                }
                return true;
            } else {
                log.info("?????? ????????? ???????????? ???????????? ????????????.");
                return false;
            }
        } else {
            if (boardDao.checkExistLaneBoard(bNum)) {
                LaneBoard laneBoardInfo = boardDao.getLaneBoardInfo(bNum);
                //????????? ????????? ??????????????? ??????
                if (!laneBoardInfo.getB_lane_id().equals(op_id.get().toString())) {
                    log.info("????????? ????????? ???????????? ???????????? ????????????.");
                    return false;
                }
                if (!boardDao.deleteLaneBoard(bNum, op_id.get().toString())) {
                    log.info("delete ??????");
                }
                return true;
            } else {
                log.info("?????? ????????? ???????????? ???????????? ????????????.");
                return false;
            }
        }
    }
}