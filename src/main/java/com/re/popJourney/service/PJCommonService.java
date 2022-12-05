package com.re.popJourney.service;

import com.re.popJourney.dao.IPJCommonDao;
import com.re.popJourney.model.MemVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class PJCommonService {
    private IPJCommonDao commonDao;

    public MemVo login(MemVo memVo) {
        return commonDao.login(memVo);
    }
}
