package com.re.popjourney;

import java.util.HashMap;
import java.util.Map;

public class ClassMap {
    private Map<Class<?>, Object> map = new HashMap<Class<?>, Object>();

    public <T> void put(Class<T> objectClass, T object) {
        map.put(objectClass, object);
    }

    public <T> T get(Class<T> objectClass) {
        return objectClass.cast(map.get(objectClass));
    }

    public <T> boolean containsKey(Class<T> objectClass){
        return map.containsKey(objectClass);
    }
}
