package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by
 *
 * @Author OGI aka nOy39
 * @Date 07.05.2018
 * @Time 15:59
 */
public interface MessageRepo extends CrudRepository<Message, Long> {
    List<Message> findByTag(String tag);
}
