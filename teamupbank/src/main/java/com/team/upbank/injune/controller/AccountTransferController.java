package com.team.upbank.injune.controller;

import com.team.upbank.injune.domain.AccountTransfer;
import com.team.upbank.injune.service.AccountTransferService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class AccountTransferController {

    private final AccountTransferService accountTransferService;

    @GetMapping("/transferList")
    public List<AccountTransfer> getTransferList() {
        return accountTransferService.getTransferList();
    }

//    @GetMapping("/tranfer/{tfNum}")
//    public AccountTransfer getTransfer(@PathVariable("tfNum") Long tfNum) {
//        return accountTransferService.getTransfer(tfNum);
//    }

    @GetMapping("/tranfer/{tfNum}")
    public Map<String, Object> getTransfer(@PathVariable("tfNum") Long tfNum) {
        Map<String, Object> result = new HashMap<>();
        AccountTransfer transfer = accountTransferService.getTransfer(tfNum);
        if (transfer == null) {
            result.put("detail", null);
            result.put("success", false);
            result.put("message", "계죄이체내역 상세조회 실패");
        } else {
            result.put("detail", accountTransferService.getTransfer(tfNum));
            result.put("success", true);
            result.put("message", "계죄이체내역 상세조회 완료");
        }

        return result;
    }
}
