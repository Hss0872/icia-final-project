package com.best.team.member.service;
import com.best.team.member.bean.Member;
import com.best.team.member.dao.JoinDao;
import com.best.team.member.userClass.Tempkey;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
@Slf4j
public class JoinMM {

    private JoinDao jDao;
    private MailService mailService;

    @Autowired
    public JoinMM(JoinDao jDao, MailService mailService) {
        this.jDao = jDao;
        this.mailService = mailService;
    }

    public Boolean dupleCheck(Member member) {
        System.out.println("member = " + member);

        //중복 검사 매개변수 두개 만들어서 던지기
        String duple_type = null;
        String duple_member = null;

        if (member.getM_id() == null) { //지양 해야하는 코드 왜냐하면 유지보수 나중 생각해서
            if(member.getM_nickname() == null) {
                if (member.getM_email() == null) {
                    duple_type = null;
                    duple_member = null;
                } else {
                    duple_type = "m_email";
                    duple_member = member.getM_email();
                }
            } else {
                duple_type = "m_nickname";
                duple_member = member.getM_nickname();
            }
        } else {
            duple_type = "m_id";
            duple_member = member.getM_id();
        }
        System.out.println("duple_type = " + duple_type);
        System.out.println("duple_member = " + duple_member);

        Boolean idCheckResult = jDao.dupleCheck(duple_type, duple_member);
        System.out.println("idCheckResult = " + idCheckResult);
        return idCheckResult;
    }


    public ModelAndView joinComplete(Member member, RedirectAttributes rttr) {
        ModelAndView mav = new ModelAndView();
        String view = null;
        // 스프링은 암호화는 복호화 불가능
        BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
        member.setM_pw(pwdEncoder.encode(member.getM_pw())); // 1111->dkjfldkjflksdjflkasdjlf 이런식으로 암호화 인자를 mb 비번에 던져주기

        Tempkey tempkey = new Tempkey();
        String m_auth_key = tempkey.getKey(30, false);
        System.out.println("key = " + m_auth_key);
        member.setM_auth_key(m_auth_key); //이메일 인증키

        String subject = "회원가입 서비스 이메일 인증 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("<h1>회원 가입 메일인증 입니다</h1>")
                .append("<a href='http://localhost:8090/member/emailconfirm?m_email=")
                .append(member.getM_email()).append("&m_auth_key=").append(m_auth_key)
                .append("'>클릭하세요</a>");
        System.out.println(sb.toString());

        if (jDao.joinComplete(member)) {
            mailService.send(subject, sb.toString(), "hssproject0872@gmail.com", member.getM_email(), null);
            view = "redirect:/community";
            rttr.addFlashAttribute("check", 1);   //queryString을 없애주는 역할
        } else {
            view = "joinFrm";
        }
        mav.setViewName(view);
        return mav;
    }
}
