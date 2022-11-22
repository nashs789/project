package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@Slf4j
public class CommonViewController {

    //로그인 안했을 경우 - 이인복
    @RequestMapping(value = "/loginPlz")
    public ModelAndView loginPlz(ModelAndView mav) {
        mav.setViewName("LIB/loginPlz");

        return mav;
    }
}
