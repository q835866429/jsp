<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="bean.e05.toolbean.MyTools" %>
<%@ page import="bean.e05.valuebean.GoodsSingle" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="myCar" class="bean.e05.toolbean.ShopCar" scope="session"/>
<%
    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("buy")) {                                    //
        ArrayList goodslist = (ArrayList) session.getAttribute("goodslist");
        int id = MyTools.strToint(request.getParameter("id"));
        GoodsSingle single = (GoodsSingle) goodslist.get(id);
        myCar.addItem(single);        //调用ShopCar类中的ad)方法      加商品
        response.sendRedirect("show.jsp");
    } else if (action.equals("remove")) {                            //移除商品
        String name = request.getParameter("name");        //获品名称
        myCar.removeItem(name);        //调用ShopCar类中的removeItem()方法移除商品
        response.sendRedirect("shopcar.jsp");
    } else if (action.equals("clear")) {                            //清空购物车
        myCar.clearCar();                //调用ShopCar类中的clearCar()方法清空购物车
        response.sendRedirect("shopcar.jsp");
    } else {
        response.sendRedirect("show.jsp");
    }
%>