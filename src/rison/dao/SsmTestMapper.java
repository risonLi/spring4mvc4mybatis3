package rison.dao;

import rison.model.SsmTest;

import java.util.List;

public interface SsmTestMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SsmTest record);

    int insertSelective(SsmTest record);

    SsmTest selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SsmTest record);

    int updateByPrimaryKey(SsmTest record);

    /**
     * 对应到SsmTestMapper.xml
     * @return
     */
    List<SsmTest> getAll();
}