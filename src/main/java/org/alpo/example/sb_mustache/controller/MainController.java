package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.domain.Message;
import org.alpo.example.sb_mustache.domain.User;
import org.alpo.example.sb_mustache.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * Created by @author OGI aka nOy39
 *
 * @Date 07.05.2018
 * @Time 14:53
 */
@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Value("${app.welcome.message}")
    private String MESSAGE = "";

    @Value("${app.welcome.title}")
    private String TITLE = "";


    @GetMapping("/")
    public String welcome(Map<String, Object> model) {
        model.put("title", TITLE);
        model.put("message", MESSAGE);
        return "welcome";
    }

    @GetMapping("/main")
    public String testor(@RequestParam(required = false) String filter, Model model) {
        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTagOrTextContainingIgnoreCase(filter,filter);
        } else {
            messages = messageRepo.findAll();
        }
        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping(value = "/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Map<String, Object> model) {
        Message message = new Message(text, tag, user);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "main";
    }

}
