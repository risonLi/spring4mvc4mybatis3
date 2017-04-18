package rison.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @RequestMapping(value = "getAllOne.do", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getAll(){

        List<SsmTest> findAllList = ssmService.getAll();

        //企业常用方法：json的范式
        Gson gson = new Gson();
        String json = gson.toJson(findAllList);
        return json;

    }

    @ResponseBody
    @RequestMapping(value = "getAllTwo.do", produces = "application/json;charset=utf-8")
    public ModelAndView getAll(HttpServletRequest request){

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
     * 传统分页方法
     * @param pageNumber:当前页
     * @param pageSize:每页条数
     * @return
     *
     * @RequestParam(value = "pageNumber", defaultValue = "1") 指设置默认参数（pageNumber的默认值为1，默认显示第一页）
     * pageSize同理
     */
//    @ResponseBody
    @RequestMapping(value = "getAllByPage.do", produces = "application/json;charset=utf-8")
    public ModelAndView getAllByPage(@RequestParam(value = "pageNumber", defaultValue = "1")Integer pageNumber,
                                     @RequestParam(value = "pageSize", defaultValue = "2")Integer pageSize){
        ModelAndView mv = new ModelAndView();
        //传入数据到分页工具类
        PagedResult<SsmTest> pageResult = ssmService.getAllByPage(pageNumber, pageSize);
        //数据传递到前台页面展示
        mv.addObject("pageResult", pageResult);
        //跳转页面
        mv.setViewName("listpage");

        return mv;
    }

}
