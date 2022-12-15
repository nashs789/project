package com.re.popJourney.service;

import com.re.popJourney.dao.IPJ200Dao;
import com.re.popJourney.model.MemVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class PJ200Service {

    private final IPJ200Dao ipj200Dao;

    public Map<String, Object> selectPJ200DupId(MemVo memVo) {
        Map<String, Object> dupId = ipj200Dao.selectPJ200DupId(memVo);

        if(dupId != null){
            // DuplicationException
             log.info("##### 중복된 아이디 입니다. #####");
        }

        return dupId;
    }
}
