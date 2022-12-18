package com.re.popJourney.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.re.popJourney.common.PJUtils;
import com.re.popJourney.model.MemVo;
import com.re.popJourney.service.PJ200Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
public class PJ200Controller {

    private final PJ200Service pj200Service;

    // 아이디 중복확인 - 이인복 201
    // IDDbCk
    // null과 중복예외 처리가 추가되어야함 2022.12.18 (추가처리)
    @PostMapping(value="/selectPJ200DupId", produces="text/json;charset=UTF-8")
    public String selectPJ200DupId(@RequestBody MemVo memVo) throws Throwable {
        Map<String, Object> noDupId = pj200Service.selectPJ200DupId(memVo);

        noDupId.put("dup", "Y");

        return PJUtils.getModelToJson("noDupId", noDupId);
    }

    //이메일 인증코드확인 201
    @RequestMapping(value = "/checkCodes", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String checkCodes(HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

/*
        String mail = params.get("inputEmail") + "@" + params.get("inputDomain"); // 받는 사람 이메일
        params.put("mail", mail);

        try {
            int cnt = ipjs.checkCode(params);

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

    //인증 코드 메일 보내기 201
    @RequestMapping(value = "sendCodes",
            method = RequestMethod.POST,
            produces ="test/json;charset=UTF-8")
    @ResponseBody
    public String sendCodes(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();

/*
        int random;
        String code = "";

        for(int i = 0; i < 10; i++)
        {
            random = (int)Math.floor(Math.random()*3)+0;
            if(random == 0)
            {
                code += (int)(Math.floor(Math.random()*10)+0);
            }
            else if(random == 1)
            {
                code += (char)((int)Math.floor((Math.random() * 26 )+65));
            }
            else
            {
                code += (char)((int)Math.floor((Math.random() * 26 )+97));
            }
        }

        String setfrom = "PopJourney";
        String tomail = params.get("inputEmail") + "@" + params.get("inputDomain"); // 받는 사람 이메일
        String title = "PopJourney 회원가입 메일 인증입니다."; // 제목
        String content = "<div>PopJourney 가입 메일입니다. </div>" + code; // 내용

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content, true); // 메일 내용

            mailSender.send(message);

            params.put("mail", tomail);
            params.put("title", title);
            params.put("content", content);
            params.put("code", code);

            int cnt = ipjs.mail(params);

            if(cnt > 0)
            {
                modelMap.put("msg", "success");
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

    // 닉네임 중복확인 - 이인복 202
    // params에 넘어오는 키: storage(ID)
    @RequestMapping(value = "/nicDbCk", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String nicDbCk(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        if (params.get("MEM_NO") != null) {
            HashMap<String, String> doubleCheck = ipjs.nicDbCk2(params);

            try {
                if (doubleCheck == null) {
                    modelMap.put("msg", "success");
                } else {
                    modelMap.put("msg", "failed");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // doubleCheck로 넘어오는 키: MEM_NO
            HashMap<String, String> doubleCheck = ipjs.nicDbCk(params);

            try {
                if (doubleCheck == null) {
                    modelMap.put("msg", "success");
                } else {
                    modelMap.put("msg", "failed");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 회원등록 - 이인복 202
    @RequestMapping(value = "/joins", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String joins(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        // 넘어갈 키 값(사용할것): inputName, birth, phone, email, inputID, inputPW
        // inputCode, inputKeyword, sex, selectTelcom, selectKeyword, photoPath
        // inputNic, inputIntro, marketing

        //암호화
        params.put("inputPW", Utils.encryptAES128(params.get("inputPW")));

        try {
            int cnt = ipjs.join(params);
            ipjs.setProfile();

            if (cnt != 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
 */
        return mapper.writeValueAsString(modelMap);
    }

    // 회원정보 가져오기 - 이인복 203
    @RequestMapping(value = "/getInfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getInfo(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        HashMap<String, String> modelMap = new HashMap<String, String>();
/*
        // NAME, ID, PW, PHONE, EMAIL, DOMAIN, YEAR, MONTH, DAY, SEX, KEYWORD_NO,
        // KEYWORD, TELCOM
        HashMap<String, String> myInfo = ipjs.getInfo(params);
        modelMap = myInfo;

        if (myInfo != null) {
            modelMap.put("msg", "success");
        } else {
            modelMap.put("msg", "failed");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 회원정보 수정 - 이 인복 203
    @RequestMapping(value = "/editInfos", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String editInfos(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        HashMap<String, String> modelMap = new HashMap<String, String>();
/*
        String birth = params.get("inputYear") + "-" + params.get("inputMonth") + "-" + params.get("inputDay");
        String phone = "010" + params.get("inputPhone");
        String email = params.get("inputEmail") + "@" + params.get("inputDomain");

        params.put("birth", birth);
        params.put("phone", phone);
        params.put("email", email);

        //암호화
        params.put("inputPW", Utils.encryptAES128(params.get("inputPW")));

        try {
            int cnt = ipjs.updateInfo(params);

            if (cnt != 0) {
                modelMap.put("msg", "success");
            } else {
                modelMap.put("msg", "failed");
            }

        } catch (Exception e) {
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 회원정보 삭제 - 이인복 203
    @RequestMapping(value = "/deletes", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deletes(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {

            int cnt = ipjs.delete(params);

            session.invalidate();

            if(cnt != 0)
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

    // 회원정보 가져오기 - 이인복 204
    @RequestMapping(value = "/getInfo2", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getInfo2(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        HashMap<String, String> modelMap = new HashMap<String, String>();
/*
        // PHOTO_PATH, NIC, INTRO
        HashMap<String, String> myInfo = ipjs.getInfo2(params);
        modelMap = myInfo;

        if (myInfo != null) {
            modelMap.put("msg", "success");
        } else {
            modelMap.put("msg", "failed");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //세션 프로필값 변경 - 이인복 204
    @RequestMapping(value = "/changeProfiles", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeProfiles(HttpSession session,@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        try {
            session.setAttribute("sPHOTO_PATH", params.get("photoPath"));
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("msg", "error");
        }
 */
        return mapper.writeValueAsString(modelMap);
    }

    //프로필 수정 - 이 인복 204
    @RequestMapping(value = "/editProfiles", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody public String editProfiles(@RequestParam HashMap<String, String> params) throws Throwable
    {
        ObjectMapper mapper = new ObjectMapper();
        HashMap<String, String> modelMap = new HashMap<String, String>();
/*
        try {
            int cnt = ipjs.updateProfile(params);

            if(cnt != 0)
            {
                modelMap.put("msg", "success");
            }
            else
            {
                modelMap.put("msg", "failed");
            }

        }
        catch (Exception e){
            modelMap.put("msg", "error");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 아이디 찾기 - 이인복 205
    @RequestMapping(value = "findIDs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String findIDs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        String email = params.get("inputEmail") + "@" + params.get("inputDomain");
        params.put("email", email);

        HashMap<String, String> data = ipjs.findID(params);

        if (data != null) {
            String ID;
            if(data.get("ID").length() > 4)
            {
                String star = "";

                for (int i = 0; i < data.get("ID").length() - 4; i++) {
                    star += "*";
                }

                ID = data.get("FIRST") + star + data.get("LAST");
            }
            else
            {
                ID = data.get("ID");
            }

            modelMap.put("ID", ID);
            modelMap.put("NAME", data.get("NAME"));
            modelMap.put("msg", "success");
        } else {
            modelMap.put("msg", "failed");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    //인증 코드 메일 보내기 205
    @RequestMapping(value = "sendIDs",
            method = RequestMethod.POST,
            produces ="test/json;charset=UTF-8")
    @ResponseBody
    public String sendIDs(@RequestParam HashMap<String, String> params) throws Throwable {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        String email = params.get("inputEmail") + "@" + params.get("inputDomain");
        params.put("email", email);

        HashMap<String, String> data = ipjs.findID(params);

        String setfrom = "PopJourney";
        String tomail = params.get("inputEmail") + "@" + params.get("inputDomain"); // 받는 사람 이메일
        String title = "PopJourney 아이디 찾기"; // 제목
        String content = "<div>회원님의 아이디는" + data.get("ID")+ " 입니다. </div>"; // 내용


        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content, true); // 메일 내용

            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 비밀번호 찾기 - 이인복 206
    @RequestMapping(value = "findPWs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String findPWs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        String email = params.get("inputEmail") + "@" + params.get("inputDomain");
        params.put("email", email);

        HashMap<String, String> data = ipjs.findPW(params);

        if (data != null) {
            modelMap.put("MEM_NO", data.get("MEM_NO"));
            modelMap.put("msg", "success");
        } else {
            modelMap.put("msg", "failed");
        }
*/
        return mapper.writeValueAsString(modelMap);
    }

    // 비밀번호 재설정 - 이인복
    @RequestMapping(value = "updateInputPWs", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateInputPWs(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
/*
        //암호화
        params.put("inputPW", Utils.encryptAES128(params.get("inputPW")));

        int cnt = ipjs.updatePW(params);
        try {
            if (cnt != 0) {
                modelMap.put("msg", "success");
            } else {
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
