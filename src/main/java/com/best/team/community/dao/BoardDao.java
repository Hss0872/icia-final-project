package com.best.team.community.dao;

import com.best.team.community.bean.BoardSearch;
import com.best.team.community.bean.FreeBoard;
import com.best.team.community.bean.LaneBoard;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardDao {

    List<FreeBoard> getPreviewFreeBList();

    List<LaneBoard> getPreviewLaneBList(@Param("lane") String lane);

    List<FreeBoard> getFreeBList(@Param("pageNum") Integer pageNum);

    List<FreeBoard> getFreeBSearchList(@Param("pageNum") Integer pageNum,@Param("boardSearch") BoardSearch boardSearch);

    List<LaneBoard> getLaneBList(@Param("pageNum") Integer pageNum,@Param("lane") String lane);

    List<LaneBoard> getLaneBSearchList(@Param("pageNum")Integer pageNum,@Param("lane") String lane,@Param("boardSearch") BoardSearch boardSearch);

    int getFreeBoardCount();

    int getFreeBSearchCount(BoardSearch boardSearch);

    int getLaneBoardCount(@Param("lane") String lane);

    int getLaneBSearchCount(@Param("lane") String lane,@Param("boardSearch") BoardSearch boardSearch);
}