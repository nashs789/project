package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ200ViewController {
    // 약관 페이지 - 이인복
    // PJ200M
    @RequestMapping(value = "/PJ200M")
    public ModelAndView terms(ModelAndView mav) {
        mav.setViewName("PJ200Views/PJ200M");

        return mav;
    }

    // 회원가입 페이지 - 이인복
    // PJ201M
    @RequestMapping(value = "/PJ201M")
    public ModelAndView join(@RequestParam HashMap<String, String> params, ModelAndView mav) {
        HashMap<String, String> data = new HashMap<String, String>();

        data.put("marketing", params.get("marketing"));

        mav.addObject("data", data);
        mav.setViewName("PJ200Views/PJ201M");

        return mav;
    }

    // 프로필 작성- 이인복
    // PJ202M
    @RequestMapping(value = "/PJ202M")
    public ModelAndView writeProfile(@RequestParam HashMap<String, String> params, ModelAndView mav) {
        String birth = params.get("inputYear") + "-" + params.get("inputMonth") + "-" + params.get("inputDay");
        String phone = "010" + params.get("inputPhone");
        String email = params.get("inputEmail") + "@" + params.get("inputDomain");

        HashMap<String, String> data = params;

        data.put("birth", birth);
        data.put("phone", phone);
        data.put("email", email);

        mav.addObject("data", data);

        mav.setViewName("PJ200Views/PJ202M");

        return mav;
    }

    // 회원정보수정 - 이인복
    // PJ203M
    @RequestMapping(value = "/PJ203M")
    public ModelAndView editInfo(ModelAndView mav) {
        int page = 1;

        mav.addObject("page", page);
        mav.setViewName("PJ200Views/PJ203M");

        return mav;
    }

    // 프로필 수정 페이지 - 이인복
    // PJ204M
    @RequestMapping(value = "/PJ204M")
    public ModelAndView editProfile(ModelAndView mav) {
        int page = 1;

        mav.addObject("page", page);
        mav.setViewName("PJ200Views/PJ204M");

        return mav;
    }

    // 아이디 찾기 페이지- 이인복
    // PJ205M
    @RequestMapping(value = "/PJ205M")
    public ModelAndView findID(ModelAndView mav) {
        mav.setViewName("PJ200Views/PJ205M");

        return mav;
    }

    // 비밀번호 찾기 페이지- 이인복
    // PJ206M
    @RequestMapping(value = "/PJ206M")
    public ModelAndView findPW(ModelAndView mav) {
        mav.setViewName("PJ200Views/PJ206M");

        return mav;
    }
}
