package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class PJ800Controller {

    @RequestMapping(value="/travelWriterRanks", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String travelWriterRanks(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iJmPopjourneyService.getRankCnt(params);

        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.journalCmtCmtAddsgetStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getRankList(params);

        modelMap.put("list", list);
        modelMap.put("pb", pb);
*/
        return mapper.writeValueAsString(modelMap);

    }
}
