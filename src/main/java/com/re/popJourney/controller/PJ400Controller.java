package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class PJ400Controller {

    // 일지 리스트 그리기
    // 400
    @RequestMapping(value = "/journalListCnts", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalListCnts(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cntList = ipjs.journalListCnt(params);
            int page = Integer.parseInt(params.get("page2"));
            PagingBean pb = ips.getPagingBean(page, cntList, 15, 5);


            params.put("startCnt", Integer.toString(pb.getStartCount()));
            params.put("endCnt", Integer.toString(pb.getEndCount()));
            params.put("maxCnt", Integer.toString(pb.getMaxPcount()));

            if(cntList > 0)
            {
                modelMap.put("msg", "success");
                modelMap.put("pb", pb);
                modelMap.put("cnt", cntList);
            }
            else if(cntList == 0)
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

    //일지 리스트 그리기
    // 400
    @RequestMapping(value = "/journalLists", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalLists(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            List<HashMap<String, String>> journalList = ipjs.journalList(params);

            if(journalList != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("list", journalList);
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

    // 401
    // journalCmtCmtAdds
    @RequestMapping(value="/journalCmtCmtAdds", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalCmtCmtAdds(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getCmtCmtAdds(params);
            int cnt2 = iJmPopjourneyService.getCmtCmtNotf(params);
            int cnt3 = iJmPopjourneyService.getCmtCmtNotf2(params);

            if(cnt > 0 || cnt2 > 0 || cnt3 > 0) {
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

    // 401
    // journalCmtDeletes
    @RequestMapping(value="/journalCmtDeletes", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalCmtDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getCmtDeletes(params);
            int cnt2 = iJmPopjourneyService.getCmtCmtDeletes(params);

            if(cnt > 0 || cnt2 > 0) {
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

    // 401
    // journalCmtCmtDeletes
    @RequestMapping(value="/journalCmtCmtDeletes", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalCmtCmtDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getCmtDeletes(params);

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

    // 401
    // journalDeletes
    @RequestMapping(value="/journalDeletes", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getJournalDeletes(params);
            int cnt2 = iJmPopjourneyService.getJournalBmkDeletes(params);

            if(cnt > 0 || cnt2 > 0) {
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

    // 401
    // journalLikes
    @RequestMapping(value = "/journalLikes", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalLikes(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.addLike(params);
            int notf = iJmPopjourneyService.likeNotf(params);
            if(cnt > 0 && notf > 0) {
                modelMap.put("msg", "success");
                System.out.println(params);
            } else {
                modelMap.put("msg", "failed");
            }

        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg","error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 401
    // journalLikeCancles
    @RequestMapping(value = "/journalLikeCancles", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalLikeCancles(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int delcnt = iJmPopjourneyService.delLike(params);

            if(delcnt > 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg","error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 401
    // journalBmkDeletes
    @RequestMapping(value = "/journalBmkDeletes", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalBmkDeletes(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int deleteBmk = iJmPopjourneyService.deleteBmk(params);

            if(deleteBmk > 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg","error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 401
    // journalCmtAdds
    @RequestMapping(value="/journalCmtAdds", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalCmtAdds(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getCmtAdds(params);
            int cnt2 = iJmPopjourneyService.getCmtNotf(params);

            if(cnt > 0 || cnt2 > 0) {
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

    // 401
    // journalCmtEdits
    @RequestMapping(value="/journalCmtEdits", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalCmtEdits(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getCmtEdits(params);

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

    // 401
    // journalGetBmkNos
    @RequestMapping(value="/journalGetBmkNos", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalGetBmkNos(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            HashMap<String, String> getBmkNo = iJmPopjourneyService.getBmkno(params);
            if(getBmkNo != null) {
                modelMap.put("msg", "nullx");
                modelMap.put("getBmkNo", getBmkNo);

                System.out.println("getBmkNo >> " + getBmkNo);
            } else {
                modelMap.put("msg", "nullo");
                modelMap.put("getBmkNo", getBmkNo);

                System.out.println("getBmkNo >> " + getBmkNo);
            }
        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 401
    // journalCmts
    @RequestMapping(value="/journalCmts", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalCmts(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int pages = Integer.parseInt(params.get("pages"));

        int cmtCnt = iJmPopjourneyService.getCmtCnt(params);

        PagingBean pb = iPagingService.getPagingBean(pages, cmtCnt, 10, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        // 여행일지 세부페이지의 댓글
        List<HashMap<String, String>> cmt = iJmPopjourneyService.getJournalCmt(params);

        modelMap.put("pb", pb);
        modelMap.put("cmt", cmt);
*/

        return mapper.writeValueAsString(modelMap);

    }

    // 401
    // journalgetSequences
    @RequestMapping(value="/journalgetSequences", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalgetSequences(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        List<HashMap<String, String>> sequence = iJmPopjourneyService.getSequence(params);

        modelMap.put("sequence", sequence);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 401
    // journalBmkLists
    @RequestMapping(value="/journalBmkLists", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalBmkLists(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        List<HashMap<String, String>> bmkList = iJmPopjourneyService.getBmkList(params);

        modelMap.put("bmkList", bmkList);
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 401
    // journalBmkAdds
    @RequestMapping(value = "/journalBmkAdds", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String journalBmkAdds(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int addBmk = iJmPopjourneyService.addBmk(params);

            if(addBmk > 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg","error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //신고 401
    // reports
    @RequestMapping(value = "/reports", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String reports(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = ipjs.report(params);

            if(cnt > 0)
            {
                modelMap.put("msg", "success");
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

    //여행일지 작성
    // 402
    // addJournals
    @RequestMapping(value = "/addJournals", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addJournals(@RequestParam HashMap<String, String> params,
                              @RequestParam List<String> contents,
                              @RequestParam List<String> memo,
                              @RequestParam List<String> photo) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        String arr[] = params.get("inputHashtag").split("#");

        try {
            ipjs.addJournal(params);

            for(int i = 0; i < contents.size(); i++)
            {
                if(contents.get(i) == "" || memo.get(i) == "" || photo.get(i) == "")
                {
                    break;
                }
                params.put("journalSequence", Integer.toString(i));
                params.put("inputContents", contents.get(i));
                params.put("inputMemo", memo.get(i));
                params.put("inputPhoto", photo.get(i));

                ipjs.addJournalDetail(params);
            }

            for(int i = 1; i < arr.length; i++)
            {
                params.put("inputHashtag", arr[i]);

                ipjs.addHash(params);
                ipjs.addJournalHash(params);
            }


        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //여행일지 수정 상세보기 가져오기
    // 403
    // journalUpdateDetails
    @RequestMapping(value = "journalUpdateDetails",
            method = RequestMethod.POST,
            produces ="test/json;charset=UTF-8")
    @ResponseBody
    public String journalUpdateDetails(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            HashMap<String, String> data = ipjs.getJournalDetail(params);
            modelMap.put("data", data);

            List<HashMap<String, String>> data2 = ipjs.getJournalDetail2(params);
            modelMap.put("data2", data2);

        } catch (Exception e) {
            System.out.println(e);
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //여행일지 수정
    // 403
    // updateJournals
    @RequestMapping(value = "/updateJournals", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateJournals(@RequestParam HashMap<String, String> params,
                                 @RequestParam List<String> contents,
                                 @RequestParam List<String> memo,
                                 @RequestParam List<String> photo) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            ipjs.updateJournal(params);

            for(int i = 0; i < contents.size(); i++)
            {
                if(contents.get(i) == "" || memo.get(i) == "" || photo.get(i) == "")
                {
                    break;
                }
                params.put("journalSequence", Integer.toString(i));
                params.put("inputContents", contents.get(i));
                params.put("inputMemo", memo.get(i));
                params.put("inputPhoto", photo.get(i));

                ipjs.updateJournalDetail(params);
            }

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }
}
