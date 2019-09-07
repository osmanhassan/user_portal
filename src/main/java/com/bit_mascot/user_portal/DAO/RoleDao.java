package com.bit_mascot.user_portal.DAO;

import com.bit_mascot.user_portal.Entity.RoleEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao extends CrudRepository<RoleEntity, Long> {
    RoleEntity findById(int roleId);
}
