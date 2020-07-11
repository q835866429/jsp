<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="bean.e05.valuebean.GoodsSingle" %>
<%@ page import="java.util.ArrayList" %>
<%!
    static ArrayList goodslist = new ArrayList();            //用来存储商品

    static {                                                //静态代码块
        String[] names = {"苹果", "橙子", "梨子", "香蕉"};        //商品名称
        float[] prices = {2.8f, 3.1f, 2.5f, 2.3f};            //商品价格
        for (int i = 0; i < 4; i++) {                            //初始化息列表
            //定义一个GoodsSingle类对象来封装商品信息
            GoodsSingle single = new GoodsSingle();
            single.setName(names[i]);                    //封装商品名称信息
            single.setPrice(prices[i]);                //封装商品价格信息
            single.setNum(1);                            //封装购买数量信息
            goodslist.add(i, single);                      //保存商品到goodslist集合对象中
        }
    }
%>
<%
    session.setAttribute("goodslist", goodslist);        //保存商品列表到session中
    response.sendRedirect("show.jsp");                    //跳转到show.jsp页面显示商品
%>
