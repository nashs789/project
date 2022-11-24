package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class PJ600Controller {

    // 600
    // searchs
    @RequestMapping(value="/searchs", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String searchs(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            if(Integer.parseInt(params.get("mainSearchFilter")) == 0) {
                int journalCnt = iJmPopjourneyService.getJournalCnt(params);
                int hashCnt = iJmPopjourneyService.getHashCnt(params);
                int boardCnt = iJmPopjourneyService.getBoardCnt(params);
                int nicCnt = iJmPopjourneyService.getNicCnt(params);
                List<HashMap<String, String>> journalList = iJmPopjourneyService.getJournalList(params);
                List<HashMap<String, String>> hashList = iJmPopjourneyService.getHashList(params);
                List<HashMap<String, String>> boardList = iJmPopjourneyService.getBoardList(params);
                List<HashMap<String, String>> nicList = iJmPopjourneyService.getNicList(params);
                modelMap.put("msg", "Filter0");

                modelMap.put("journalCnt", journalCnt);
                modelMap.put("hashCnt", hashCnt);
                modelMap.put("boardCnt", boardCnt);
                modelMap.put("nicCnt", nicCnt);

                modelMap.put("journalList", journalList);
                modelMap.put("hashList", hashList);
                modelMap.put("boardList", boardList);
                modelMap.put("nicList", nicList);

                String txt = params.get("mainSearchTxt");
                String filter = params.get("mainSearchFilter");
                modelMap.put("txt", txt);
                modelMap.put("filter", filter);
                System.out.println("tttttxt >> " + txt);
                System.out.println("ttttfilter >> " + filter);
            } else if(Integer.parseInt(params.get("mainSearchFilter")) == 1) {
                List<HashMap<String, String>> journalList = iJmPopjourneyService.getJournalList(params);
                modelMap.put("msg", "Filter1");
                modelMap.put("journalList", journalList);
            } else if(Integer.parseInt(params.get("mainSearchFilter")) == 2) {
                List<HashMap<String, String>> hashList = iJmPopjourneyService.getHashList(params);
                modelMap.put("msg", "Filter2");
                modelMap.put("hashList", hashList);
            } else if(Integer.parseInt(params.get("mainSearchFilter")) == 3) {
                List<HashMap<String, String>> boardList = iJmPopjourneyService.getBoardList(params);
                modelMap.put("msg", "Filter3");
                modelMap.put("boardList", boardList);
            } else if(Integer.parseInt(params.get("mainSearchFilter")) == 4) {
                List<HashMap<String, String>> nicList = iJmPopjourneyService.getNicList(params);
                modelMap.put("msg", "Filter4");
                modelMap.put("nicList", nicList);
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 601
    // searchTravelDiarys
    @RequestMapping(value="/searchTravelDiarys", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody public String searchTravelDiarys(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iJmPopjourneyService.getJournalCnt(params);

        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 15, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getJournalDetailList(params);

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("journalCnt", cnt);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 602
    // searchHashtags
    @RequestMapping(value="/searchHashtags", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody public String searchHashtags(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iJmPopjourneyService.getHashCnt(params);

        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 15, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getHashDetailList(params);

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("hashCnt", cnt);

        String txt = params.get("mainSearchTxt");
        String filter = params.get("mainSearchFilter");
        modelMap.put("txt", txt);
        modelMap.put("filter", filter);

*/
        return mapper.writeValueAsString(modelMap);

    }

    // 603
    // searchCommunitys
    @RequestMapping(value="/searchCommunitys", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody public String searchCommunitys(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iJmPopjourneyService.getBoardCnt(params);

        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getBoardDetailList(params);

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("boardCnt", cnt);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 604
    // searchNics
    @RequestMapping(value="/searchNics", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody public String searchNics(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iJmPopjourneyService.getNicCnt(params);

        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getNicDetailList(params);

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("nicCnt", cnt);
*/
        return mapper.writeValueAsString(modelMap);
    }


}
