package kr.or.focu.frwk.common.base;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class BaseDTO {
    private String regId;
    private String modiId;

    private Integer pageSize;
    private Integer pageNo;

    @JsonIgnore
    private int startRow;
    
    @JsonIgnore
    private int endRow;

    public int getStartRow(){
        return ((pageNo-1) * pageSize) + 1;
    }

    public int getEndRow(){
        return (pageNo * pageSize);
    }
}
