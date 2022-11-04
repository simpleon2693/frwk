package kr.or.focu.frwk.sample.service;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
public class BothDTO {

    private String parentTitle;

    private InnerBoth innerBoth;
    private InnerBoth2 innerBoth2;
    private List<InnerBoth3> innerBoth3List;

    @Data
    class InnerBoth {
        private String childTitle;
    }
    @Data
    class InnerBoth2 {
        private String childTitle2;
        private InnerInnerBoth innerInnerBoth;

        @Data
        class InnerInnerBoth {
            private String childTitle3;
        }
    }

    @Data
    static class InnerBoth3 {
        private String childTitle4;
    }


}

