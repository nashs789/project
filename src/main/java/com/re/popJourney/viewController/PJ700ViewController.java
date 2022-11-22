package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@Slf4j
public class PJ700ViewController {

    // 타임라인 페이지 - 이인복
    // PJ700M
    @RequestMapping(value = "/timeline")
    public ModelAndView timeline(ModelAndView mav) {
        int page = 1;

        mav.addObject("page", page);
        mav.setViewName("LIB/timeline");

        return mav;
    }

    // 알람 모아보기 - 이인복
    // PJ701M
    @RequestMapping(value = "/notification")
    public ModelAndView notification(ModelAndView mav) {

        int page = 0;
        int firstPage = 1;

        mav.addObject("firstPage", firstPage);
        mav.addObject("page", page);
        mav.setViewName("LIB/notification");

        return mav;
    }
}
