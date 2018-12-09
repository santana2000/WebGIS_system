<%@ page import="LanddestoryDao.Replace" %>
<%@ page import="LanddestoryDao.LandDestoryDao" %>
<%@ page import="LanddestoryEntity.LandDestory" %>
<%@ page import="java.util.List" %>
<%@ page import="LanddestoryEntity.Land" %>
<%@ page import="LanddestoryDao.LandDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>土地破坏信息详情表</title>
</head>
<style type = "text/css">
    body{font-family:Arial, Verdana, sans-serif; color:#111111;}
    table{width:600px;}
    th, td{padding:7px 10px 10px 10px;
        boder-bottom:2px solid #111111; border-top:1px solid #999; text-align:left;}
    th{letter-spacing:0.1em;}
    th.info, th.en{font:30px "Microsoft New Tai Lue"}
    tr:hover{background-color:#efefef;}
</style>
<body>
<form name = "recid"  method="post">
    <input type = "text" name = "recid" maxlength="50"/>
    <input type = "submit" value = "Go">
</form>
<br>
<h3>土地破坏信息详情表</h3>
<table >
    <!-- 地形地貌 -->

        <%
       LandDao bsd = new LandDao();
        List<Land> list = bsd.readLand(request.getParameter("recid"));
        for(Land bc:list)
        {
    %>
    <tr>
        <th>矿山名称</th>
        <td><%=bc.getRECID() %></td>
    </tr>
    <tr>
    <th>地形地貌景观破坏类型</th>
    <td><%=bc.getLANDSCAPE_TYPE() %></td>
    </tr>
    <tr>
        <th>地形地貌景观破坏方式</th>
        <td><%=bc.getDESTROY_TYPE() %></td>
    </tr>

    <tr>
        <th>破坏地质遗迹类型</th>
        <td><%String MS = bc.getREMAINS_TYPE();
            String REMAINS_TYPE = new Replace().REMAINS_TYPEReplace(MS);
            out.print(REMAINS_TYPE);
        %></td>
    </tr>
    <tr>
        <th>地质遗迹影响程度</th>
        <td><%=bc.getREMAINS_INFLUENCE_DEGREE() %></td>
    </tr>
    <tr>
        <th>影响自然保护区情况</th>
        <td><%String MST = bc.getRESERVE_INFULENCE_TYPE();
            String RESERVE_INFULENCE_TYPE = new Replace().RESERVE_INFULENCE_TYPEReplace(MST);
            out.print(RESERVE_INFULENCE_TYPE);
        %></td>
    </tr>
    <tr>
    <th>自然保护区影响程度</th>
    <td><%String MSB = bc.getRESERVE_INFLUENCE_DEGREE();
        String RESERVE_INFLUENCE_DEGREE = new Replace().RESERVE_INFLUENCE_DEGREEReplace(MSB);
        out.print(RESERVE_INFLUENCE_DEGREE);
    %></td>
    </tr>
    <tr>
    <th>城市周边影响情况</th>
    <td><%String MSC = bc.getCITY_INFULENCE_TYPE();
        String CITY_INFULENCE_TYPE = new Replace().CITY_INFULENCE_TYPEReplace(MSC);
        out.print(CITY_INFULENCE_TYPE);
    %></td>
    </tr>
    <tr>
        <th>景观破坏距离城市距离</th>
        <td><%=bc.getCITY_INFULENCE_DISTANCE() %></td>
    </tr>

    <tr>
        <th>城市周边影响程度</th>
        <td><%String MSD = bc.getCITY_INFULENCE_DEGREE();
            String CITY_INFULENCE_DEGREE = new Replace().CITY_INFULENCE_DEGREEReplace(MSD);
            out.print(CITY_INFULENCE_DEGREE);
        %></td>
    </tr>
    <tr>
    <th>交通干线影响情况</th>
    <td><%String MSE = bc.getROAD_INFULENCE_TYPE();
        String ROAD_INFULENCE_TYPE = new Replace().ROAD_INFULENCE_TYPEReplace(MSE);
        out.print(ROAD_INFULENCE_TYPE);
    %></td>
    </tr>
    <tr>
        <th>景观破坏距离交通干线距离</th>
        <td><%=bc.getROAD_DISTANCE() %></td>
    </tr>
    <tr>
        <th>交通干线影响程度</th>
        <td><%String MSQ = bc.getROAD_INFULENCE_DEGREE();
            String ROAD_INFULENCE_DEGREE = new Replace().ROAD_INFULENCE_DEGREEReplace(MSQ);
            out.print(ROAD_INFULENCE_DEGREE);
        %></td>
    </tr>
    <tr>
        <th>其他破坏影响</th>
        <td><%=bc.getOTHER_INFLUENCE() %></td>
    </tr>
    <tr>
        <th>文字描述</th>
        <td><%=bc.getMEMO() %></td>
    </tr>
        <%
			}
		%>
    <!-- 土地破坏情况 -->
    <tr>
        <th colspan = "2" class="en">土地破坏情况</th>
    </tr>
        <%
			LandDestoryDao dd = new LandDestoryDao();
			List<LandDestory> list1 = dd.readLandDestory(request.getParameter("recid"));
			for(LandDestory dm:list1)
			{
		%>
    <tr>
        <th>土地破坏类型（hm2）</th>
        <td><%=dm.getDAMAGED_TYPE() %></td>
    </tr>
    <tr>
        <th>破坏耕地面积（hm2)</th>
        <td><%=dm.getPLOWLAND_AREA() %></td>
    </tr>
    <tr>
        <th>破坏林地面积（hm2）</th>
        <td><%=dm.getWOODLAND_AREA() %></td>
    </tr>
    <tr>
        <th>破坏草地面积（hm2</th>
        <td><%=dm.getGRASS_AREA() %></td>
    </tr>
    <tr>
        <th>破坏园地面积（hm2）</th>
        <td><%=dm.getGARDEN_AREA() %></td>
    </tr>
    <tr>
        <th>破坏建筑面积（hm2）</th>
        <td><%=dm.getBUILDING_AREA() %></td>
    </tr>
    <tr>
        <th>其他破坏面积（hm2）</th>
        <td><%=dm.getOTHER_AREA() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>