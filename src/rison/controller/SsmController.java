package rison.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import rison.model.SsmTest;
import rison.service.SsmService;
import rison.utils.PagedResult;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by rison on 2017/4/15.
 * 增删改查
 */
@Controller
public class SsmController {

    @Autowired
    private SsmService ssmService;

    /**
     * 查询所有
     */
//    @RequestMapping(value = "getAllOne.do", produces = "application/json;charset=utf-8")
//    @ResponseBody
//    public String getAll(){
//
//        List<SsmTest> findAllList = ssmService.getAll();
//
//        //企业常用方法：json的范式
//        Gson gson = new Gson();
//        String json = gson.toJson(findAllList);
//        return json;
//
//    }

    @ResponseBody
    @RequestMapping(value = "getAllTwo.do", produces = "application/json;charset=utf-8")
    public ModelAndView getAll(){

        System.out.println("执行到这里了吗？");

        List<SsmTest> findAllList = ssmService.getAll();

        //方法一：传统方式需要传递request值
//        request.setAttribute("findAllList", findAllList);

        //方法二：
        ModelAndView mv = new ModelAndView();
        mv.addObject("findAllList", findAllList);
        mv.setViewName("list");

        return mv;
    }

    /**
     * 传统分页
     */
    public ModelAndView getAllByPage(Integer pageNumber, Integer pageSize){
        ModelAndView mv = new ModelAndView();
        //当前页、每页条数
        //传入数据到分页工具类
//        PagedResult<SsmTest> pagedResult = ssmService.getAllByPage(pageNumber, pageSize);
        //数据传递到前台页面展示

        return mv;
    }

}
