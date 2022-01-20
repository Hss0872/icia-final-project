package com.best.team.community.dao;

import com.best.team.community.bean.FreeReply;
import com.best.team.community.bean.LaneReply;
import com.best.team.member.bean.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyDao {


    List<FreeReply> getFreeReplyList(@Param("bNum") int bNum);

    List<LaneReply> getLaneReplyList(@Param("bNum") int bNum);

    boolean addFreeReply(@Param("member") Member member,@Param("bNum") int bNum,@Param("content") String content);

    boolean addLaneReply(@Param("member") Member member,@Param("bNum") int bNum,@Param("content") String content);

    boolean deleteFreeReply(@Param("bNum") int bNum,@Param("r_type_num") int r_type_num,@Param("r_type_id") String r_type_id);

    boolean deleteLaneReply(@Param("bNum") int bNum,@Param("r_type_num") int r_type_num,@Param("r_type_id") String r_type_id);

    List<FreeReply> getProfileFreeReplyList(Member member);

    List<LaneReply> getProfileLaneReplyList(Member member);
}
