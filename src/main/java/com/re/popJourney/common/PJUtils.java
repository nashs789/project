package com.re.popJourney.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PJUtils {

    public static final ObjectMapper mapper = new ObjectMapper();

    /**
     * Method: getModelToJson
     * @param nameList: 모델의 객체에 해당하는 key 값(HashMap key value)
     * @param paramList: 데이터 객체들
     * @return String
     * @throws JsonProcessingException
     */
    public static String getModelToJson(String[] nameList, List<HashMap<String, Object>>...paramList) throws JsonProcessingException {
        Map<String, Object> modelMap = new HashMap();

        for(int idx = 0; idx < nameList.length; idx++){
            modelMap.put(nameList[idx], paramList[idx]);
        }

        return mapper.writeValueAsString(modelMap);
    }

    /**
     * Method: getModelToJson
     * @param name: 모델의 객체에 해당하는 key 값(HashMap key value)
     * @param paramList: 데이터 객체
     * @return String
     * @throws JsonProcessingException
     */
    public static String getModelToJson(String name, List<HashMap<String, Object>> paramList) throws JsonProcessingException {
        Map<String, Object> modelMap = new HashMap();
        modelMap.put(name, paramList);

        return mapper.writeValueAsString(modelMap);
    }

    /**
     * Method: getModelAndView
     * @param viewName: 화면명 ('/WEB-INF/views/' 경로 밑에있는 jsp파일명)
     * @param modelName: 모델의 객체에 해당하는 key 값(HashMap key value)
     * @param modelObject: 데이터 객체
     * @return ModelAndView
     */
    public static ModelAndView getModelAndView(String viewName, String modelName, Object modelObject){
        return new ModelAndView(viewName, modelName, modelObject);
    }

    /**
     * Method: getModelAndView
     * @param viewName: 화면명 ('/WEB-INF/views/' 경로 밑에있는 jsp파일명)
     * @return
     */
    public static ModelAndView getModelAndView(String viewName){
        return new ModelAndView(viewName);
    }
}
