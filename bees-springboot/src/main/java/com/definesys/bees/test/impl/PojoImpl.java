package com.definesys.bees.test.impl;

import java.util.Map;

public interface PojoImpl<T> {
    public <T>T mapToPojo(Map<String,Object> map);
}
