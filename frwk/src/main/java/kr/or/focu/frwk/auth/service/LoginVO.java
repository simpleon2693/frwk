package kr.or.focu.frwk.auth.service;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginVO {
    private String userId;
    private String userPw;
    private UserType userType;
    private ProviderType providerType;
}
