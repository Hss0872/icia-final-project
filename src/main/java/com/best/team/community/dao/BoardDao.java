package com.best.team.community.dao;

import com.best.team.community.bean.FreeBoard;
import com.best.team.community.bean.LaneBoard;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardDao {

    List<FreeBoard> getPreviewFreeBList();

    List<LaneBoard> getPreviewLaneBList();

    List<FreeBoard> getFreeBList(@Param("pageNum") Integer pageNum);

    List<LaneBoard> getLaneBList(@Param("pageNum") Integer pageNum, String lane);

    int getFreeBoardCount();

    int getLaneBoardCount(@Param("lane") String lane);
}