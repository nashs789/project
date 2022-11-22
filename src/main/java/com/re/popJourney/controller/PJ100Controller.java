package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class PJ100Controller {

    // 메인화면 - 공지사항
    @PostMapping(value = "/selectPJ100Notices", produces = "text/json;charset=UTF-8")
    public String notices() throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

        // List<HashMap<String, String>> noticeData = ipjs.notice();

        return mapper.writeValueAsString(modelMap);
    }

    // 메인화면 - 지역별 랭킹
    // regionBoards
    @PostMapping(value = "/selectPJ100regionBoards", produces = "text/json;charset=UTF-8")
    public String regionBoards(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

        try {
            /*
             List<HashMap<String, String>> yearData = ipjs.yearRank(params);
             List<HashMap<String, String>> monthData = ipjs.monthRank(params);
             List<HashMap<String, String>> weekData = ipjs.weekRank(params);

             modelMap.put("yearData", yearData);
             modelMap.put("monthData", monthData);
             modelMap.put("weekData", weekData);
             */

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapper.writeValueAsString(modelMap);
    }
}
