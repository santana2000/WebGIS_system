<%@ page import="WasteDao.WasteBasicalDao" %>
<%@ page import="WasteEntity.WasteBasical" %>
<%@ page import="java.util.List" %>
<%@ page import="WasteDao.WasteLiquidDao" %>
<%@ page import="WasteEntity.WasteLiquid" %>
<%@ page import="WasteDao.WasteSolidDao" %>
<%@ page import="WasteEntity.WasteSolid" %>
<%@ page import="WasteDao.Replace" %>
<%@ page import="org.omg.PortableInterceptor.INACTIVE" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>矿山三废信息详情表</title>
</head>
<style type = "text/css">
    body{font-family:Arial, Verdana, sans-serif; color:#111111;}
    table{width:600px;}
    th, td{padding:7px 10px 10px 10px;
        boder-bottom:2px solid #111111; border-top:1px solid #999; text-align:left;}
    th{letter-spacing:0.1em;}
    th.info, th.en, th.pch{font:30px "Microsoft New Tai Lue"}
    tr:hover{background-color:#efefef;}
</style>
<body>
<form name = "recid"  method="post">
    <input type = "text" name = "recid" maxlength="50"/>
    <input type = "submit" value = "Go">
</form>
<br>
<h3>矿山三废信息详情表</h3>
<table >

    <!-- 废水废液 -->
    <tr>
        <th colspan = "2" class="en">1.废水废液</th>
    </tr>
        <%
        WasteLiquidDao end = new WasteLiquidDao();
        List<WasteLiquid> list1 = end.readWasteLiquid(request.getParameter("recid"));
        for(WasteLiquid en:list1)
        {
    %>
    <tr>
        <th>废水废液类型</th>
        <td><% String dt = en.getSURVEY_TYPE();
            String SURVEY_TYPE = new Replace().SURVEY_TYPEReplace(Integer.parseInt(dt));
            out.print(SURVEY_TYPE);
        %>
        </td>
    </tr>

    <tr>
        <th>年产出量（万m3）</th>
        <td><%=en.getOUTPUT() %></td>
    </tr>
    <tr>
        <th>有害物质</th>
        <td><%=en.getHARMFUL_SUBSTANCE() %></td>
    </tr>
    <tr>
        <th>年排放量（万m3）</th>
        <td><%=en.getDISCHARGE() %></td>
    </tr>
    <tr>
        <th>排放水质量等级</th>
        <td><%=en.getWATER_LEVEL() %></td>
    </tr>
    <tr>
    <th>排放去向</th>
    <td><%=en.getOUTPUT() %></td>
    </tr>
    <tr>
        <th>影响对象</th>
        <td><%=en.getINFLUENCE_OBJECT() %></td>
    </tr>
    <%
        }
    %>
    <!-- 固体废弃物 -->
    <tr>
        <th colspan = "2" class="pch">2.固体废弃物</th>
    </tr>
        <%
        WasteSolidDao mnd = new WasteSolidDao();
        List<WasteSolid> list2 = mnd.readWasteSolid(request.getParameter("recid"));
        for(WasteSolid po:list2)
        {
    %>
    <tr>
        <th>固体废弃物类型</th>
        <td><% String dtm = po.getSURVEY_TYPE2();
            String SURVEY_TYPE2 = new Replace().SURVEY_TYPE2Replace(Integer.parseInt(dtm));
            out.print(SURVEY_TYPE2);
        %>
        </td>
    </tr>


    <tr>
        <th>累计积存（万吨）</th>
        <td><%=po.getTOTAL_STORE() %></td>
    </tr>
    <tr>
        <th>年产出量（万吨）</th>
        <td><%=po.getOUTPUT2() %></td>
    </tr>
    <tr>
        <th>年利用量（万吨）</th>
        <td><%=po.getUSED_QUATITY() %></td>
    </tr>
    <tr>
        <th>有害物质</th>
        <td><%=po.getHARMFUL_SUBSTANCE() %></td>
    </tr>
    <tr>
        <th>影响对象</th>
        <td><%=po.getEFFECT_OBJECT() %></td>
    </tr>
    <tr>
        <th>破坏面积（公顷）</th>
        <td><%=po.getDESTROY_AREA() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>