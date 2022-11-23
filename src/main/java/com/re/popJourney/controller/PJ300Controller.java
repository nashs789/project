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
public class PJ300Controller {

    //자유게시판- (기본)전체보기
    // 300
    // communityLists
    @RequestMapping(value = "/communityLists", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String communityLists(@RequestParam HashMap<String, String>params) throws Throwable{
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iEsPopjourneyService.getPostCnt(params);
        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 20, 5);
        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        try {
            List<HashMap<String,String>> list = iEsPopjourneyService.getPostList(params);

            if(list != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("list",list);
                modelMap.put("pb", pb);
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

    //자유게시판- 공지사항
    // 300
    // communityNLists
    @RequestMapping(value = "/communityNLists", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String communityNLists(@RequestParam HashMap<String, String>params) throws Throwable{
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iEsPopjourneyService.getPostNCnt(params);
        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 20, 5);
        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));
        try {
            List<HashMap<String,String>> list = iEsPopjourneyService.getPostNList(params);
            System.out.println(list);

            if(list != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("list",list);
                modelMap.put("pb", pb);
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

    // 300
    // communityCMTLists
    @RequestMapping(value = "/communityCMTLists", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String communityCMTLists(@RequestParam HashMap<String, String>params) throws Throwable{
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int Pages = Integer.parseInt(params.get("Pages"));

        int cnt = iEsPopjourneyService.getPostCMTCnt(params);
        PagingBean pb = iPagingService.getPagingBean(Pages, cnt, 20, 5);
        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));
        try {
            List<HashMap<String,String>> list = iEsPopjourneyService.getPostCMTList(params);
            System.out.println(list);

            if(list != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("list",list);
                modelMap.put("pb", pb);
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

    // 300
    @RequestMapping(value = "checkPoints", method = RequestMethod.POST, produces ="test/json;charset=UTF-8")
    @ResponseBody
    public String checkPoints(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            HashMap<String, String> data = ipjs.getNumber(params);

            if(data != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("data", data);
            }
            else
            {
                modelMap.put("msg", "failed");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 301
    @RequestMapping(value = "/postDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String testABDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iEsPopjourneyService.postDeletes(params);

            if(cnt > 0) {
                modelMap.put("msg", "success");
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

    // 301
    @RequestMapping(value = "/postLikes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postLikes(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iEsPopjourneyService.addLike(params);
            int notf = iEsPopjourneyService.likeNotf(params);
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

    // 301
    @RequestMapping(value = "/postLikeCancles", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postLikeCancles(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int delcnt = iEsPopjourneyService.delLike(params);

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

    // 301
    @RequestMapping(value="/postCmtAdds", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postCmtAdds(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = iEsPopjourneyService.getCmtAdds(params);

            int cnt2 = iEsPopjourneyService.getCmtNotf(params);

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

    // 301
    // postCmtCmtDeletes
    @RequestMapping(value="/postCmtCmtDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postCmtCmtDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();

        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iEsPopjourneyService.getCmtDeletes(params);

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

    // 301
    @RequestMapping(value="/postCmts", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postCmts(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int pages = Integer.parseInt(params.get("pages"));

        int cmtCnt = iEsPopjourneyService.getCmtCnt(params);

        PagingBean pb = iPagingService.getPagingBean(pages, cmtCnt, 10, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        // 여행일지 세부페이지의 댓글
        List<HashMap<String, String>> cmt = iEsPopjourneyService.getPostCmt(params);

        modelMap.put("pb", pb);
        modelMap.put("cmt", cmt);
*/
        return mapper.writeValueAsString(modelMap);

    }

    // 301
    @RequestMapping(value="/postCmtEdits", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postCmtEdits(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iEsPopjourneyService.getCmtEdits(params);

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

    // 301
    @RequestMapping(value="/postCmtCmtAdds", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postCmtCmtAdds(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iEsPopjourneyService.getCmtCmtAdds(params);
            int cnt2 = iEsPopjourneyService.getCmtCmtNotf(params);
            int cnt3 = iEsPopjourneyService.getCmtCmtNotf2(params);

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

    // 301
    @RequestMapping(value="/postCmtDeletes", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postCmtDeletes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iEsPopjourneyService.getCmtDeletes(params);
            int cnt2 = iEsPopjourneyService.getCmtCmtDeletes(params);

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

    // 302
    @RequestMapping(value = "/postWrites", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postWrites(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*

        int postNo = iEsPopjourneyService.getPostNo(params);
        modelMap.put("postNo", postNo);

        try {
            int cnt = iEsPopjourneyService.addPost(params);

            if(cnt > 0) {
                modelMap.put("msg", "success");
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

    // 303
    @RequestMapping(value = "/postUpdates", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String postUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = iEsPopjourneyService.postUpdate(params);

            if(cnt > 0) {
                modelMap.put("msg", "success");
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
}
