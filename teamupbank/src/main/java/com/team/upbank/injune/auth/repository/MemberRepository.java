package com.team.upbank.injune.auth.repository;

import com.team.upbank.injune.auth.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, String> {
}