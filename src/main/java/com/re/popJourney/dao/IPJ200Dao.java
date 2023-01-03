package com.re.popJourney.dao;

import com.re.popJourney.model.MemVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
public interface IPJ200Dao {
    Map<String, Object> selectPJ200DupInfoCheck(MemVo memVo);

    int insertPJ202Mem(MemVo memVo);

    MemVo selectPJ203GetUserInfo(MemVo memVo);
}
