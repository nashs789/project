package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ800ViewController {
    // 여행작가랭킹
    // PJ800M
    @RequestMapping(value = "/travelWriterRank")
    public ModelAndView travelWriterRank(@RequestParam HashMap<String, String> params, ModelAndView mav)throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("CJM/travelWriterRank");

        return mav;
    }
}
