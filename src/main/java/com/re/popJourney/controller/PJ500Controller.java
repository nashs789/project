package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class PJ500Controller {

    //마이 페이지 일지 가져오기
    // 500
    // myPageJournals
    @RequestMapping(value = "/myPageJournals", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String myPageJournals(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int page = Integer.parseInt(params.get("page"));
        int cnt = ipjs.journalCnt(params);

        PagingBean pb = ips.getPagingBean(page, cnt, 15, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        try {
            List<HashMap<String, String>> myPage = ipjs.myPageJournal(params);

            if(myPage != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("myPage", myPage);
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

    //등급 신청
    // 500
    // upgrades
    @RequestMapping(value = "/upgrades", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String upgrades(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        if(Integer.parseInt(params.get("point")) < 100)
        {
            modelMap.put("msg", "notEnough");
            return mapper.writeValueAsString(modelMap);
        }

        try {
            int cnt = ipjs.upgrade(params);

            if(cnt > 0)
            {
                modelMap.put("msg", "success");
            }
            else if(cnt == 0)
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

    //내 북마크 가져오기
    // 501
    // myBMKs
    @RequestMapping(value = "/myBMKs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String myBMKs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            List<HashMap<String, String>>BMK = ipjs.myBMK(params);

            if(BMK != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("BMK", BMK);

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

    //내 북마크 갯수 카운트
    // 501
    // myBMKCnts
    @RequestMapping(value = "/myBMKCnts", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String myBMKCnts(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.myBMKCnt(params);

            if(cnt > 0)
            {
                modelMap.put("msg", "success");
                modelMap.put("cnt", cnt);

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

    //북마크 추가
    @RequestMapping(value = "/addBMKs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addBMKs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.addBMK(params);

            if(cnt > 0)
            {
                modelMap.put("msg", "success");
                modelMap.put("cnt", cnt);
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

    //내 북마크 수정하기
    // 501
    // editBMKs
    @RequestMapping(value = "/editBMKs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String editBMKs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            HashMap<String, String>BMK = ipjs.BMKDetail(params);

            if(BMK != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("BMK", BMK);

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

    //북마크 수정하기
    // 501
    // updateBMKs
    @RequestMapping(value = "/updateBMKs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateBMKs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.updateBMK(params);

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //북마크 삭제하기
    // 501
    @RequestMapping(value = "/delBMKs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delBMKs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.delBMK(params);
            int cnt2 = ipjs.delBMK2(params);

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //마이 페이지 일지 가져오기
    // 502
    // myFollowers
    @RequestMapping(value = "/myFollowers", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String myFollowers(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int cnt = ipjs.followerCnt(params);

        if(Integer.parseInt(params.get("firstPage")) > cnt)
        {
            modelMap.put("msg", "full");
            return mapper.writeValueAsString(modelMap);
        }

        try {

            List<HashMap<String, String>> myFollower = ipjs.myPageFollower(params);

            if(myFollower != null)
            {
                modelMap.put("firstPage", Integer.toString(Integer.parseInt(params.get("firstPage")) + 15));
                modelMap.put("lastPage", Integer.toString(Integer.parseInt(params.get("lastPage")) + 15));

                modelMap.put("msg", "success");
                modelMap.put("myFollower", myFollower);
                modelMap.put("cnt", cnt);
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

    // 마이 페이지 팔로잉 한 사람 가져오기
    // 503
    // myFollowings
    @RequestMapping(value = "/myFollowings", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String myFollowings(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int cnt = ipjs.followingCnt(params);

        if(Integer.parseInt(params.get("firstPage")) > cnt)
        {
            modelMap.put("msg", "full");
            return mapper.writeValueAsString(modelMap);
        }
        try {

            List<HashMap<String, String>> myFollowing = ipjs.myPageFollowing(params);

            if(myFollowing != null)
            {
                modelMap.put("firstPage", Integer.toString(Integer.parseInt(params.get("firstPage")) + 15));
                modelMap.put("lastPage", Integer.toString(Integer.parseInt(params.get("lastPage")) + 15));

                modelMap.put("msg", "success");
                modelMap.put("myFollowing", myFollowing);
                modelMap.put("cnt", cnt);
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

    //마이 페이지 팔로잉 한 사람 메모 가져오기
    // 503
    // followingMemos
    @RequestMapping(value = "/followingMemos", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String followingMemos(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            HashMap<String, String> followingMemo = ipjs.followingMemo(params);

            modelMap.put("msg", "success");
            modelMap.put("followingMemo", followingMemo);

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //팔로우 메모 업데이트
    // 503
    // updateMemos
    @RequestMapping(value = "/updateMemos", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateMemos(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.updateMemo(params);

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

    //북마크 안에 일지 리스트
    // 504
    // detailLists
    @RequestMapping(value = "/detailLists", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String detailLists(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        int page = Integer.parseInt(params.get("page"));
        int cnt = Integer.parseInt(params.get("cnt"));

        PagingBean pb = ips.getPagingBean(page, cnt, 15, 5);

        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));

        try {

            List<HashMap<String, String>> detail = ipjs.detailList(params);

            if(detail != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("pb", pb);
                modelMap.put("detail", detail);
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

    //북마크 안에 일지 리스트
    // 504
    // deleteBMKJournals
    @RequestMapping(value = "/deleteBMKJournals", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deleteBMKJournals(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.deleteBMKJournal(params);

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

    //일지 리스트 그리기
    // 506
    // regionDetails
    @RequestMapping(value = "/regionDetails", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String regionDetails(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            int cnt = Integer.parseInt(params.get("cnt"));
            int page = Integer.parseInt(params.get("page"));
            PagingBean pb = ips.getPagingBean(page, cnt, 15, 5);

            params.put("startCnt", Integer.toString(pb.getStartCount()));
            params.put("endCnt", Integer.toString(pb.getEndCount()));

            List<HashMap<String, String>> regionList = ipjs.regionList(params);
            if(cnt > 0)
            {
                modelMap.put("msg", "success");
                modelMap.put("pb", pb);
                modelMap.put("regionList", regionList);
            }
            else if(cnt== 0)
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

    //팔로우 했는지 안했는지 체크
    // 507
    // followStatus
    @RequestMapping(value = "/followStatus", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String followStatus(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.followStatus(params);

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

    //프로필 가져오기
    // 507
    // myPageProfiles
    @RequestMapping(value = "/myPageProfiles", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String myPageProfiles(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            HashMap<String, String> myProfile = ipjs.myPageProfile(params);

            if(myProfile != null)
            {
                modelMap.put("msg", "success");
                modelMap.put("myProfile", myProfile);
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

    //언팔로우
    // 507
    // unfollows
    @RequestMapping(value = "/unfollows", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String unfollows(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.unfollow(params);

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

    //팔로우
    // 507
    // follows
    @RequestMapping(value = "/follows", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String follows(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.follow(params);
            int cnt2 = ipjs.followNotf(params);

            if(cnt > 0 && cnt2 > 0)
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
}
