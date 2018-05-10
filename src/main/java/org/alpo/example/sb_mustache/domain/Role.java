package org.alpo.example.sb_mustache.domain;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by
 *
 * @Author OGI aka nOy39
 * @Date 07.05.2018
 * @Time 20:59
 */
public enum Role implements GrantedAuthority {
    USER, ADMIN, GUEST;

    @Override
    public String getAuthority() {
        return name();
    }
}
