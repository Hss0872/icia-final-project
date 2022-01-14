package com.best.team.member.service;

import com.best.team.member.bean.Member;
import com.best.team.member.dao.MemberDao;
import com.best.team.member.userClass.Tempkey;
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
import java.util.Random;

@Slf4j
@Service
public class MemberMM {

    private MemberDao memberDao;
    private MailService mailService;

    @Autowired
    public MemberMM(MemberDao memberDao, MailService mailService) {
        this.memberDao = memberDao;
        this.mailService = mailService;
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
        mav.setViewName("redirect:/community");
        return mav;
    }

    //로그인
    public ModelAndView access(Member member, HttpSession session, RedirectAttributes loginAtr) {
        mav = new ModelAndView();
        String view = null;
        // 스프링은 복호화 안되지만 비교는 해줌. //암호화<--->복호화
        BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); // 암호화된 비번과 아이디랑 일치한지 확인해야하니까
        String encodedPwd = memberDao.getSecurityPwd(member.getM_id()); // 1111-->$2a$10$M/boV.EJkuwZHD0LMX0BHuGr8vT6zK0Ua9
        boolean emailAcceptValue = memberDao.getValueEamilAccept(member);

        if (encodedPwd != null) {
            if (pwdEncoder.matches(member.getM_pw(), encodedPwd)) {
                if (emailAcceptValue) {
                    log.info("로그인 성공");
                    // 로그인 성공 마킹
                    session.setAttribute("id", member.getM_id()); // "id" parameter의 속성 mb.getM_id 인스턴스 가져와서 session객체에 담아주기
                    session.setAttribute("member", member); // "id" parameter의 속성 mb.getM_id 인스턴스 가져와서 session객체에 담아주기
                    view = "redirect:/community";
                    loginAtr.addFlashAttribute("checkLogin", "0");
                } else {
                    view = "community";
                    mav.addObject("checkLogin", "3");
                }
            } else { //비번 불일치
                view = "community";
                mav.addObject("checkLogin", "1");
            }
        } else {  //아이디 불일치
            view = "community";
            mav.addObject("checkLogin", "2");
        }
        mav.setViewName(view);
        return mav;
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
                    .append("<div>"+key+"</div>");
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

        if(doHaveId) {  //아이디 존재여부 검사
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
        return doHaveEmail ?  memberDao.getId(member): "false";
    }
} //end
