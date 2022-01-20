package com.best.team.community.dao;

import com.best.team.community.bean.*;
import com.best.team.member.bean.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    FreeBoard getFreeBoardInfo(@Param("bNum") int bNum);

    LaneBoard getLaneBoardInfo(@Param("bNum") int bNum);

    boolean addCountFreeBReply(@Param("bNum") int bNum);

    boolean addCountLaneBReply(@Param("bNum") int bNum);

    boolean deleteCountFreeBReply(@Param("bNum") int bNum);

    boolean deleteCountLaneBReply(@Param("bNum") int bNum);

    boolean incrCountFreeBLike(@Param("bNum") int bNum);

    boolean incrCountLaneBLike(@Param("bNum") int bNum);

    boolean decrCountFreeBLike(@Param("bNum") int bNum);

    boolean decrCountLaneBLike(@Param("bNum") int bNum);

    int selectCountFreeBLike(@Param("bNum") int bNum);

    int selectCountLaneBLike(@Param("bNum") int bNum);

    boolean freeBoardViewCountUp(@Param("bNum") int bNum);

    boolean laneBoardViewCountUp(@Param("bNum") int bNum);

    boolean checkExistFreeBoard(@Param("bNum") int bNum);

    boolean checkExistLaneBoard(@Param("bNum") int bNum);

    boolean freeBoardWriteSelKey(BoardWriteParam boardWriteParam);

    boolean laneBoardWriteSelKey(BoardWriteParam boardWriteParam);

    boolean freeBoardUpdate(BoardWriteParam boardWriteParam);

    boolean laneBoardUpdate(BoardWriteParam boardWriteParam);

    boolean deleteFreeBoard(@Param("bNum") int bNum,@Param("m_id") String m_id);

    boolean deleteLaneBoard(@Param("bNum") int bNum,@Param("m_id") String m_id);

    List<FreeBoard> getFreeBoardList(Member member);

    List<LaneBoard> getLaneBoardList(Member member);

}