package com.re.popJourney.dao;

import com.re.popJourney.model.MemVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IPJCommonDao {

    MemVo login(MemVo memVo);
}
