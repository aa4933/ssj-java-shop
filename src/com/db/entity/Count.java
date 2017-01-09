package com.db.entity;

/**
 * Created by wuilly on 2017/1/2.
 */
public class Count {
    private int number;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Count{" +
                "number=" + number +
                '}';
    }
}
