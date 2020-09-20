package ru.itmo.angry_beavers.models;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.stream.Collectors;

public class QueryStorageService {
    private final ArrayList<Query> queries;

    public ArrayList<Query> getQueries() {
        ArrayList<Query> reservedQueries = new ArrayList<>(queries);
        Collections.reverse(reservedQueries);
        return reservedQueries;
    }

    private final SimpleDateFormat dateFormat;

    public QueryStorageService() {
        // default
        this(new SimpleDateFormat("HH:mm:ss"));
    }

    public QueryStorageService(SimpleDateFormat dateFormat) {
        this.dateFormat = dateFormat;
        queries = new ArrayList<>();
    }

    public void addQuery(Query query) {
        query.setX(getNumberView(query.getX()));
        query.setY(getNumberView(query.getY()));
        query.setR(getNumberView(query.getR()));
        queries.add(query);
    }

    public ArrayList<Query> getFreshQueries(){
        ArrayList<Query> freshQueries = queries.stream().filter(Query::isFresh).collect(Collectors.toCollection(ArrayList::new));
        Collections.reverse(freshQueries);
        return freshQueries;
    }

    public void updateStatuses(){
        queries.forEach(query -> query.setFresh(false));
    }

    public SimpleDateFormat getDateFormat() {
        return dateFormat;
    }

    private double getNumberView(double number){
        MathContext context = new MathContext(7, RoundingMode.HALF_UP);
        BigDecimal result = new BigDecimal(number, context);
        return Double.parseDouble(String.valueOf(result));
    }
}
