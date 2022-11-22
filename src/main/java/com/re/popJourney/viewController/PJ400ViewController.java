package com.re.popJourney.viewController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
@Slf4j
public class PJ400ViewController {

    // 여행일지 목록
    // PJ400M
    // journalBoard
    @RequestMapping(value = "/journalBoard")
    public ModelAndView journalBoard(ModelAndView mav) {

        mav.setViewName("LES/journalBoard");

        return mav;
    }

    // 여행일지 세부페이지
    // PJ401M
    // journal
    @RequestMapping(value = "/journal")
    public ModelAndView journal(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
        // re-fact
        // 여행일지 세부페이지의 메인데이터
        // HashMap<String, String> data = iJmPopjourneyService.getJournal(params);
        // 여행일지 세부페이지의 메모데이터
        // List<HashMap<String, String>> memoData = iJmPopjourneyService.getMemoData(params);
        // 여행일지 세부페이지의 시퀀스 갯수
        // int cnt = iJmPopjourneyService.getSequenceCnt(params);  // 이거 왜 안되지..
        // 여행일지 세부페이지의 해시태그
        // List<HashMap<String, String>> hash = iJmPopjourneyService.getHash(params);
        // 좋아요
        // HashMap<String, String> likeCheck = iJmPopjourneyService.likeCheck(params);
        // 조회수
        // int hit = iJmPopjourneyService.journalHit(params);
        // 북마크 폴더 갯수 체크
        // int bmkFolderCnt = iJmPopjourneyService.getBmkFolderCnt(params);

        // int pages = 1;

        /*
        if(params.get("pages") != null) {
            pages = Integer.parseInt(params.get("pages"));
        }

        mav.addObject("data", data);
        mav.addObject("memoData", memoData);
        mav.addObject("cnt", cnt);
        mav.addObject("hash", hash);
        mav.addObject("pages", pages);
        mav.addObject("likeCheck", likeCheck);
        mav.addObject("bmkFolderCnt", bmkFolderCnt);
        mav.addObject("journalWriterMemNo", data.get("MEM_NO"));
        */

        mav.setViewName("CJM/journal");

        return mav;
    }

    // 여행일지 작성페이지
    // PJ402M
    // journalWrite
    @RequestMapping(value = "/journalWrite")
    public ModelAndView journalWrite(@RequestParam HashMap<String, String> params, ModelAndView mav)  {

        mav.addObject("startDate", params.get("startDate"));
        mav.addObject("endDate", params.get("endDate"));
        mav.addObject("regionNo", params.get("regionNo"));
        mav.setViewName("LES/journalWrite");

        return mav;
    }

    // 여행일지 수정
    // PJ403M
    @RequestMapping(value = "/journalUpdate")
    public ModelAndView journalUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) {

        mav.addObject("journalNo", params.get("journalNo"));
        mav.setViewName("LIB/journalUpdate");

        return mav;
    }
}
