package com.bit_mascot.user_portal.DAO;

import com.bit_mascot.user_portal.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserDao extends CrudRepository<UserEntity, Long> {
    Optional<UserEntity> findByEmail(String email);
    UserEntity findByEmailAndRoleId(String email, int roleId);
    List<UserEntity> findByRoleId(int roleId);
}
