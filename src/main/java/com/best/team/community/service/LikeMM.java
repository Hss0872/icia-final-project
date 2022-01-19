package com.best.team.community.service;

import com.best.team.community.dao.BoardDao;
import com.best.team.community.dao.LikeDao;
import com.best.team.community.exception.DbException;
import com.best.team.member.bean.Member;
import com.best.team.member.dao.MemberDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.Optional;

@Service
@Slf4j
public class LikeMM {

    private LikeDao likeDao;
    private MemberDao memberDao;
    private BoardDao boardDao;

    @Autowired
    public LikeMM(LikeDao likeDao, MemberDao memberDao, BoardDao boardDao) {
        this.likeDao = likeDao;
        this.memberDao = memberDao;
        this.boardDao = boardDao;
    }

    @Transactional
    public boolean addBoardLike(String type, int bNum, HttpSession session, Model model) throws DbException {
        log.info("addBoardLike call");
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        if (!op_id.isPresent()) {
            log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
            return false;
        }

        int likeCount;

        Member member = memberDao.getMemberInfo(op_id.get().toString());
        if (type.equals("free")) {
            if (!likeDao.checkFreeBoardLike(bNum, member.getM_id())) {
                likeDao.addFreeBoardLike(bNum, member);
                boardDao.incrCountFreeBLike(bNum);
                likeCount = boardDao.selectCountFreeBLike(bNum);
            } else {
                return false;
            }
        } else {
            if (!likeDao.checkLaneBoardLike(bNum, member.getM_id())) {
                likeDao.addLaneBoardLike(bNum, member);
                log.info("addLaneBoardLike 지남");
                boardDao.incrCountLaneBLike(bNum);
                log.info("incrCountLaneBLike 지남");
                likeCount = boardDao.selectCountLaneBLike(bNum);
                log.info("selectCountLaneBLike 지남");
            } else {
                return false;
            }
        }
        log.info("likeCount = {}", likeCount);
        model.addAttribute("likeCount", likeCount);
        return true;
    }

    @Transactional
    public boolean deleteBoardLike(String type, int bNum, HttpSession session, Model model) throws DbException {
        log.info("deleteBoardLike call");
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        if (!op_id.isPresent()) {
            log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
            return false;
        }

        int likeCount;

        Member member = memberDao.getMemberInfo(op_id.get().toString());
        if (type.equals("free")) {
            if (likeDao.checkFreeBoardLike(bNum, member.getM_id())) {
                likeDao.deleteFreeBoardLike(bNum, member);
                boardDao.decrCountFreeBLike(bNum);
                likeCount = boardDao.selectCountFreeBLike(bNum);
                log.info("likcCount = {}", likeCount);
            } else {
                return false;
            }
        } else {
            if (likeDao.checkLaneBoardLike(bNum, member.getM_id())) {
                likeDao.deleteLaneBoardLike(bNum, member);
                boardDao.decrCountLaneBLike(bNum);
                likeCount = boardDao.selectCountLaneBLike(bNum);
            } else {
                return false;
            }
        }
        log.info("likeCount = {}", likeCount);
        model.addAttribute("likeCount", likeCount);
        return true;
    }
}