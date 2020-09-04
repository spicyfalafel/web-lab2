package ru.itmo.my.models;

import java.util.ArrayList;

public class ReqHolder {

    public ReqHolder(){
        this.requests = new ArrayList<>();
    }
    private final ArrayList<PointRequest> requests;

    public String toTable(){
        StringBuilder builder = new StringBuilder();
        for (PointRequest pr :
                requests) {
            builder.append(pr.toTableRow());
        }
        return builder.toString();
    }

    public void addReq(PointRequest req){
        requests.add(req);
    }
}
