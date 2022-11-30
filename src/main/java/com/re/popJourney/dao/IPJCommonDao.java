package com.re.popJourney.dao;

import com.re.popJourney.model.MemVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface IPJCommonDao {

    MemVo login(MemVo memVo);
}
