package com.team.upbank.seula.repository;


import com.team.upbank.seula.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Component
public class BoardRepository implements BoardMapper {

    private final SqlSession sqlSession;

    @Override
    public void noticeInsert(BoardDTO dto) {
        sqlSession.insert("BoardMapper.noticeInsert", dto);
    }

    @Override
    public List<BoardDTO> noticeList(Map<String, Object> map) {
        return sqlSession.selectList("BoardMapper.noticeList", map);
    }

    @Override
    public Integer noticeCnt() {
        return sqlSession.selectOne("BoardMapper.noticeCnt");
    }

    @Override
    public void plusReadCnt(int n_No) {
        sqlSession.update("BoardMapper.plusReadCnt", n_No);
    }

    @Override
    public BoardDTO noticeDetail(int n_No) {
        return sqlSession.selectOne("BoardMapper.noticeDetail", n_No);
    }

    @Override
    public void noticeUpdate(BoardDTO dto) {
        sqlSession.update("BoardMapper.noticeUpdate", dto);
    }

    @Override
    public void noticeDelete(int n_No) {
        sqlSession.delete("BoardMapper.noticeDelete", n_No);
    }
}
