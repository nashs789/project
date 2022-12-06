package com.re.popjourney;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class test2 {
    public static void main(String[] args) {
        ClassMap classMap = new ClassMap();

        classMap.put(Vo1.class, new Vo1());
        classMap.put(CommonVo.class, new CommonVo());

        setMasking(classMap);
    }

    public static CommonVo setMasking(ClassMap classMap){
        Class<?>[] classList = {Vo1.class, Vo2.class};
        Map<String, Object> map = new HashMap();

        map.put("id1", "admin");

        for(Class className : classList){
            if(classMap.containsKey(className)){
                System.out.println("className = " + className);
                Field[] filedList = classMap.get(className).getClass().getDeclaredFields();
                for(Field field : filedList){
                    System.out.println("field.getName() = " + field.getName());
                    if(map.containsKey(field.getName())){
                        Object fieldValue = map.get(field.getName());
                        field.setAccessible(true);
                        try{
                            field.set(className, field.getType().cast(fieldValue));
                        } catch (IllegalArgumentException | IllegalAccessException e){
                            e.printStackTrace();
                        }
                    }
                }
            }
        }

        return new CommonVo();
    }
}
