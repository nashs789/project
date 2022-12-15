package com.re.popJourney.dao;

import com.re.popJourney.model.MemVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
public interface IPJ200Dao {
    Map<String, Object> selectPJ200DupId(MemVo memVo);
}
