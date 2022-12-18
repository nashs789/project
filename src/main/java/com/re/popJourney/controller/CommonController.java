package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.re.popJourney.model.MemVo;
import com.re.popJourney.service.PJCommonService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
public class CommonController {

    private final PJCommonService commonService;

    // 공통 - 로그아읏
    @PostMapping(value = "/logouts", produces = "application/json;charset=UTF-8")
    public String logouts(HttpSession session) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

        session.invalidate();

        return mapper.writeValueAsString(modelMap);
    }

    // 공통 - 알람 팝업
    @PostMapping(value = "/selectCommonNotifications", produces = "application/json;charset=UTF-8")
    public String notifications(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

        if(params.get("GBN").equals("1"))
        {
            params.put("page", Integer.toString(Integer.parseInt(params.get("page")) * 10));
        }
        else
        {
            if(Integer.parseInt(params.get("pageCnt")) < Integer.parseInt(params.get("page"))*10)
            {
                modelMap.put("msg", "full");
                return mapper.writeValueAsString(modelMap);
            }
            params.put("page", Integer.toString((Integer.parseInt(params.get("page"))+1) * 10));
        }
        try {
            /*
            List<HashMap<String, String>> notification  = ipjs.notification(params);

            if(notification != null)
            {
                SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
                Date day1 = new Date();
                Date day2;

                for(int i = 0; i < notification.size(); i++)
                {
                    String msg ="";

                    day2 = simple.parse(String.valueOf(notification.get(i).get("NOTF_DATE2")));

                    if(day1.getYear() != day2.getYear())
                    {
                        msg = day1.getYear() - day2.getYear()+"년 전";
                    }
                    else if(day1.getMonth() != day2.getMonth())
                    {
                        msg = day1.getMonth() - day2.getMonth()+"달 전";
                    }
                    else if(day1.getDate() != day2.getDate())
                    {
                        msg = day1.getDate() - day2.getDate()+"일 전";
                    }
                    else if(day1.getDate() == day2.getDate())
                    {
                        msg = "오늘";
                    }
                    notification.get(i).put("msg", msg);
                }
                modelMap.put("msg", "success");
                modelMap.put("notification", notification);
                modelMap.put("page", Integer.toString(Integer.parseInt(params.get("page")) / 10));
                modelMap.put("firstPage", Integer.toString(Integer.parseInt(params.get("page"))));
            }
            else if(notification == null)
            {
                modelMap.put("msg", "failed");
            }
                     */
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }

        return mapper.writeValueAsString(modelMap);
    }

    // 공통 - 로그인
    // params로 넘어오는 키: inputID, inputPW
    @PostMapping(value="/login", produces="application/json;charset=UTF-8")
    public String login(MemVo inMemVo, HttpSession session) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
        // loginInfo로 넘어오는 키: MEM_NO, GRADE_NO, NIC, LAST_DATE, TODAY
        //SimpleDateFormat simpleD = new SimpleDateFormat("yyyy-MM-dd");
        MemVo outMemVo = commonService.login(inMemVo);

        session.setAttribute("sMemVo", outMemVo);
/*
        //암호화
        params.put("inputPW", Utils.encryptAES128(params.get("inputPW")));
*/
/*
        HashMap<String, String> loginInfo = ipjs.login(params);
        try {
            if (loginInfo != null) {
                Date lastDate = simpleD.parse(loginInfo.get("LAST_DATE"));
                Date today = simpleD.parse(loginInfo.get("TODAY"));

                params.put("MEM_NO", String.valueOf(loginInfo.get("MEM_NO")));

                if (lastDate.compareTo(today) < 0) {
                    ipjs.accCnt(params);
                }

                session.setAttribute("sMEM_NO", loginInfo.get("MEM_NO"));
                session.setAttribute("sGRADE_NO", loginInfo.get("GRADE_NO"));
                session.setAttribute("sNIC", loginInfo.get("NIC"));
                session.setAttribute("sPHOTO_PATH", loginInfo.get("PHOTO_PATH"));
                session.setAttribute("sINTRO", loginInfo.get("INTRO"));

                HashMap<String, String> data = ipjs.getNumber(params);

                session.setAttribute("sFOLLOWER", data.get("FOLLOWER_CNT")); //팔로워 숫자
                session.setAttribute("sFOLLOWING", data.get("FOLLOWING_CNT")); //팔로잉 숫자
                session.setAttribute("sBMK", data.get("BMK_JOURNAL_CNT")); //북마크 안에 일지 숫자
                session.setAttribute("sJOURNAL", data.get("JOURNAL_CNT")); //작성한 일지 숫자
                session.setAttribute("sPOINT", data.get("TOTAL_POINT")); //여행작가 점수

                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 알람 팝업창에 읽음표시 - 이인복
    @PostMapping(value = "/updateCommonReads", produces = "application/json;charset=UTF-8")
    public String updateCommonReads(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

        try {
/*
            int cnt = ipjs.read(params);

            if(cnt != 0)
            {
                modelMap.put("msg", "success");
            }
            else
            {
                modelMap.put("msg", "failed");
            }
*/
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
        return mapper.writeValueAsString(modelMap);
    }
}
