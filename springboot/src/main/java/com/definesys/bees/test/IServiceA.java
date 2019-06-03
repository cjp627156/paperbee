package com.definesys.bees.test;

import com.definesys.bees.test.impl.IServiceImpl;

public class IServiceA implements IServiceImpl {
    @Override
    public void action(){
        System.out.println("action A");
    }
}
