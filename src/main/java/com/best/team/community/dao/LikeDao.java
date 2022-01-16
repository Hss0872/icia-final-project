package com.best.team.community.dao;

import com.best.team.member.bean.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDao {
    boolean addFreeBoardLike(@Param("bNum") int bNum,@Param("member") Member member);

    boolean addLaneBoardLike(@Param("bNum") int bNum,@Param("member") Member member);

    boolean checkFreeBoardLike(@Param("bNum") int bNum,@Param("m_id") String m_id);

    boolean checkLaneBoardLike(@Param("bNum") int bNum,@Param("m_id") String m_id);

    boolean deleteFreeBoardLike(@Param("bNum") int bNum,@Param("member") Member member);

    boolean deleteLaneBoardLike(@Param("bNum") int bNum,@Param("member") Member member);
}
