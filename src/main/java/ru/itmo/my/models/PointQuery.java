package ru.itmo.my.models;

import lombok.Data;

import java.util.Date;

@Data
public class PointQuery {

    private Date queryTime;
    private boolean result;
    private boolean fresh = true;

    private MyPoint point;

    public PointQuery(double x, double y, double r){
        point = new MyPoint(x, y, r);
    }
}
