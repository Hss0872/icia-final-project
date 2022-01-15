package com.best.team.community.dao;

import com.best.team.member.bean.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDao {
    boolean addFreeBoardLike(@Param("bNum") int bNum,@Param("member") Member member);

    boolean addLaneBoardLike(@Param("bNum") int bNum,@Param("member") Member member);

    boolean checkAddFreeBoardLike(@Param("bNum") int bNum,@Param("member") Member member);

    boolean checkAddLaneBoardLike(@Param("bNum") int bNum,@Param("member") Member member);
}
