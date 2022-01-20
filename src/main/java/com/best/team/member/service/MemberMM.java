package com.best.team.member.service;

import com.best.team.community.bean.FreeBoard;
import com.best.team.community.bean.FreeReply;
import com.best.team.community.bean.LaneBoard;
import com.best.team.community.bean.LaneReply;
import com.best.team.community.dao.BoardDao;
import com.best.team.community.dao.ReplyDao;
import com.best.team.member.bean.Member;
import com.best.team.member.dao.MemberDao;
import com.best.team.member.userClass.Tempkey;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Service
public class MemberMM {

    private MemberDao memberDao;
    private MailService mailService;
    private BoardDao boardDao;
    private ReplyDao replyDao;

    @Autowired
    public MemberMM(MemberDao memberDao, MailService mailService, BoardDao boardDao, ReplyDao replyDao) {
        this.memberDao = memberDao;
        this.mailService = mailService;
        this.boardDao = boardDao;
        this.replyDao = replyDao;
    }

    ModelAndView mav;


    //이메일 인증 로직
    public ModelAndView checkValue(Member member, RedirectAttributes ettr) {
        mav = new ModelAndView();
        if (memberDao.checkValue(member)) {    //auth 번호 0인지 1인지 체크
            if (memberDao.confirmEmail(member)) {  //email주소와 key값이 같은지 체크
                if (memberDao.doAccept(member)) {    //auth번호 1로 업데이트해주기
                    ettr.addFlashAttribute("emailCheck", "1");   //이메일 인증 성공
                } else {
                    log.info("{} 실패", "doAccept");
                    ettr.addFlashAttribute("emailCheck", "2");  //실패
                }
            }
        } else {
            ettr.addFlashAttribute("emailCheck", "3");  //인증 중복되었을때
        }
        mav.setViewName("redirect:/community/board/free");
        return mav;
    }

    //로그인
    public String access(Member member, HttpSession session) {
        // 스프링은 복호화 안되지만 비교는 해줌. //암호화<--->복호화
        BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); // 암호화된 비번과 아이디랑 일치한지 확인해야하니까
        String encodedPwd = memberDao.getSecurityPwd(member.getM_id()); // 1111-->$2a$10$M/boV.EJkuwZHD0LMX0BHuGr8vT6zK0Ua9
        boolean emailAcceptValue = memberDao.getValueEamilAccept(member);
        String accessCheck = null;

        System.out.println("encodedPwd != null = " + encodedPwd != null);
        if (encodedPwd != null) {
            System.out.println("pwdEncoder.matches(member.getM_pw(), encodedPwd) = " + pwdEncoder.matches(member.getM_pw(), encodedPwd));
            if (pwdEncoder.matches(member.getM_pw(), encodedPwd)) {
                System.out.println("emailAcceptValue = " + emailAcceptValue);
                if (emailAcceptValue) {
                    log.info("로그인 성공");
                    accessCheck = "0";
                    session.setAttribute("id", member.getM_id()); // "id" parameter의 속성 mb.getM_id 인스턴스 가져와서 session객체에 담아주기
                    // 로그인 성공 마킹
                    /*view = "redirect:/community";*/
                } else { //이메일 인증 여부
                    accessCheck = "1";
                }
            } else { //비번 불일치
                accessCheck = "2";
            }
        } else {  //아이디 불일치
            accessCheck = "3";

        }
        return accessCheck;
    }

    //비번 찾기 restController
    public boolean searchPW(Member member, String key) {  //httpSession session
        log.info("searchPw call");
        ModelAndView mav = new ModelAndView();
        String view = null;
        Boolean havingEmail = memberDao.hasEmail(member);


        if (havingEmail) {
            String subject = "비밀번호 찾기 서비스 이메일 인증 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("<h1>비밀번호 찾기 메일인증 입니다</h1>")
                    .append("<div>" + key + "</div>");
            System.out.println(sb.toString());
            mailService.send(subject, sb.toString(), "hssproject0872@gmail.com", member.getM_email(), null);
        }
        return havingEmail;
    }

    //클라이언트 비밀번호 변경
    public boolean changePw(Member member, Model model) {
        BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();   //암호화된 비번과 아이디랑 일치한지 확인해야하니까
        member.setM_pw(pwdEncoder.encode(member.getM_pw()));

        Boolean doHaveId = memberDao.hasId(member);
        log.info("아이디존재유무:" + doHaveId);
        Boolean newPw = memberDao.changePw(member);
        log.info("비번변경 확인:" + newPw);

        if (doHaveId) {  //아이디 존재여부 검사
            if (newPw) {

            } else {
                model.addAttribute("changePwCheck", "2");
            }
        }
        return newPw;
    }

    public String searchId(Member member) {
        Boolean doHaveEmail = memberDao.hasEmail(member);
        log.info("이메일 존재유무 :" + doHaveEmail);
        return doHaveEmail ? memberDao.getId(member) : "false";
    }

    //마이페이지 기존비번 일치확인
    public boolean provePw(Member member) {
        BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();   //암호화된 비번과 아이디랑 일치한지 확인해야하니까
        /*member.setM_pw(pwdEncoder.encode(member.getM_pw()));*/
        String encodedPwd = memberDao.getSecurityPwd(member.getM_id());
        System.out.println("encodedPwd = " + encodedPwd);
        boolean profilePw = pwdEncoder.matches(member.getM_pw(), encodedPwd);
        System.out.println("profilePw = " + profilePw);
        log.info("{} 기존비번확인",member.getM_id());

        if (encodedPwd != null) {
            if (profilePw) {

            }
        }
        return profilePw;
    }



    //마이페이지 프로필 셀렉해오기
    public Member selctProfile(Member member) {
        Member profileSelect = memberDao.selectProfile(member);
        System.out.println("profileSelect = " + profileSelect);
        return profileSelect;
    }



    //마이페이지 프로필 최종변경
    public boolean updateProfile(Map map){
        BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
        String m_newPw = pwdEncoder.encode(String.valueOf(map.get("m_newPw")));
        map.put("m_newPw",m_newPw );
        System.out.println("m_newPw = " + m_newPw);
        
        boolean profileUpdate = memberDao.updateProfile(map);
        System.out.println("profileUpdate = " + profileUpdate);
        return profileUpdate;
    }

    public boolean getProfileBoardList(Member member, HttpSession session, Model model) throws JsonProcessingException {
        log.info("getBoardList call");
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        ObjectMapper objectMapper = new ObjectMapper();

        if (op_id.isPresent()) {
            if (op_id.get().toString().equals(member.getM_id())) {
                List<FreeBoard> freeBoardList = boardDao.getFreeBoardList(member);
                List<LaneBoard> laneBoardList = boardDao.getLaneBoardList(member);
                if (freeBoardList == null && laneBoardList == null) {
                    return false;
                }
                if (freeBoardList == null && laneBoardList != null) {
                    model.addAttribute("boardList", objectMapper.writeValueAsString(laneBoardList));
                    return true;
                } else if (freeBoardList != null && laneBoardList == null) {
                    model.addAttribute("boardList", objectMapper.writeValueAsString(freeBoardList));
                    return true;
                } else if (freeBoardList != null && laneBoardList != null){
                    List<Object> boardList = Stream.concat(freeBoardList.stream(), laneBoardList.stream())
                            .collect(Collectors.toList());
                    model.addAttribute("boardList", objectMapper.writeValueAsString(boardList));
                    return true;
                }
            } else {
                log.info("동일한 아이디가 아니다.");
            }
        } else {
            log.info("아이디가 존재하지 않는다.");
        }
        model.addAttribute("fail", objectMapper.writeValueAsString("fail"));
        return false;
    }

    public boolean getProfileReplyList(Member member, HttpSession session, Model model) throws JsonProcessingException {
        log.info("getReplyList call");
        Optional<Object> op_id = Optional.ofNullable(session.getAttribute("id"));
        ObjectMapper objectMapper = new ObjectMapper();

        if (op_id.isPresent()) {
            if (op_id.get().toString().equals(member.getM_id())) {
                List<FreeReply> freeReplyList = replyDao.getProfileFreeReplyList(member);
                List<LaneReply> laneReplyList = replyDao.getProfileLaneReplyList(member);
                if (freeReplyList == null && laneReplyList == null) {
                    return false;
                }
                if (freeReplyList == null && laneReplyList != null) {
                    model.addAttribute("replyList", objectMapper.writeValueAsString(laneReplyList));
                    return true;
                } else if (freeReplyList != null && laneReplyList == null) {
                    model.addAttribute("replyList", objectMapper.writeValueAsString(freeReplyList));
                    return true;
                } else if (freeReplyList != null && laneReplyList != null){
                    List<Object> boardList = Stream.concat(freeReplyList.stream(), laneReplyList.stream())
                            .collect(Collectors.toList());
                    model.addAttribute("replyList", objectMapper.writeValueAsString(boardList));
                    return true;
                }
            } else {
                log.info("동일한 아이디가 아니다.");
            }
        } else {
            log.info("아이디가 존재하지 않는다.");
        }
        model.addAttribute("fail", objectMapper.writeValueAsString("fail"));
        return false;
    }
}//end