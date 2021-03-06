package rison.service;

import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rison.dao.SsmTestMapper;
import rison.model.SsmTest;
import rison.utils.PageBeanUtil;
import rison.utils.PagedResult;

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

    /**
     * 分页显示列表
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public PagedResult<SsmTest> getAllByPage(Integer pageNumber, Integer pageSize) {
        //调用分页插件
        PageHelper.startPage(pageNumber, pageSize);

        //查询数据，获取数据
        List<SsmTest> ssmList = ssmTestMapper.getAll();

        //通过分页工具类加载分页数据
        return PageBeanUtil.toPagedResult(ssmList);
    }

    /**
     * 插入操作
     * @param ssmTest
     * @return
     */
    public int insert(SsmTest ssmTest) {
        int i = ssmTestMapper.insert(ssmTest);

        return i;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    public int del(String id) {
        int i = 0;
        if (id != null && id != ""){
            Integer sid = Integer.valueOf(id);
            i = ssmTestMapper.deleteByPrimaryKey(sid);

        }
        return i;
    }

    /**
     * 更新操作
     * 回显示
     * @param id
     * @return
     */
    public SsmTest toUpdateByid(String id) {
        SsmTest ssmTest = new SsmTest();
        if (id != null && id != ""){
            Integer sid = Integer.valueOf(id);
            ssmTest = ssmTestMapper.selectByPrimaryKey(sid);
        }
        return ssmTest;
    }

    public int doUpdateByid(SsmTest ssmTest) {

//        int i = ssmTestMapper.doUpDateById(ssmTest);
        int i = ssmTestMapper.updateByPrimaryKey(ssmTest);

        return i;
    }
}
