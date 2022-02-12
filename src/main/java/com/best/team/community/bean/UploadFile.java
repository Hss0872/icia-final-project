package com.best.team.community.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("UploadFile")
public class UploadFile {
    private int b_write_num;
    private String system_file_name;
    private String origin_file_name;
}
