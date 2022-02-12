package com.best.team.community.userClass;

import com.best.team.community.bean.UploadFile;
import lombok.extern.slf4j.Slf4j;

import java.io.File;

@Slf4j
public class FileClass {

    public static long measureFolderSize(File directory) {
        long length = 0;
        for (File file : directory.listFiles()) {
            length += file.length();
        }
        return length;
    }

    public static void deleteFile(String filePath) {
        log.info("uploadFilePath = {}", filePath);
        File file = new File(filePath);

        if (file.exists()) {
            if (file.delete()) {
                log.info("{} delete!", file);
            } else {
                log.info("삭제 실패");
            }
        } else {
            log.info("파일이 존재하지 않습니다.");
        }
    }
}
