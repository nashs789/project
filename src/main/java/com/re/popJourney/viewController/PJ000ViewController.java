package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ000ViewController {


    // 내부관리자-회원관리
    // PJ000M
    // memAdmin
    @RequestMapping(value = "/PJ000M")
    public ModelAndView memAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if (params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        if (params.get("sortGbn") != null) {
            page = Integer.parseInt(params.get("sortGbn"));
        }

        if (params.get("sexGbn") != null) {
            page = Integer.parseInt(params.get("sexGbn"));
        }

        mav.addObject("page", page);

        mav.setViewName("PJ000Views/PJ000M");

        return mav;
    }

    // 내부관리자-자유게시판
    // PJ001
    // communityAdmin
    @RequestMapping(value = "/PJ001M")
    public ModelAndView communityAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("PJ000Views/PJ001M");

        return mav;
    }

    // 내부관리자-여행일지
    // PJ002
    // TravelDiaryAdmin
    @RequestMapping(value = "/PJ002M")
    public ModelAndView TravelDiaryAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("PJ000Views/PJ002M");

        return mav;
    }

    // 내부관리자-공지관리
    // PJ003
    // noticeAdmin
    @RequestMapping(value = "/PJ003M")
    public ModelAndView noticeAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("PJ000Views/PJ003M");

        return mav;
    }

    // 내부관리자-신고관리
    // PJ004
    // reportAdmin
    @RequestMapping(value = "/PJ004M")
    public ModelAndView reportAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("PJ000Views/PJ004M");

        return mav;
    }
}
