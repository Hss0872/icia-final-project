package com.best.team.community.dao;

import com.best.team.community.bean.FreeBoard;
import com.best.team.community.bean.LaneBoard;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardDao {

    List<FreeBoard> getFreeBoardList(@Param("pageNum") Integer pageNum);

    int getBoardCount();
}
