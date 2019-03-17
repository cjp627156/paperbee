package com.definesys.bees.test;

public class CounterLocked {
    private  int counter=0;

    public synchronized void add(){
        counter++;
    }

    public synchronized int getCount(){
        return this.counter;
    }
}
