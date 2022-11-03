package com.team.upbank.seula.repository;

import com.team.upbank.seula.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapper {
    void noticeInsert(BoardDTO dto);

//    //공지사항 목록 조회
    List<BoardDTO> noticeList(Map<String, Object> map);

    // 공지사항 갯수 구하기
    Integer noticeCnt();
    void plusReadCnt(int n_No);
    BoardDTO noticeDetail(int n_No);
    void noticeUpdate(BoardDTO dto);
    void noticeDelete(int n_No);



}
