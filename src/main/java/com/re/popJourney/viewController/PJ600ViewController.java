package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ600ViewController {

    // 통합검색처리
    // PJ600M
    // search
    @RequestMapping(value = "/PJ600M")
    public ModelAndView search(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        // re-fact
        // int journalCnt = iJmPopjourneyService.getJournalCnt(params);
        // int hashCnt = iJmPopjourneyService.getHashCnt(params);
        // int boardCnt = iJmPopjourneyService.getBoardCnt(params);
        // int nicCnt = iJmPopjourneyService.getNicCnt(params);
        // List<HashMap<String, String>> journalList = iJmPopjourneyService.getJournalList(params);
        // List<HashMap<String, String>> hashList = iJmPopjourneyService.getHashList(params);
        // List<HashMap<String, String>> boardList = iJmPopjourneyService.getBoardList(params);
        // List<HashMap<String, String>> nicList = iJmPopjourneyService.getNicList(params);

        // mav.addObject("journalCnt", journalCnt);
        // mav.addObject("hashCnt", hashCnt);
        // mav.addObject("boardCnt", boardCnt);
        // mav.addObject("nicCnt", nicCnt);
        // mav.addObject("journalList", journalList);
        // mav.addObject("hashList", hashList);
        // mav.addObject("boardList", boardList);
        // mav.addObject("nicList", nicList);

        mav.setViewName("PJ600Views/PJ600M");

        return mav;
    }

    // 통합검색 - 여행일지 검색
    // 601
    // searchTravelDiary
    @RequestMapping(value = "/PJ601M")
    public ModelAndView searchTravelDiary(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("PJ601Views/PJ601M");

        return mav;
    }

    // 통합검색 - 해시태그 검색
    // 602
    // searchHashtag
    @RequestMapping(value = "/PJ602M")
    public ModelAndView searchHashtag(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("PJ602Views/PJ602M");

        return mav;
    }

    // 통합검색 - 자유게시판 검색
    // 603
    @RequestMapping(value = "/PJ603M")
    public ModelAndView searchCommunity(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("PJ603Views/PJ603M");

        return mav;
    }

    // 통합검색 - 닉네임 검색
    // 604
    @RequestMapping(value = "/PJ604M")
    public ModelAndView searchNic(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("PJ604Views/PJ604M");

        return mav;
    }
}
