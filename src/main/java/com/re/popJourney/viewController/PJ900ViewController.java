package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ900ViewController {

    // 고객센터-자주 묻는 질문
    // PJ900M
    // clientCenterQuestion
    @RequestMapping(value = "/PJ900M")
    public ModelAndView clientCenterQuestion(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        mav.setViewName("PJ900Views/PJ900M");

        return mav;
    }

    // 고객센터-문의사항
    // PJ901M
    // clientCenterMatter
    @RequestMapping(value = "/PJ901M")
    public ModelAndView clientCenterMatter(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("PJ900Views/PJ901M");

        return mav;

    }

    // 고객센터-문의사항(작성)
    // PJ902M
    // clientCenterMatterWrite
    @RequestMapping(value = "/PJ902M")
    public ModelAndView testABWrite(ModelAndView mav) {

        mav.setViewName("PJ900Views/PJ902M");

        return mav;
    }

    // 고객센터(문의사항) - 세부
    // PJ903M
    // clientCenterMatterDetail
    @RequestMapping(value = "/PJ903M")
    public ModelAndView clientCenterMatterDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        // re-fact
        // HashMap<String, String> data = iJmPopjourneyService.getMatter(params);
        // HashMap<String, String> cmtDate = iJmPopjourneyService.getCmtDate(params);

        //mav.addObject("data", data);
        //mav.addObject("cmtDate", cmtDate);

        mav.setViewName("PJ900Views/PJ903M");

        return mav;
    }

    // 고객센터(문의사항) 회원작성글 수정
    // PJ904M
    // clientCenterMatterUpdate
    @RequestMapping(value = "/PJ904M")
    public ModelAndView clientCenterMatterUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        // re-fact
        // HashMap<String, String> data = iJmPopjourneyService.getMatter(params);

        // mav.addObject("data", data);

        mav.setViewName("PJ900Views/PJ904M");

        return mav;
    }
}
