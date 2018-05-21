package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.domain.User;
import org.alpo.example.sb_mustache.domain.dto.CaptchaResponseDto;
import org.alpo.example.sb_mustache.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

/**
 * Created by @author OGI aka nOy39
 *
 * @Date 07.05.2018
 * @Time 21:17
 */
@Controller
public class RegistrationController {
    private static final String CAPTCHA_URL ="https://www.google.com/recaptcha/api/siteverify?secret=%s&response";


    @Autowired
    private UserService userService;

    @Value("${recaptcha.secret")
    public String secret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam("password2") String passwordConfirm,
                          @RequestParam("g-recaptcha-response") String cartchaResponse,
                          @Valid User user,
                          BindingResult bindingResult,
                          Model model) {

        String url = String.format(CAPTCHA_URL, secret, cartchaResponse);
        CaptchaResponseDto response = restTemplate
                .postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        boolean responseSuccess = response.isSuccess();
        if (!responseSuccess) {
            model.addAttribute("captchaError","Fill captcha");

        }

        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);

        if (isConfirmEmpty) {
            model.addAttribute("password2Error","Password confirmation can`t be empty");
        }

        if (user.getPassword() != null && !user.getPassword().equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Password are different!");
        }

        if (isConfirmEmpty || bindingResult.hasErrors() || !responseSuccess) {
            Map<String, String> errors = ControllerUtil.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "User exist");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType","success");
            model.addAttribute("message","User successfully activated");
        } else {
            model.addAttribute("messageType","danger");
            model.addAttribute("message","Activation code is not found.");
        }
        return "login";
    }
}
