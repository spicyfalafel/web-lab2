package ru.itmo.my.models;

import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class PointRequest {

    private Date queryTime;
    private boolean inArea;
    private boolean fresh = true;

    private MyPoint point;

    public PointRequest(double x, double y, double r){
        point = new MyPoint(x, y, r);
    }

    public String toTableRow() {
        return "<tr class=\"result-table-row\">" +
                "<td>" + this.point.getX() + "</td>" +
                "<td>" + this.point.getY() + "</td>" +
                "<td>" + this.point.getR() + "</td>" +
                "<td>" + this.isInArea() + "</td>" +
                "<td>" + new SimpleDateFormat("hh:mm:ss").format(this.queryTime) + "</td>" +
                "</tr>";
    }
}
