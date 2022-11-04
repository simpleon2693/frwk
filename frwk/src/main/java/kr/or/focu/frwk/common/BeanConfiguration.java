package kr.or.focu.frwk.common;

import com.google.gson.Gson;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class BeanConfiguration {

    @Bean
    // 메소드 명은 반환타입만 올바르다면, 아무렇게나 해주어도 괜찮다.
    // public Gson yoonSung() 역시 괜찮다.
    public Gson gson() {
        return new Gson();
    }


    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }


}
