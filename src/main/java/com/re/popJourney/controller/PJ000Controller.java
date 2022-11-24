package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@Slf4j
public class PJ000Controller {

    // 000
    // memAdmins
    @RequestMapping(value="/memAdmins", method = RequestMethod.POST, produces =	"text/json;charset=UTF-8")
    @ResponseBody
    public String memAdmins(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int page = Integer.parseInt(params.get("page"));

        int cnt = iJmPopjourneyService.getMemCnt(params);

        PagingBean pb = iPagingService.getPagingBean(page, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getMemList(params);

        //현재날짜 취득
        String dateForm = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(dateForm);
        String today = sdf.format(new Date());
        String startDay = "2021-01-01";

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("today", today);
        modelMap.put("startDay", startDay);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 000
    // memAdminDeletes
    @RequestMapping(value = "/memAdminDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String memAdminDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            String userNos = (params.get("userNos"));
            String[] arrayUserNos = userNos.split(",");

            for(int i = 0 ; i < arrayUserNos.length ; i++) {
                System.out.println("arrayUserNos[i] >> " + arrayUserNos[i]);
                params.put("userNos", arrayUserNos[i]);

                // 탈퇴일
                int cnt = iJmPopjourneyService.deleteMem(params);

                if(cnt > 0) {
                    modelMap.put("msg", "success");
                } else {
                    modelMap.put("msg", "failed");
                }
            }
        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
 */
        return mapper.writeValueAsString(modelMap);
    }

    // 000
    // memGrades
    @RequestMapping(value="/memGrades", method = RequestMethod.POST, produces =	"text/json;charset=UTF-8")
    @ResponseBody public String memGrade(@RequestParam HashMap<String, String>	params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getGradeUpgrade(params);
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

    // 000
    // memDownGrades
    @RequestMapping(value="/memDownGrades", method = RequestMethod.POST, produces =	"text/json;charset=UTF-8")
    @ResponseBody public String memDownGrades(@RequestParam HashMap<String, String>	params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getDownGrade(params);
            if (cnt > 0) {
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

    // 001
    // communityAdminsDeletes
    @RequestMapping(value = "/communityAdminsDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String communityAdminsDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            String postNo = (params.get("postNo"));
            String[] arrayPostNo = postNo.split(",");
            for(int i = 0 ; i < arrayPostNo.length ; i++) {
                params.put("postNo", arrayPostNo[i]);

                // 게시글 DEL 1 -> 0
                int cnt = iJmPopjourneyService.deletePost(params);
                // 게시글댓글 DEL 1 -> 0
                int cnt2 = iJmPopjourneyService.deletePostCmt(params);

                if(cnt > 0 || cnt2 > 0) {
                    modelMap.put("msg", "success");
                } else {
                    modelMap.put("msg", "failed");
                }
            }

        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 001
    // communityAdmins
    @RequestMapping(value="/communityAdmins", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody public String communityAdmins(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int page = Integer.parseInt(params.get("page"));

        int cnt = iJmPopjourneyService.getCommunityCnt(params);

        PagingBean pb = iPagingService.getPagingBean(page, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.communityList(params);

        //현재날짜 취득
        String dateForm = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(dateForm);
        String today = sdf.format(new Date());
        String startDay = "2021-01-01";

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("today", today);
        modelMap.put("startDay", startDay);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 002
    // TravelDiaryAdminsDeletes
    @RequestMapping(value = "/TravelDiaryAdminsDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String TravelDiaryAdminsDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            String journalNo = (params.get("journalNo"));
            String[] arrayJournalNo = journalNo.split(",");
            for(int i = 0 ; i < arrayJournalNo.length ; i++) {
                System.out.println("arrayJournalNo[i] >> " + arrayJournalNo[i]);
                params.put("journalNo", arrayJournalNo[i]);

                // 게시글 DEL 1 -> 0
                int cnt = iJmPopjourneyService.deleteJournal(params);
                // 게시글댓글 DEL 1 -> 0
                int cnt2 = iJmPopjourneyService.deleteJournalCmt(params);

                if(cnt > 0 || cnt2 > 0) {
                    modelMap.put("msg", "success");
                } else {
                    modelMap.put("msg", "failed");
                }
            }

        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 002
    // TravelDiaryAdmins
    @RequestMapping(value="/TravelDiaryAdmins", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody public String TravelDiaryAdmins(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int page = Integer.parseInt(params.get("page"));

        int cnt = iJmPopjourneyService.getTravelDiaryCnt(params);

        PagingBean pb = iPagingService.getPagingBean(page, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.travelDiaryList(params);

        //현재날짜 취득
        String dateForm = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(dateForm);
        String today = sdf.format(new Date());
        String startDay = "2021-01-01";

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("today", today);
        modelMap.put("startDay", startDay);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 003
    // noticeAdminsDeletes
    @RequestMapping(value = "/noticeAdminsDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String noticeAdminsDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            String postNo = (params.get("postNo"));
            String[] arrayPostNo = postNo.split(",");
            for(int i = 0 ; i < arrayPostNo.length ; i++) {
                System.out.println("arrayJournalNo[i] >> " + arrayPostNo[i]);
                params.put("postNo", arrayPostNo[i]);

                // 공지 DEL 1 -> 0
                int cnt = iJmPopjourneyService.deletePost(params);
                // 공지 댓글 DEL 1 -> 0
                int cnt2 = iJmPopjourneyService.deletePostCmt(params);

                if(cnt > 0 || cnt2 > 0) {
                    modelMap.put("msg", "success");
                } else {
                    modelMap.put("msg", "failed");
                }
            }

        } catch (Throwable e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 003
    // noticeAdmins
    @RequestMapping(value="/noticeAdmins", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody public String noticeAdmins(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int page = Integer.parseInt(params.get("page"));

        int cnt = iJmPopjourneyService.getNoticeCnt(params);

        PagingBean pb = iPagingService.getPagingBean(page, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.noticeList(params);

        //현재날짜 취득
        String dateForm = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(dateForm);
        String today = sdf.format(new Date());
        String startDay = "2021-01-01";

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("today", today);
        modelMap.put("startDay", startDay);
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 004
    // reportApprovals
    @RequestMapping(value="/reportApprovals", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String reportApprovals(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getReportApprovals(params);

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

    // 004
    // unReportApprovals
    @RequestMapping(value="/unReportApprovals", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String unReportApprovals(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iJmPopjourneyService.getUnReportApprovals(params);

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

    // 004
    // reportAdmins
    @RequestMapping(value="/reportAdmins", method = RequestMethod.POST, produces =	"text/json;charset=UTF-8")
    @ResponseBody public String reportAdmins(@RequestParam HashMap<String, String>	params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int page = Integer.parseInt(params.get("page"));

        int cnt = iJmPopjourneyService.getReportCnt(params);

        PagingBean pb = iPagingService.getPagingBean(page, cnt, 20, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        List<HashMap<String, String>> list = iJmPopjourneyService.getReportList(params);

        //현재날짜 취득
        String dateForm = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(dateForm);
        String today = sdf.format(new Date());
        String startDay = "2021-01-01";

        modelMap.put("list", list);
        modelMap.put("pb", pb);
        modelMap.put("today", today);
        modelMap.put("startDay", startDay);
*/
        return mapper.writeValueAsString(modelMap);

    }
}
