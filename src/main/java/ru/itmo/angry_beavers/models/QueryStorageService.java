package ru.itmo.angry_beavers.models;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class QueryStorageService {
    private final ArrayList<Query> queries;

    public ArrayList<Query> getQueries() {
        return queries;
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

    public void updateStatuses(){
        queries.forEach(query -> query.setFresh(false));
    }

    public String getFreshQueriesTable(){
        StringBuilder result = new StringBuilder();
        queries.stream().filter(Query::isFresh).forEach(query -> addDataFromQuery(result, query));
        return result.toString();
    }

    public String getQueriesTable() {
        StringBuilder result = new StringBuilder();
        queries.forEach(query -> addDataFromQuery(result, query));
        return result.toString();
    }

    public SimpleDateFormat getDateFormat() {
        return dateFormat;
    }

    private void addDataFromQuery(StringBuilder result, Query query){
        result.append("<div class=\"table-row\">");
        result.append("<div>").append(getNumberView(query.getX())).append("</div>");
        result.append("<div>").append(getNumberView(query.getY())).append("</div>");
        result.append("<div>").append(getNumberView(query.getR())).append("</div>");
        result.append("<div>").append(dateFormat.format(query.getQueryTime())).append("</div>");
        result.append(getResultView(query.isResult()));
        result.append("</div>");
    }

    private String getResultView(boolean result) {
        return result ? "<div style=\"color: green\">In the area</div>" :
                "<div style=\"color: red\">Outside the area</div>";
    }

    private double getNumberView(double number){
        MathContext context = new MathContext(7, RoundingMode.HALF_UP);
        BigDecimal result = new BigDecimal(number, context);
        return Double.parseDouble(String.valueOf(result));
    }
}
