package org.alpo.example.sb_mustache.service;

import org.alpo.example.sb_mustache.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by @author OGI aka nOy39
 *
 * @Date 08.05.2018
 * @Time 12:04
 */
@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

//    public UserService(UserRepo userRepo) {
//        this.userRepo = userRepo;
//    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }
}
