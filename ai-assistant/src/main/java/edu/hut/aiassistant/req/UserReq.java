package edu.hut.aiassistant.req;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class UserReq {
    @NotBlank(message = "【手机号】不能为空")
    private String mobile;
    @NotBlank(message = "【密码】不能为空")
    private String password;
}
