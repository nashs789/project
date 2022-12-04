package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ500ViewController {

    // 마이페이지 썸네일
    // PJ500M
    // myPage
    @RequestMapping(value = "/PJ500M")
    public ModelAndView myPage(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        mav.setViewName("PJ500Views/PJ500M");

        return mav;
    }

    // 마이페이지 북마크
    // PJ501M
    // myPageBMK
    @RequestMapping(value = "/PJ501M")
    public ModelAndView myPageBMK(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        mav.setViewName("PJ500Views/PJ501M");

        return mav;

    }

    // 마이페이지 팔로워
    // PJ502M
    @RequestMapping(value = "/PJ502M")
    public ModelAndView myPageFollower(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        mav.setViewName("PJ500Views/PJ502M");

        return mav;

    }

    // 마이페이지 팔로잉
    // PJ503M
    // myPageFollowing
    @RequestMapping(value = "/PJ503M")
    public ModelAndView myPageFollowing(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        mav.setViewName("PJ500Views/PJ503M");

        return mav;

    }

    //북마크 상세보기
    // PJ504M
    // myPageBMKDetail
    @RequestMapping(value = "/PJ504M")
    public ModelAndView myPageBMKDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) {
        // re-fact
        // int cnt = ipjs.BMKDetailCnt(params);

        // mav.addObject("cnt", cnt);
        // mav.addObject("BMKNo", params.get("BMKNo"));
        mav.setViewName("PJ500Views/PJ504M");

        return mav;
    }

    // 지역별 사진
    // PJ505M
    // myPageMap
    @RequestMapping(value = "/PJ505M")
    public ModelAndView myPageMap(ModelAndView mav) {

        mav.setViewName("PJ500Views/PJ505M");

        return mav;
    }

    //지역별 사진 모아보기
    // PJ506M
    // myPageMapDetail
    @RequestMapping(value = "/PJ506M")
    public ModelAndView myPageMapDetail(ModelAndView mav, @RequestParam HashMap<String, String> params) {

        // re-facr
        // int cnt = ipjs.regionListCnt(params);

        mav.addObject("regionNo", params.get("regionNo"));
        // mav.addObject("cnt", cnt);
        mav.setViewName("PJ500Views/PJ506M");

        return mav;
    }

    // 다른 사용자 페이지
    // PJ507M
    // userPage
    @RequestMapping(value = "/PJ507M")
    public ModelAndView userPage(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        // re-fact
        int page = 1;
        // int journalCnt = ipjs.journalCnt2(params);

        /*
        if(journalCnt != 0)
        {
            mav.addObject("cnt", journalCnt);
        }
        else if(journalCnt == 0)
        {
            mav.addObject("cnt", 0);
        }
        mav.addObject("page", page);

        mav.addObject("userNo", params.get("userNo"));
        */

        mav.setViewName("PJ500Views/PJ507M");

        return mav;
    }
}
