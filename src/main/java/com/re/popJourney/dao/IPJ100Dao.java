package com.re.popJourney.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface IPJ100Dao {
    List<HashMap<String, String>> selectPJ100Notices();

    List<HashMap<String, String>> selectPJ100RegionYearRank(Map<String, Object> paramMap);
}
