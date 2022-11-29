package com.re.popJourney.viewController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.re.popJourney.model.MemVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@RestController
@Slf4j
public class PJ200ViewController {
    // 약관 페이지 - 이인복
    // PJ200M
    // terms
    @GetMapping(value = "/PJ200M")
    public ModelAndView PJ200M() {
        return new ModelAndView("PJ200Views/PJ200M");
    }

    // 회원가입 페이지 - 이인복
    // PJ201M
    // join
    @PostMapping(value = "/PJ201M")
    // MemVo memVo
    // HttpServletRequest req, HttpServletResponse res
    public ModelAndView PJ201M(MemVo memVo) throws IOException, ServletException {
        // ObjectMapper mapper = new ObjectMapper();
        // String jsonStringData = mapper.writeValueAsString(memVo);

        ModelAndView mav = new ModelAndView();
        mav.addObject("memVo", memVo);
        mav.setViewName("PJ200Views/PJ201M");

        //String viewName = mav.getViewName();

        //RequestDispatcher dispatcher = req.getRequestDispatcher(viewName);
        //dispatcher.forward(req, res);

        // String viewPath = "/WEB-INF/views/PJ200Views/PJ201M.jsp";
        // RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);
        // dispatcher.forward(req, res);
        //return mav;
        return mav;
    }

    // 프로필 작성- 이인복
    // PJ202M
    @PostMapping(value = "/PJ202M")
    public ModelAndView writeProfile(MemVo memVo) {
        /*
        String birth = params.get("inputYear") + "-" + params.get("inputMonth") + "-" + params.get("inputDay");
        String phone = "010" + params.get("inputPhone");
        String email = params.get("inputEmail") + "@" + params.get("inputDomain");

        HashMap<String, String> data = params;

        data.put("birth", birth);
        data.put("phone", phone);
        data.put("email", email);

        mav.addObject("data", data);

        mav.setViewName("PJ200Views/PJ202M");
         */
        log.info("memVo = {}", memVo);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("PJ200Views/PJ202M");

        return mav;
    }

    // 회원정보수정 - 이인복
    // PJ203M
    @GetMapping(value = "/PJ203M")
    public ModelAndView editInfo(ModelAndView mav) {
        int page = 1;

        mav.addObject("page", page);
        mav.setViewName("PJ200Views/PJ203M");

        return mav;
    }

    // 프로필 수정 페이지 - 이인복
    // PJ204M
    @GetMapping(value = "/PJ204M")
    public ModelAndView editProfile(ModelAndView mav) {
        int page = 1;

        mav.addObject("page", page);
        mav.setViewName("PJ200Views/PJ204M");

        return mav;
    }

    // 아이디 찾기 페이지- 이인복
    // PJ205M
    @GetMapping(value = "/PJ205M")
    public ModelAndView findID(ModelAndView mav) {
        mav.setViewName("PJ200Views/PJ205M");

        return mav;
    }

    // 비밀번호 찾기 페이지- 이인복
    // PJ206M
    @GetMapping(value = "/PJ206M")
    public ModelAndView findPW(ModelAndView mav) {
        mav.setViewName("PJ200Views/PJ206M");

        return mav;
    }
}
