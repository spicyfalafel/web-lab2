package ru.itmo.my.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MyPoint {
    private double x;
    private double y;
    private double r;
}
