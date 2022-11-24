package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class PJ900Controller {

    // 900
    // clientCenterFAQCnt
    @RequestMapping(value = "/clientCenterFAQCnt", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterFAQCnt(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int FAQCnt = iJmPopjourneyService.FAQCnt(params);

            if(FAQCnt > 0) {

                int firstCnt = 1;
                int lastCnt = 10;
                int addCnt = 10;
                modelMap.put("firstCnt", firstCnt);
                modelMap.put("lastCnt", lastCnt);
                modelMap.put("addCnt", addCnt);
                modelMap.put("msg", "success");
                modelMap.put("FAQCnt", FAQCnt);

                System.out.println("FAQCnt >> " + FAQCnt);
                System.out.println("firstCnt >> " + firstCnt);
                System.out.println("lastCnt >> " + lastCnt);
                System.out.println("addCnt >> " + addCnt);
            } else {
                modelMap.put("msg", "failed");
            }

        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 900
    // clientCenterFAQList
    @RequestMapping(value = "/clientCenterFAQList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterFAQList(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            List<HashMap<String,String>> list = iJmPopjourneyService.FAQList(params);

            modelMap.put("firstCnt", Integer.parseInt(params.get("firstCnt")) + Integer.parseInt(params.get("addCnt")));
            modelMap.put("lastCnt", Integer.parseInt(params.get("lastCnt")) + Integer.parseInt(params.get("addCnt")));
            modelMap.put("list", list);

        }catch(Throwable e) {
            e.printStackTrace();
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 901
    // clientCenterMatters
    @RequestMapping(value="/clientCenterMatters", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterMatters(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iJmPopjourneyService.getMatterCnt(params);

        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getMatterList(params);

        modelMap.put("list", list);
        modelMap.put("pb", pb);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 고객센터-문의사항(작성)
    // 902
    // clientCenterMatterWrites
    @RequestMapping(value = "/clientCenterMatterWrites", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterMatterWrites(@RequestParam HashMap<String, String> params) throws Throwable {
        System.out.println("wParams >> " + params);
        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.addMatterWrite(params);

            if(cnt > 0) {
                modelMap.put("msg", "success");
                //modelMap.put("writeMemNo", params.get("memNo"));
            } else {
                modelMap.put("msg", "failed");
            }

        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 고객센터(문의사항) - 답변
    // clientCenterMatterDetailCmt
    // 903
    @RequestMapping(value = "/clientCenterMatterDetailCmt", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterMatterDetailCmt(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.writeCmt(params);
            int cnt2 = iJmPopjourneyService.updateMatter(params);
            int cnt3 = iJmPopjourneyService.addMatterNotf(params);

            System.out.println("CMTParams222 >> " + params);

            if(cnt > 0 || cnt2 > 0 || cnt3 > 0) {
                modelMap.put("msg", "success");
                modelMap.put("cmt_contents", params.get("cmt_contents"));
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 903
    // clientCenterMatterDeletes
    @RequestMapping(value = "/clientCenterMatterDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterMatterDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

/*
        try {
            int cnt = iJmPopjourneyService.deleteMatter(params);

            if(cnt > 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }

        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 고객센터(문의사항) - 답변수정
    // 903
    // clientCenterMatterDetailCmtUpdates
    @RequestMapping(value = "/clientCenterMatterDetailCmtUpdates", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterMatterDetailCmtUpdates(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.updateCmt(params);
            int cnt2 = iJmPopjourneyService.addMatterNotf2(params);

            System.out.println("CMTParams >> " + params);

            if(cnt > 0 || cnt2 > 0) {
                modelMap.put("msg", "success");
                modelMap.put("cmt_contents", params.get("cmt_contents"));
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 매니저 답변 삭제
    // 903
    // clientCenterMatterDetailCmtDeletes
    @RequestMapping(value = "/clientCenterMatterDetailCmtDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterMatterDetailCmtDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.deleteCmt(params);

            if(cnt > 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }

        } catch (Throwable e) {
            e.printStackTrace();

            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 904
    // clientCenterMatterUpdates
    @RequestMapping(value = "/clientCenterMatterUpdates", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String clientCenterMatterUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.updateMatters(params);
            if(cnt > 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/

        return mapper.writeValueAsString(modelMap);
    }
}
