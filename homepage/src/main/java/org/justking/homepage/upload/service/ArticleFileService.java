package org.justking.homepage.upload.service;

import java.util.List;

public interface ArticleFileService {

    // ���� ���
    List<String> getArticleFiles(Integer articleNo) throws Exception;

//    // ���� ����
//    void deleteFile(String fileName, Integer articleNo) throws Exception;

}