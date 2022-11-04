package kr.or.focu.frwk.sample.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OuterDTO {
    private String key;
    private InnerDTO innerDTO;
}
