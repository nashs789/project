package com.re.popJourney.service;

import com.re.popJourney.dao.IPJ200Dao;
import com.re.popJourney.model.MemVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class PJ200Service {

    private final IPJ200Dao ipj200Dao;

    public Map<String, Object> selectPJ200DupInfoCheck(MemVo memVo) {
        Map<String, Object> noDupInfo = ipj200Dao.selectPJ200DupInfoCheck(memVo);

        if(noDupInfo != null){
            // DuplicationException
             log.info("##### 중복된 고객정보 입니다. #####");
        }

        return noDupInfo;
    }

    public int insertPJ202Mem(MemVo memVo) {
        int cnt = ipj200Dao.insertPJ202Mem(memVo);

        if(cnt == 0){
            // failException
        }

        return cnt;
    }
}
