package com.re.popJourney.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@Getter
@Setter
@ToString
public class MemVo extends CommonVo{
    private String mem_no;                  /* 회원번호 */
    private String id;                      /* 아이디 */
    private String pw;                      /* 비밀번호 */
    private String phone;                   /* 전화번호 */
    private String email;                   /* 이메일 */
    private String email_confirm;           /* 이메일인증여부 [0: 거부, 1: 동의] */
    private String name;                    /* 이름 */
    private String nic;                     /* 닉네임 */
    private String intro;                   /* 소개글 */
    private String photo_path;              /* 사진경로 */
    private String birth;                   /* 생년월일 */
    private String sex;                     /* 성별 [1: 남자, 2: 여자] */
    private String keyword_no;              /* 키워드번호 */
    private String marketing;               /* 마케팅수집동의여부[0: 거부, 1: 동의] */
    private String join_date;               /* 가입일 */
    private String leave_date;              /* 탈퇴일 */
    private String keyword;                 /* 키워드 */
    private String telcom;                  /* 통신사 */
    private String last_date;               /* 마지막접속일 */
    private String acc_cnt;                 /* 접속수 */
    private String grade_no;                /* 등급 */
    private String today;                   /* 당일날짜 */

    public MemVo() {
    }

/*    @Override
    public String toString() {

        Class cls = this.getClass();
        Method[] arrMethod = cls.getMethods();
        StringBuffer sb = new StringBuffer(this.getClass().toString());

        sb.append(" => \n");

        try {

            for(Method m : arrMethod) {
                if(m.getName().startsWith("get") && !m.getName().equals("getClass")) {
                    sb.append(m.getName());
                    sb.append(": ");
                    sb.append(m.invoke(this, null));
                    sb.append("\n ");
                }
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return sb.toString().substring(0, sb.length() - 2);
    }*/
}
