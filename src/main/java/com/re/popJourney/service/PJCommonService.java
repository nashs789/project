package com.re.popJourney.service;

import com.re.popJourney.dao.IPJCommonDao;
import com.re.popJourney.model.MemVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PJCommonService {
    private IPJCommonDao commonDao;

    @Autowired
    public PJCommonService(IPJCommonDao commonDao) {
        this.commonDao = commonDao;
    }

    public MemVo login(MemVo memVo) {
        log.info("########### service ###########");
        MemVo memVo1 = commonDao.login(memVo);
        log.info("memVo = {}", memVo1);
        return memVo1;
    }
}
