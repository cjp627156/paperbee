package pers.kerry.paperbee.pojo;

import java.io.Serializable;

public class Label implements Serializable {
    private String id;
    private String labelName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }
}
