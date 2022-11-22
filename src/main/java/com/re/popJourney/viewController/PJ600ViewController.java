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
    @RequestMapping(value = "/search")
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

        mav.setViewName("CJM/search");

        return mav;
    }

    // 통합검색 - 여행일지 검색
    @RequestMapping(value = "/searchTravelDiary")
    public ModelAndView searchTravelDiary(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("CJM/searchTravelDiary");

        return mav;
    }

    // 통합검색 - 해시태그 검색
    @RequestMapping(value = "/searchHashtag")
    public ModelAndView searchHashtag(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("CJM/searchHashtag");

        return mav;
    }

    // 통합검색 - 자유게시판 검색
    @RequestMapping(value = "/searchCommunity")
    public ModelAndView searchCommunity(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("CJM/searchCommunity");

        return mav;
    }

    // 통합검색 - 닉네임 검색
    @RequestMapping(value = "/searchNic")
    public ModelAndView searchNic(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

        int Pages = 1;

        if(params.get("Pages") != null) {
            Pages = Integer.parseInt(params.get("Pages"));
        }

        mav.addObject("Pages", Pages);

        mav.setViewName("CJM/searchNic");

        return mav;
    }
}
