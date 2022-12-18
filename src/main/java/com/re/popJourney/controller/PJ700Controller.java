package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class PJ700Controller {

    // 타임라인 페이지 게시글 카운트 - 이인복
    // 700
    // timelinePageCnts
    @RequestMapping(value = "/timelinePageCnts", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String timelinePageCnts(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            HashMap<String, String> pageCnt = ipjs.timelinePageCnt(params);

            if(pageCnt != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("pageCnt", String.valueOf(pageCnt.get("CNT")));
            }
            else
            {
                modelMap.put("msg", "failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 타임라인 가져오기 - 이인복
    // 700
    // timelines
    @RequestMapping(value = "/timelines", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String timelines(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        List<HashMap<String, String>> timeline = ipjs.timeline(params);

        try {
            if(timeline != null)
            {
                int firstPage = Integer.parseInt(params.get("firstPage"))+10;
                int lastPage = Integer.parseInt(params.get("lastPage"))+10;

                if(Integer.parseInt(params.get("pageCnt")) <= lastPage)
                {
                    modelMap.put("msg", "full");
                    return mapper.writeValueAsString(modelMap);
                }

                modelMap.put("timeline", timeline);
                modelMap.put("msg", "success");
                modelMap.put("firstPage", firstPage);
                modelMap.put("lastPage", lastPage);
            }
            else
            {
                modelMap.put("msg", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 타임라인 페이지 게시글 카운트 - 이인복
    // 700
    // miniProfiles
    @RequestMapping(value = "/miniProfiles", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String miniProfiles(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            HashMap<String, String> mini = ipjs.miniProfile(params);

            if(mini != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("mini", mini);
            }
            else if(mini == null)
            {
                modelMap.put("msg", "nothing");
            }

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
 */
        return mapper.writeValueAsString(modelMap);
    }

    // 알림페이지 게시글 카운트 - 이인복
    // 701
    // pageCnts
    @RequestMapping(value = "/pageCnts", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String pageCnts(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            HashMap<String, String> pageCnt = ipjs.pageCnt(params);

            if(pageCnt != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("pageCnt", String.valueOf(pageCnt.get("CNT")));
            }
            else
            {
                modelMap.put("msg", "failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
        */
        return mapper.writeValueAsString(modelMap);
    }
}
