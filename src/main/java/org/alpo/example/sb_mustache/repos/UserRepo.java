package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by @author OGI aka nOy39
 *
 * @Date 07.05.2018
 * @Time 21:20
 */
public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}
