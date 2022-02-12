package com.best.team.community.service;

import com.best.team.community.bean.BoardWriteParam;
import com.best.team.community.bean.FreeBoard;
import com.best.team.community.bean.LaneBoard;
import com.best.team.community.bean.UploadFile;
import com.best.team.community.controller.CommunityRestController;
import com.best.team.community.dao.BoardDao;
import com.best.team.community.dao.FileDao;
import com.best.team.community.userClass.FileClass;
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
import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
public class BoardWriteMM {

    private MemberDao memberDao;
    private BoardDao boardDao;
    private FileDao fileDao;

    @Autowired
    public BoardWriteMM(MemberDao memberDao, BoardDao boardDao, FileDao fileDao) {
        this.memberDao = memberDao;
        this.boardDao = boardDao;
        this.fileDao = fileDao;
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

        //미리보기 업로드한 파일 중 게시글에 사용된 파일 checkedUploadFileList 저장
        ArrayList<UploadFile> checkedUploadFileList = new ArrayList<>();

        log.info("uploadFileList size = {}", CommunityRestController.uploadFileList.size());
        for (UploadFile uploadFile : CommunityRestController.uploadFileList) {
            if (boardWriteParam.getB_write_content().contains(uploadFile.getSystem_file_name())) {
                checkedUploadFileList.add(uploadFile);
            }
        }

        //업로드 파일 List clear
        CommunityRestController.uploadFileList.clear();

        if (boardWriteParam.getB_write_type().equals("free")) {
            if (boardDao.freeBoardWriteSelKey(boardWriteParam)) {
                if (checkedUploadFileList.size() > 0) {
                    log.info("checkedUploadFileList size = {}", checkedUploadFileList.size());
                    for (UploadFile uploadFile : checkedUploadFileList) {
                        log.info("uploadFileName = {}", uploadFile.getOrigin_file_name());
                        uploadFile.setB_write_num(boardWriteParam.getB_write_num());
                        fileDao.addFreeBFile(uploadFile);
                        fileDao.updateFileUse(uploadFile);
                    }
                }
                System.out.println("boardWriteParam = " + boardWriteParam.getB_write_id());
                view = "redirect:/community/board/free/" + boardWriteParam.getB_write_num();
            } else {    //글쓰기 실패
                view = "redirect:/community/board/write";
            }
        } else {
            if (boardDao.laneBoardWriteSelKey(boardWriteParam)) {
                if (checkedUploadFileList.size() > 0) {
                    log.info("checkedUploadFileList size = {}", checkedUploadFileList.size());
                    for (UploadFile uploadFile : checkedUploadFileList) {
                        log.info("uploadFileName = {}", uploadFile.getOrigin_file_name());
                        uploadFile.setB_write_num(boardWriteParam.getB_write_num());
                        fileDao.addLaneBFile(uploadFile);
                        fileDao.updateFileUse(uploadFile);
                    }
                }
                System.out.println("boardWriteParam = " + boardWriteParam.getB_write_id());
                view = "redirect:/community/board/lane/" + boardWriteParam.getB_write_num();
            } else {    //글쓰기 실패
                view = "redirect:/community/board/write";
            }
        }
        mav.setViewName(view);
        return mav;
    }

    public void uploadImg(HttpServletRequest request, HttpServletResponse response, MultipartFile upload, ArrayList<UploadFile> uploadFileList) {

        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        HttpSession session = request.getSession();
        String root = session.getServletContext().getRealPath("/");
        System.out.println("root=" + root);
        String path = root + "resources/ckUpload/";

        File dir = new File(path);
        if (!dir.isDirectory()) {
            dir.mkdir();
        }

        // 폴더 크기 확인 후 -> 크기가 약 100메가 이상일 때 사용하지 않는 파일(USE_FL = 0인 파일)들 모두 삭제
        log.info("upload directory size = {}", FileClass.measureFolderSize(dir));
        if (FileClass.measureFolderSize(dir) > 100000000) {
            ArrayList<UploadFile> unusedFileList = fileDao.getUnusedFileList();
            for (UploadFile uploadFile : unusedFileList) {
                FileClass.deleteFile(path + uploadFile.getSystem_file_name());
            }
            if (fileDao.deleteUploadFile()) {
                log.info("delete 성공");
            } else {
                log.info("delete 실패");
            }
        }

        OutputStream out = null;
        PrintWriter printWriter = null;

        // 인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        try {

            String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
            byte[] bytes = upload.getBytes();

            // 업로드 경로
            String system_file_name = uid + "_" + fileName;
            String ckUploadPath = path + system_file_name;
            System.out.println("ckUploadPath = " + ckUploadPath);

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush();  // out에 저장된 데이터를 전송하고 초기화

            //UploadList에 upload 파일 이름 저장
            UploadFile uploadFile = new UploadFile();
            uploadFile.setSystem_file_name(system_file_name);
            log.info("system_file_name = {}", system_file_name);
            uploadFile.setOrigin_file_name(fileName);
            log.info("fileName = {}", fileName);
            uploadFileList.add(uploadFile);
            log.info("uploadFileList size = {}", uploadFileList.size());

            //db에 uploadFile 저장
            fileDao.addUploadFile(uploadFile);

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("<script type='text/javascript'>"
                    + "window.parent.CKEDITOR.tools.callFunction("
                    + callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')"
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
                //로그인 회원이 작성자인지 확인
                if (!freeBoardInfo.getB_free_id().equals(op_id.get().toString())) {
                    log.info("로그인 회원과 작성자가 일치하지 않습니다.");
                    return false;
                }
                model.addAttribute("freeBoardInfo", freeBoardInfo);
                model.addAttribute("boardType", type);
                return true;
            } else {
                log.info("해당 번호의 게시글이 존재하지 않습니다.");
                return false;
            }
        } else {
            if (boardDao.checkExistLaneBoard(bNum)) {
                LaneBoard laneBoardInfo = boardDao.getLaneBoardInfo(bNum);
                //로그인 회원이 작성자인지 확인
                if (!laneBoardInfo.getB_lane_id().equals(op_id.get().toString())) {
                    log.info("로그인 회원과 작성자가 일치하지 않습니다.");
                    return false;
                }
                model.addAttribute("laneBoardInfo", laneBoardInfo);
                model.addAttribute("boardType", type);
                return true;
            } else {
                log.info("해당 번호의 게시글이 존재하지 않습니다.");
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
            } else {    //글쓰기 실패
                view = "redirect:/community/board/write";
            }
        } else {
            if (boardDao.updateLaneBoard(boardWriteParam)) {
                System.out.println("boardWriteParam = " + boardWriteParam.getB_write_id());
                view = "redirect:/community/board/lane/" + boardWriteParam.getB_write_num();
            } else {    //글쓰기 실패
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
                //로그인 회원이 작성자인지 확인
                if (!freeBoardInfo.getB_free_id().equals(op_id.get().toString())) {
                    log.info("로그인 회원과 작성자가 일치하지 않습니다.");
                    return false;
                }
                if (!boardDao.deleteFreeBoard(bNum, op_id.get().toString())) {
                    log.info("delete 실패");
                }
                return true;
            } else {
                log.info("해당 번호의 게시글이 존재하지 않습니다.");
                return false;
            }
        } else {
            if (boardDao.checkExistLaneBoard(bNum)) {
                LaneBoard laneBoardInfo = boardDao.getLaneBoardInfo(bNum);
                //로그인 회원이 작성자인지 확인
                if (!laneBoardInfo.getB_lane_id().equals(op_id.get().toString())) {
                    log.info("로그인 회원과 작성자가 일치하지 않습니다.");
                    return false;
                }
                if (!boardDao.deleteLaneBoard(bNum, op_id.get().toString())) {
                    log.info("delete 실패");
                }
                return true;
            } else {
                log.info("해당 번호의 게시글이 존재하지 않습니다.");
                return false;
            }
        }
    }
}