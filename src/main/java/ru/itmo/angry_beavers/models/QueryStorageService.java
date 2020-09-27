package ru.itmo.angry_beavers.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.stream.Collectors;

public class QueryStorageService implements Serializable {
    private final Deque<Query> queries;
    private final SimpleDateFormat dateFormat;

    public Deque<Query> getQueries() {
        return queries;
    }

    public QueryStorageService() {
        dateFormat = new SimpleDateFormat("HH:mm:ss");
        queries = new ArrayDeque<>();
    }

    public void addQuery(Query query) {
        query.setX(getNumberView(query.getX()));
        query.setY(getNumberView(query.getY()));
        query.setR(getNumberView(query.getR()));
        queries.addFirst(query);
    }

    public Deque<Query> getFreshQueries() {
        return queries
                .stream()
                .filter(Query::isFresh)
                .collect(Collectors.toCollection(ArrayDeque::new));
    }

    public void updateStatuses() {
        queries.forEach(query -> query.setFresh(false));
    }

    public SimpleDateFormat getDateFormat() {
        return dateFormat;
    }

    // round to 7 digits
    private double getNumberView(double number) {
        MathContext context = new MathContext(7, RoundingMode.HALF_UP);
        BigDecimal result = new BigDecimal(number, context);
        return Double.parseDouble(String.valueOf(result));
    }
}
