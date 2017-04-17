package rison.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rison.dao.SsmTestMapper;
import rison.model.SsmTest;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rison on 2017/4/15.
 */
@Service
@Transactional
public class SsmService {

    //约定大于配置
    @Resource
    private SsmTestMapper ssmTestMapper;

//    Could not autowire. No beans of 'SsmTestMapper' type found. less... (⌘F1)
//    Checks autowiring problems in a bean class.
    /**
     * 查询全部
     * @return
     */
    public List<SsmTest> getAll() {
        List<SsmTest> ssmList = ssmTestMapper.getAll();
        return ssmList;
    }

//    public List<SsmTest> getAll(HttpServletRequest request) {
//        List<SsmTest> ssmList = ssmTestMapper.getAll();
//        return ssmList;
//    }
}
