package com.best.team.member.service;

import com.best.team.member.bean.Member;
import com.best.team.member.dao.MemberDao;
import com.best.team.member.userClass.Tempkey;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Service
public class MemberMM {

    private MemberDao memberDao;
    private MailService mailService;

    ModelAndView mav = new ModelAndView();

    @Autowired
    public MemberMM(MemberDao memberDao, MailService mailService) {
        this.memberDao = memberDao;
        this.mailService = mailService;
    }

    public void join(Member member, Model model) {
        // 아이디 비밀번호 중복 확인 후 authkey 입력
        Tempkey tempkey = new Tempkey();
        String authkey = tempkey.getKey(30, false);
        log.info("authkey = {}", authkey);
        member.setM_auth_key(authkey);
        
        if (memberDao.join(member)) {
            log.info("회원가입 성공");
        } else {
            model.addAttribute("msg", "로그인 실패");
            return;
        }

        String subject = "회원가입 서비스 이메일 인증 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("<h1>회원 가입 메일인증 입니다</h1>")
                .append("<a href='http://localhost:8090/emailconfirm?m_email=")
                .append(member.getM_email()).append("&authkey=").append(authkey)
                .append("'>클릭하세요</a>");
        System.out.println(sb.toString());
        mailService.send(subject, sb.toString(), "hssproject0872@gmail.com", member.getM_email(), null);
    }

    //이메일 인증 로직
    public ModelAndView checkValue(Member member, RedirectAttributes ettr){
        if(memberDao.checkValue(member)) {    //auth 번호 0인지 1인지 체크
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
}