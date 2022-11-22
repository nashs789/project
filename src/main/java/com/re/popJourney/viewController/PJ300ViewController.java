package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ300ViewController {
    // 자유게시판
    // PJ300M
    @RequestMapping(value = "/PJ300M")
    public ModelAndView community(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
        int Pages = 1;
        if (params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }
        mav.addObject("Pages", Pages);
        mav.setViewName("PJ300Views/PJ300M");

        return mav;
    }

    // PJ301M
    // 게시글 상세페이지
    @RequestMapping(value = "/PJ301M")
    public ModelAndView post(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int pages = 1;

        if(params.get("pages") != null) {
            pages = Integer.parseInt(params.get("pages"));
        }

        /*
        try {
            int hit = iEsPopjourneyService.postHit(params);
            HashMap<String, String> data = iEsPopjourneyService.getPost(params);
            HashMap<String, String> likeCheck = iEsPopjourneyService.likeCheck(params);

            mav.addObject("data", data);
            mav.addObject("likeCheck", likeCheck);
            mav.addObject("pages", pages);


        } catch (Throwable e) {
            e.printStackTrace();
        }
         */

        mav.setViewName("PJ300Views/PJ301M");
        return mav;
    }

    // 게시글 작성 페이지
    // PJ302M
    @RequestMapping(value = "/PJ302M")
    public ModelAndView postWrite(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        mav.setViewName("PJ300Views/PJ302M");

        return mav;

    }

    // ㄱㅔ시글 업데이트
    // 303
    @RequestMapping(value = "/PJ303M")
    public ModelAndView postUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        // HashMap<String, String> data = iEsPopjourneyService.editPost(params);
        // mav.addObject("data",data);

        mav.setViewName("PJ300Views/PJ303M");

        return mav;

    }
}
