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
    // PJ000
    @RequestMapping(value = "/memAdmin")
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

        mav.setViewName("CJM/memAdmin");

        return mav;
    }

    // 내부관리자-자유게시판
    // PJ001
    @RequestMapping(value = "/communityAdmin")
    public ModelAndView communityAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("CJM/communityAdmin");

        return mav;
    }

    // 내부관리자-여행일지
    // PJ002
    @RequestMapping(value = "/TravelDiaryAdmin")
    public ModelAndView TravelDiaryAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("CJM/TravelDiaryAdmin");

        return mav;
    }

    // 내부관리자-공지관리
    // PJ003
    @RequestMapping(value = "/noticeAdmin")
    public ModelAndView noticeAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("CJM/noticeAdmin");

        return mav;
    }

    // 내부관리자-신고관리
    // PJ004
    @RequestMapping(value = "/reportAdmin")
    public ModelAndView reportAdmin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int page = 1;

        if(params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }

        mav.addObject("page", page);

        mav.setViewName("CJM/reportAdmin");

        return mav;
    }
}
