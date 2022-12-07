package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.re.popJourney.service.PJ100Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
public class PJ100Controller {

    private final PJ100Service pj100Service;

    // 메인화면 - 공지사항
    // notices
    @PostMapping(value = "/selectPJ100Notices", produces = "text/json;charset=UTF-8")
    public String selectPJ100Notices() throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

        List<HashMap<String, String>> outListData = pj100Service.selectPJ100Notices();

        return mapper.writeValueAsString(outListData);
    }

    // 메인화면 - 지역별 랭킹
    // regionBoards
    @PostMapping(value = "/selectPJ100regionBoards", produces = "text/json;charset=UTF-8")
    public String selectPJ100regionBoards(@RequestBody HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        Map<String, Object> modelMap = new HashMap<String, Object>();

        paramMap.put("region_no", params.get("region_no"));
        List<HashMap<String, String>> YearRankList = pj100Service.selectPJ100RegionYearRank(paramMap);
        paramMap.put("month", "Y");
        List<HashMap<String, String>> MonthRankList = pj100Service.selectPJ100RegionYearRank(paramMap);
        paramMap.put("week", "Y");
        List<HashMap<String, String>> WeekRankList = pj100Service.selectPJ100RegionYearRank(paramMap);

        modelMap.put("YearRankList", YearRankList);
        modelMap.put("MonthRankList", MonthRankList);
        modelMap.put("WeekRankList", WeekRankList);

        return mapper.writeValueAsString(modelMap);
    }
}
