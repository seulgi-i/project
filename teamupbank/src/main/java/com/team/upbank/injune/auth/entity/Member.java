package com.team.upbank.injune.auth.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class Member implements Serializable {

    @Id
    private String id;
    private String password;
    private String name;
    private String account;
    private Date birthday;
    private String job;
    private String address;
    private String addressDetail;
    private String postNum;
    private String phone;
    private String email;
    private String key;
    private String authorities;
    private int enabled;
    private String status;
    private LocalDateTime regDate = LocalDateTime.now();

}
