package com.re.popjourney;

public class test {
    public static void main(String[] args){
        System.out.println("hello world");

        CommonVo cVo = new CommonVo();
        Vo1 vo1 = new Vo1();
        Vo2 vo2 = new Vo2();

        setId(cVo);
        setId(vo1);
        setId(vo2);

        System.out.println("cVo = " + cVo.getIp());
        System.out.println("vo1 = " + vo1.getIp());
        System.out.println("vo2 = " + vo2.getIp());
    }

    public static <T extends CommonVo> T setId(T vo){
        vo.setIp("127.127.127.127");

        return vo;
    }


}
