/**
 *
 * Author: Lee In Bok
 * Date: 2022-11-19
 * Description: 메인 페이지
 *
 * ==================================================
 * Date            Description              Editor
 *
 */
package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@Slf4j
public class PJ100ViewController {
    // 메인페이지
    @GetMapping(value = "/PJ100M")
    public ModelAndView main(ModelAndView mav) {
        int page = 1;

        mav.addObject("page", page);
        mav.setViewName("PJ100Views/PJ100M");

        return mav;
    }
}
