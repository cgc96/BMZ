package org.justking.homepage.upload.db;

import java.util.List;

public interface ArticleFileDAO {

    // ���� �߰�
    void addFile(String fileName) throws Exception;

    // ���� ���
    List<String> getArticleFiles(Integer articleNo) throws Exception;

//    // ���� ����
//    void deleteFile(String fileName) throws Exception;

    // ���� ��ü ����
    void deleteFiles(Integer articleNo) throws Exception;

    // ���� ����
    void replaceFile(String fileName, Integer articleNo) throws Exception;

    // ���� ���� ����
    void updateFileCnt(Integer articleNo) throws Exception;

}