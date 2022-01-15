package com.best.team.community.service;

import com.best.team.community.bean.FreeReply;
import com.best.team.community.bean.ReplyParam;
import com.best.team.community.dao.BoardDao;
import com.best.team.community.dao.ReplyDao;
import com.best.team.community.exception.DbException;
import com.best.team.member.bean.Member;
import com.best.team.member.dao.MemberDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class ReplyMM {


    private ReplyDao replyDao;
    private MemberDao memberDao;
    private BoardDao boardDao;

    @Autowired
    public ReplyMM(ReplyDao replyDao, MemberDao memberDao, BoardDao boardDao) {
        this.replyDao = replyDao;
        this.memberDao = memberDao;
        this.boardDao = boardDao;
    }

    public String getReplyList(String type, int bNum) throws JsonProcessingException {
        log.info("getReplyList call");
        List<?> replyList;
        System.out.println("type = " + type);
        System.out.println("type.equals(\"free\") = " + type.equals("free"));
        if (type.equals("free")) {
            replyList = replyDao.getFreeReplyList(bNum);
        } else {
            replyList = replyDao.getLaneReplyList(bNum);
        }
        return new ObjectMapper().writeValueAsString(replyList);
    }

    @Transactional
    public boolean addReply(String type, int bNum, ReplyParam replyParam, HttpSession session, Model model) throws JsonProcessingException, DbException {
        log.info("addReply call");
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
        List<?> replyList;
        if (!op_id.isPresent()) {
            return false;
        }

        Member member = memberDao.getMemberInfo(op_id.get().toString());
        if (type.equals("free")) {
            if (!replyParam.getContent().isEmpty()) {
                replyDao.addFreeReply(member, bNum, replyParam.getContent());
                boardDao.addCountFreeBReply(bNum);
                replyList = replyDao.getFreeReplyList(bNum);
            } else {
                log.info("empty contents");
                return false;
            }
        } else {
            if (!replyParam.getContent().isEmpty()) {
                replyDao.addLaneReply(member, bNum, replyParam.getContent());
                boardDao.addCountLaneBReply(bNum);
                replyList = replyDao.getLaneReplyList(bNum);
            } else {
                log.info("empty contents");
                return false;
            }
        }
        model.addAttribute("replyListJson", new ObjectMapper().writeValueAsString(replyList));
        return true;
    }

    @Transactional
    public boolean deleteReply(String type, int bNum, ReplyParam replyParam, HttpSession session, Model model) throws JsonProcessingException, DbException {
        log.info("deleteReply call");
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        log.info("op_id = {}", op_id.orElse("sessionId does not exist"));
        List<?> replyList;
        if (!op_id.isPresent()) {
            return false;
        }

        if (type.equals("free")) {
            if (replyParam.getR_type_num() != 0) {
                replyDao.deleteFreeReply(bNum, replyParam.getR_type_num(), op_id.get().toString());
                boardDao.deleteCountFreeBReply(bNum);
                replyList = replyDao.getFreeReplyList(bNum);
            } else {
                log.info("r_type_num = 0");
                return false;
            }
        } else {
            if (replyParam.getR_type_num() != 0) {
                replyDao.deleteLaneReply(bNum, replyParam.getR_type_num(), op_id.get().toString());
                boardDao.deleteCountLaneBReply(bNum);
                replyList = replyDao.getLaneReplyList(bNum);
            } else {
                log.info("r_type_num = 0");
                return false;
            }
        }
        model.addAttribute("replyListJson", new ObjectMapper().writeValueAsString(replyList));
        return true;
    }
}