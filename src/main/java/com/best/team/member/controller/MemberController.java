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
public class  MemberController {

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

        if (accessCheck == "0") {  //??????
            result = ResponseEntity.ok(obj.writeValueAsString("0"));
        } else if (accessCheck == "1") {    //????????? ????????????
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(obj.writeValueAsString("1"));
        } else if (accessCheck == "2") {   //???????????????
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(obj.writeValueAsString("2"));

        } else if (accessCheck == "3") {     //??????????????????
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body(obj.writeValueAsString("3"));
        }

        log.info("access ??????");
        return result;
    }

    @PostMapping("/logout")
    public void logout(HttpSession session) {
        session.invalidate();
//        return "redirect:/community";
    }


    //????????? ??????
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


    //?????? ??????
    @PostMapping(value = "/pw/search", produces = "application/json;utf-8")
    @ResponseBody
    public ResponseEntity searchPw(@RequestBody String json_mail) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_mail, Member.class);
        ResponseEntity<?> result = null;

        Tempkey tempkey = new Tempkey();   //?????? ??????
        String key = tempkey.getKey(5, false);

        boolean havingEmail = memberMM.searchPW(member, key);
        System.out.println("havingEmail = " + havingEmail);

        if (!havingEmail) {    //???????????? ?????????????????????
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("1");
        } else {    //true
            result = ResponseEntity.ok(obj.writeValueAsString(key));
        }
        return result;
    }

    //???????????? ??????
    @PostMapping(value = "/pw/change")
    @ResponseBody
    public ResponseEntity changePw(@RequestBody String json_value) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_value, Member.class);
        ResponseEntity<?> result = null;
        String changeNewPw = memberMM.changePw(member);
        System.out.println("????????? ???????????? = " + changeNewPw);

        if (changeNewPw == "0") {   //????????? ?????? x
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("");
        } else {    //??????????????? ????????????
            result = ResponseEntity.ok("");
        }
        return result;
    }


    //??????????????? ?????? ???????????? ???????????? ??????
    @PostMapping(value = "/profile/pw")
    @ResponseBody
    public ResponseEntity provePw(@RequestBody String json_member) throws JsonProcessingException {
        ObjectMapper obj = new ObjectMapper();
        Member member = obj.readValue(json_member, Member.class);
        ResponseEntity<?> result = null;
        boolean pwProof = memberMM.provePw(member);
        log.info("{} ????????????????????????", pwProof);

        if (!pwProof) {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).
                    body("");
        } else {    //?????????????????? ?????????
            result = ResponseEntity.ok("");
        }
        return result;

    }


    //??????????????? ????????? ???????????????
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
        } else {    //?????? ????????????
            result = ResponseEntity.ok(obj.writeValueAsString(jsonMember));
        }
        return result;

    }


    //??????????????? ????????? ?????? ????????????
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
        } else {    //????????? ???????????? ??????
            result = ResponseEntity.ok("");
        }
        return result;
    }

    // ??????????????? ????????? ??????

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