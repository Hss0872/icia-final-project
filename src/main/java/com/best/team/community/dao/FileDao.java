package com.best.team.community.dao;

import com.best.team.community.bean.UploadFile;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface FileDao {

    void addUploadFile(UploadFile uploadFile);

    void addFreeBFile(UploadFile uploadFile);

    void updateFileUse(UploadFile uploadFile);

    void addLaneBFile(UploadFile uploadFile);

    ArrayList<UploadFile> getUnusedFileList();

    boolean deleteUploadFile();
}
