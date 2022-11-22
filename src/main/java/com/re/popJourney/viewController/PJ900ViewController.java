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
    @RequestMapping(value = "/clientCenterQuestion")
    public ModelAndView clientCenterQuestion(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        mav.setViewName("CJM/clientCenterQuestion");

        return mav;
    }

    // 고객센터-문의사항
    // PJ901M
    @RequestMapping(value = "/clientCenterMatter")
    public ModelAndView clientCenterMatter(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("CJM/clientCenterMatter");

        return mav;

    }

    // 고객센터-문의사항(작성)
    // PJ902M
    @RequestMapping(value = "/clientCenterMatterWrite")
    public ModelAndView testABWrite(ModelAndView mav) {

        mav.setViewName("CJM/clientCenterMatterWrite");

        return mav;
    }

    // 고객센터(문의사항) - 세부
    // PJ903M
    @RequestMapping(value = "/clientCenterMatterDetail")
    public ModelAndView clientCenterMatterDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        // re-fact
        // HashMap<String, String> data = iJmPopjourneyService.getMatter(params);
        // HashMap<String, String> cmtDate = iJmPopjourneyService.getCmtDate(params);

        //mav.addObject("data", data);
        //mav.addObject("cmtDate", cmtDate);

        mav.setViewName("CJM/clientCenterMatterDetail");

        return mav;
    }

    // 고객센터(문의사항) 회원작성글 수정
    // PJ904M
    @RequestMapping(value = "/clientCenterMatterUpdate")
    public ModelAndView clientCenterMatterUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        // re-fact
        // HashMap<String, String> data = iJmPopjourneyService.getMatter(params);

        // mav.addObject("data", data);

        mav.setViewName("CJM/clientCenterMatterUpdate");

        return mav;
    }
}
