package ru.itmo.my;

import lombok.Setter;
import ru.itmo.my.models.MyPoint;

public class GraphArea {


    /*
            |
        2   |   1
     ----------------
        3   |    4
            |
     */
    /*

    1) triangle
    2) circle
    3) nothing
    4) rectangle
     */

    private int getNumberOfPart(MyPoint point){
        double x = point.getX();
        double y = point.getY();
        if (x == 0 || y == 0) return 0;
        if (x * y > 0) {
            if (x > 0) return 1;
            else return 3;
        } else {
            if (x > 0) return 4;
            else return 2;
        }
    }

}
