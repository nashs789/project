package com.re.popJourney.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PJUtils {

    public static final ObjectMapper mapper = new ObjectMapper();

    public static String getModelToJson(String[] nameList, List<HashMap<String, Object>>...paramList) throws JsonProcessingException {
        Map<String, Object> modelMap = new HashMap();

        for(int idx = 0; idx < nameList.length; idx++){
            modelMap.put(nameList[idx], paramList[idx]);
        }

        return mapper.writeValueAsString(modelMap);
    }

    public static String getModelToJson(String noticeList, List<HashMap<String, Object>> paramList) throws JsonProcessingException {
        Map<String, Object> modelMap = new HashMap();
        modelMap.put(noticeList, paramList);

        return mapper.writeValueAsString(modelMap);
    }
}
