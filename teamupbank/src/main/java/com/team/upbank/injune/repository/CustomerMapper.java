package com.team.upbank.injune.repository;

import com.team.upbank.injune.auth.entity.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CustomerMapper {
    void insertCustomer(Member dto);

    int selectKey(String key);

    void updateGrade(String key);

    List<Member> selectCustomer(String id);

}
