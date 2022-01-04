package com.best.team.member.dao;
import com.best.team.member.bean.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface JoinDao {      //String은 binding이 안걸려서 @param사용 단 been을 이용하면 괜찮음
    Boolean idDupleCheck(@Param("duple_type") String duple_type, @Param("duple_member") String duple_member);
}
