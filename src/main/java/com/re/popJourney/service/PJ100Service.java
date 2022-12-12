package com.re.popJourney.service;

import com.re.popJourney.dao.IPJ100Dao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class PJ100Service {

    private final IPJ100Dao ipj100Dao;

    public List<HashMap<String, Object>> selectPJ100Notices() {
        return ipj100Dao.selectPJ100Notices();
    }

    public List<HashMap<String, Object>> selectPJ100RegionYearRank(Map<String, Object> paramMap) {
        return ipj100Dao.selectPJ100RegionYearRank(paramMap);
    }
}
