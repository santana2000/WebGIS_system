<%@ page import="ONEDao.BaceDao" %>
<%@ page import="ONEEntity.Bace" %>
<%@ page import="java.util.List" %>
<%@ page import="ONEDao.Replace" %>
<%@ page import="ONEDao.ADao" %>
<%@ page import="ONEEntity.A" %>
<%@ page import="ONEEntity.B" %>
<%@ page import="ONEDao.BDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/9
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>矿山信息详情表</title>
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
<h3>矿山信息详情表</h3>
<table>
    <!-- 基本情况 -->
    <tr>
        <th colspan = "2" class="info">1.基本情况</th>
    </tr>
        <%
            BaceDao bsd = new BaceDao();
            List<Bace> list = bsd.readBace(request.getParameter("recid"));
            for(Bace bs:list)
            {
        %>
    <tr>
        <th>矿山名称</th>
        <td><%=bs.getMINE_NAME() %></td>
    </tr>
    <tr>
        <th>采矿许可证号</th>
        <td><%=bs.getMINE_PERMIT() %></td>
    </tr>
    <tr>
        <th>所在地区</th>
        <td><%=bs.getCOUNTY() %></td>
    </tr>
    <tr>
        <th>矿区面积（平方公里）</th>
        <td><%=bs.getMINE_AREA() %></td>
    </tr>
    <tr>
        <th>生产现状</th>
        <td><%String MP = bs.getPRODUCTION_STATUS();
            String PRODUCTION_STATUS = new Replace().PSReplace(MP);
            out.print(PRODUCTION_STATUS);
        %></td>
    </tr>
    <tr>
        <th>矿类</th>
        <td><%=bs.getMINERALS_TYPE_ID() %></td>
    </tr>
    <tr>
    <th>矿种</th>
    <td><%=bs.getMINERALS_VARIETY_ID() %></td>
    </tr>
    <tr>
    <th>建矿时间</th>
    <td><%=bs.getMINE_CREAT_TIME() %></td>
    </tr>
    <tr>
        <th>设计服务年限</th>
        <td><%=bs.getDESIGN_SERVICE_LIFE() %></td>
    </tr>
    <tr>
        <th>采矿方式</th>
        <td><%String PI = bs.getMINE_METHOD();
            String MINE_METHOD = new Replace().MMReplace(PI);
            out.print(MINE_METHOD);
        %></td>
    </tr>
    <tr>
        <th>设计生产能力（万吨/年）</th>
        <td><%=bs.getDESIGN_CAPACITY() %></td>
    </tr>
    <tr>
        <th>矿山规模</th>
        <td><%String PS = bs.getMINE_SCALE();
            String MINE_SCALE = new Replace().MSReplace(PS);
            out.print(MINE_SCALE);
        %></td>
    </tr>
    <tr>
        <th>最大采深（米）</th>
        <td><%=bs.getMINE_DEPTH() %></td>
    </tr>
    <tr>
        <th>采空区面积（公顷）</th>
        <td><%=bs.getMINEGOAF_AREA() %></td>
    </tr>
    <tr>
        <th>经济类型</th>
        <td><%=bs.getECONOMIC_TYPE() %></td>
    </tr>
        <%
            }
        %>

    <!-- 矿山地质环境监测 -->
    <tr>
        <th colspan = "2" class="en">2.矿山地质环境监测</th>
    </tr>
    <%
        ADao bdB = new ADao();
        List<A> list1 = bdB.readA(request.getParameter("recid"));
        for(A bsa:list1)
        {
    %>
    <tr>
        <th>内容</th>
        <td><%String PO = bsa.getMONITOR_CONTENT();
            String MONITOR_CONTENT= new Replace().MCReplace(PO);
            out.print(MONITOR_CONTENT);
        %></td>
    </tr>
    <tr>
        <th>方法</th>
        <td><%=bsa.getMONITOR_METHOD() %></td>
    </tr>
    <tr>
        <th>国家投入</th>
        <td><%=bsa.getCENTER_COST() %></td>
    </tr>
    <tr>
        <th>地方投入</th>
        <td><%=bsa.getLOCAL_COST() %></td>
    </tr>
    <tr>
        <th>企业投入</th>
        <td><%=bsa.getSELF_COST() %></td>
    </tr>
    <%
        }
    %>

    <!-- 矿山地质环境治理 -->
    <tr>
        <th colspan = "2" class="pch">2.矿山地质环境治理</th>
    </tr>
    <%
        BDao bdC = new BDao();
        List<B> list2 = bdC.readB(request.getParameter("recid"));
        for(B bsa:list2)
        {
    %>
    <tr>
        <th>治理内容</th>
        <td><%String PO = bsa.getMANAGE_TYPE_ID();
            String MANAGE_TYPE_ID= new Replace().MIReplace(PO);
            out.print(MANAGE_TYPE_ID);
        %></td>
    </tr>
    <tr>
        <th>开始时间</th>
        <td><%=bsa.getSTART_TIME() %></td>
    </tr>
    <tr>
        <th>结束时间</th>
        <td><%=bsa.getEND_TIME() %></td>
    </tr>
    <tr>
        <th>治理面积</th>
        <td><%=bsa.getMANAGE_AREA() %></td>
    </tr>
    <tr>
        <th>治理措施</th>
        <td><%=bsa.getMANAGE_MEASURE() %></td>
    </tr>

    <tr>
        <th>治理成效</th>
        <td><%=bsa.getMANAGE_EFFECT() %></td>
    </tr>
    <tr>
        <th>中央投入</th>
        <td><%=bsa.getCENTER_COST() %></td>
    </tr>
    <tr>
        <th>地方投入</th>
        <td><%=bsa.getLOCAL_COST() %></td>
    </tr>
    <tr>
        <th>自筹投入</th>
        <td><%=bsa.getSELF_COST() %></td>
    </tr>
    <tr>
        <th>其他投入</th>
        <td><%=bsa.getOTHER_COST() %></td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
