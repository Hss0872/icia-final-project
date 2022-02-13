package com.best.team.community.dao;

import com.best.team.community.bean.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface FileDao {

    void addUploadFile(UploadFile uploadFile);

    void addFreeBFile(UploadFile uploadFile);

    void updateFileUse(UploadFile uploadFile);

    void addLaneBFile(UploadFile uploadFile);

    ArrayList<UploadFile> getUnusedFileList();

    boolean deleteUploadFile();

    List<FreeBFile> getFreeBFile(FreeBoard freeBoard);

    List<LaneBFile> getLaneBFile(LaneBoard laneBoard);

    void deleteFreeBFile(FreeBFile freeBFile);

    void deleteLaneBFile(LaneBFile laneBFile);
}
