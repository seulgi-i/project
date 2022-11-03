package com.team.upbank.injune.service;

import com.team.upbank.injune.domain.AccountTransfer;
import com.team.upbank.injune.domain.AccountTransferRepository;
import com.team.upbank.seula.dto.BoardDTO;
import com.team.upbank.seula.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AccountTransferService {
    private final AccountTransferRepository accountTransferRepository;

    private  final BoardRepository boardRepository;

    @Transactional(readOnly = true)
    public List<AccountTransfer> getTransferList() {
        return accountTransferRepository.findAll(Sort.by(Sort.Direction.DESC, "tfDate"));
    }


    @Transactional(readOnly = true)
    public AccountTransfer getTransfer(Long tfNum) {
        return accountTransferRepository.findById(tfNum).orElse(null);
    }


}
