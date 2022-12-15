package com.re.popJourney.controller;

import com.re.popJourney.common.PJUtils;
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
    @PostMapping(value="/selectPJ100NoticeList", produces="text/json;charset=UTF-8")
    public String selectPJ100NoticeList() throws Throwable {
        return PJUtils.getModelToJson("noticeList", pj100Service.selectPJ100NoticeList());
    }

    // 메인화면 - 지역별 랭킹
    // regionBoards
    @PostMapping(value="/selectPJ100regionBoardList", produces="text/json;charset=UTF-8")
    public String selectPJ100regionBoardList(@RequestBody HashMap<String, String> params) throws Throwable {
        Map<String, Object> paramMap = new HashMap();

        paramMap.put("region_no", params.get("region_no"));
        List<HashMap<String, Object>> YearRankList = pj100Service.selectPJ100RegionYearRank(paramMap);
        paramMap.put("month", "Y");
        List<HashMap<String, Object>> MonthRankList = pj100Service.selectPJ100RegionYearRank(paramMap);
        paramMap.put("week", "Y");
        List<HashMap<String, Object>> WeekRankList = pj100Service.selectPJ100RegionYearRank(paramMap);

        String[] nameList = {"YearRankList", "MonthRankList", "WeekRankList"};

        return PJUtils.getModelToJson(nameList, YearRankList, MonthRankList, WeekRankList);
    }
}
