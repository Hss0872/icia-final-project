package com.best.team.member.controller;

import com.best.team.member.bean.Member;
import com.best.team.member.service.MemberMM;
import com.best.team.member.userClass.Tempkey;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

    ModelAndView mav;

    @Autowired
    private MemberMM memberMM;


    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String access() {
        return "joinFrm";
    }

    @GetMapping(value = "/emailconfirm")   //restController
    public ModelAndView confirmEmail(Member member, RedirectAttributes ettr) {
        mav = memberMM.checkValue(member, ettr);
        return mav;
    }

    @PostMapping(value = "/access", produces = "application/json;utf-8")
    @ResponseBody
    public ResponseEntity access(@RequestBody String json_member, HttpSession session) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_member, Member.class);
        System.out.println("member = " + member);
        ResponseEntity<?> result = null;
        String accessCheck = memberMM.access(member, session);
        System.out.println("accessCheck = " + accessCheck);

        if (accessCheck == "0") {  //성공
            result = ResponseEntity.ok(obj.writeValueAsString("0"));
        } else if (accessCheck == "1") {    //이메일 인증여부
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(obj.writeValueAsString("1"));
        } else if (accessCheck == "2") {   //비번불일치
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(obj.writeValueAsString("2"));

        } else if (accessCheck == "3") {     //아이디불일치
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(obj.writeValueAsString("3"));
        }

        log.info("access 성공");
        return result;
    }

    @PostMapping("/logout")
    public void logout(HttpSession session) {
        session.invalidate();
//        return "redirect:/community";
    }


    //아이디 찾기
    @PostMapping(value = "/id/search")
    @ResponseBody
    public ResponseEntity searchId(@RequestBody String json_value) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_value, Member.class);
        log.info("member:{}", member);

        ResponseEntity<?> result = null;
        String idSearch = memberMM.searchId(member);

        System.out.println("idSearch = " + idSearch);
        if (idSearch == "false") {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("");
        } else {
            System.out.println("obj.writeValueAsString(idSearch) = " + obj.writeValueAsString(idSearch));
            result = ResponseEntity.ok(obj.writeValueAsString(idSearch));
        }
        return result;
    }


    //비번 찾기
    @PostMapping(value = "/pw/search", produces = "application/json;utf-8")
    @ResponseBody
    public ResponseEntity searchPw(@RequestBody String json_mail) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_mail, Member.class);
        ResponseEntity<?> result = null;

        Tempkey tempkey = new Tempkey();   //난수 키값
        String key = tempkey.getKey(5, false);

        boolean havingEmail = memberMM.searchPW(member, key);
        System.out.println("havingEmail = " + havingEmail);

        if (!havingEmail) {    //이메일이 존재하지않을때
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("1");
        } else {    //true
            result = ResponseEntity.ok(obj.writeValueAsString(key));
        }
        return result;
    }

    //비밀번호 변경
    @PostMapping(value = "/pw/change")
    @ResponseBody
    public ResponseEntity changePw(@RequestBody String json_value, Model model) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_value, Member.class);
        ResponseEntity<?> result = null;
        boolean changeNewPw = memberMM.changePw(member, model);
        System.out.println("새로운 비밀번호 = " + changeNewPw);

        if (!changeNewPw) {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("");
        } else {    //성공적으로 비번
            result = ResponseEntity.ok("");
        }
        return result;
    }


    //마이페이지 기존 비밀번호 확실한지 확인
    @PostMapping(value = "/profile/pw")
    @ResponseBody
    public ResponseEntity provePw(@RequestBody String json_member) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_member, Member.class);
        ResponseEntity<?> result = null;
        boolean pwProof = memberMM.provePw(member);
        log.info("{} 기존비번확인여부", pwProof);

        if (!pwProof) {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("");
        } else {    //기존비밀번호 불일치
            result = ResponseEntity.ok("");
        }
        return result;

    }


    //마이페이지 프로필 셀렉해오기
    @PostMapping(value = "/profile/select")
    @ResponseBody
    public ResponseEntity selectProfile(@RequestBody String json_id) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_id, Member.class);
        ResponseEntity<?> result = null;
        Member jsonMember = memberMM.selctProfile(member);

        if (jsonMember == null) {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("");
        } else {    //비번 변경완료
            result = ResponseEntity.ok(obj.writeValueAsString(jsonMember));
        }
        return result;

    }


    //마이페이지 프로필 최종 업데이트
    @PostMapping(value = "/profile/update")
    @ResponseBody
    public ResponseEntity updateProfile(@RequestBody Map map) {
        System.out.println("map = " + map);
        ResponseEntity<?> result = null;
        boolean updateMember = memberMM.updateProfile(map);
        System.out.println("updateMember = " + updateMember);

        if (!updateMember) {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("");
        } else {    //프로필 업데이트 완료
            result = ResponseEntity.ok("");
        }
        return result;
    }

    // 마이페이지 작성글 찾기

    @ResponseBody
    @RequestMapping(value = "/profile/getboardlist", method = RequestMethod.POST, consumes = "application/json;"
            , produces = "application/json;utf-8")
    public ResponseEntity<?> getProfileBoardList(@RequestBody Member member, HttpSession session, Model model) throws JsonProcessingException {
        boolean result = memberMM.getProfileBoardList(member, session, model);
        return result ? ResponseEntity.ok(model.getAttribute("boardList")) :
                ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(model.getAttribute("fail"));
    }

    @ResponseBody
    @RequestMapping(value = "/profile/getreplylist", method = RequestMethod.POST, consumes = "application/json;"
            , produces = "application/json;utf-8")
    public ResponseEntity<?> getProfileReplyList(@RequestBody Member member, HttpSession session, Model model) throws JsonProcessingException {
        boolean result = memberMM.getProfileReplyList(member, session, model);
        return result ? ResponseEntity.ok(model.getAttribute("replyList")) :
                ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(model.getAttribute("fail"));
    }
}//end