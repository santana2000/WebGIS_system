<%@ page import="WaterDao.WaterbaceDao" %>
<%@ page import="WaterEntity.Waterbace" %>
<%@ page import="java.util.List" %>
<%@ page import="WaterDao.Replace" %>
<%@ page import="WaterDao.WaterTwoDao" %>
<%@ page import="WaterEntity.WaterTwo" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>矿区地下含水层信息详情表</title>
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
<h3>矿区地下含水层信息详情表</h3>
<table >
    <!-- 基本情况 -->
    <tr>
        <th colspan = "2" class="info">1.基本情况</th>
    </tr>
        <%
        WaterbaceDao bsd = new WaterbaceDao();
        List<Waterbace> list = bsd.readWaterbace(request.getParameter("recid"));

        for(Waterbace po:list)
        {
    %>
    <tr>
        <th>所属矿山</th>
        <td><%=po.getRECID() %></td>
    </tr>

    <tr>
        <th>矿床水文地质类型</th>
        <td><%String MS = po.getHYDROGEOLOLGY_TYPE();
            String HYDROGEOLOLGY_TYPE = new Replace().HYDROGEOLOLGY_TYPEReplace(MS);
            out.print(HYDROGEOLOLGY_TYPE);
        %></td>
    </tr>
    <tr>
        <th>采矿活动影响的含水层类型</th>
        <td><%String MIS = po.getAQUIFER_TYPE();
            String AQUIFER_TYPE = new Replace().AQUIFER_TYPEReplace(MIS);
            out.print(AQUIFER_TYPE);
        %></td>
    </tr>
    <tr>
        <th>矿坑排水量（万吨/年）</th>
        <td><%=po.getPIT_TONAGE() %></td>
    </tr>
    <tr>
        <th>最低排水点高程（米）</th>
        <td><%=po.getPIT_DRAIN_ELEVATION() %></td>
    </tr>
    <tr>
        <th>地下水下降区面积（公顷）</th>
        <td><%=po.getWATER_DROP_AREA() %></td>
    </tr>
    <tr>
        <th>矿坑水来源</th>
        <td><%String IS = po.getPIT_WATER_SOURCE();
            String PIT_WATER_SOURCE = new Replace().PIT_WATER_SOURCEReplace(IS);
            out.print(PIT_WATER_SOURCE);
        %></td>
    </tr>
    <tr>
        <th>矿坑充水途径</th>
        <td><%String PIS = po.getPIT_WATER_APPROACH();
            String PIT_WATER_APPROACH = new Replace().PIT_WATER_APPROACHReplace(PIS);
            out.print(PIT_WATER_APPROACH);
        %></td>
    </tr>
    <tr>
        <th>周边井泉水位变化</th>
        <td><%String LIS = po.getWELL_CHANGE_TYPE();
            String WELL_CHANGE_TYPE = new Replace().WELL_CHANGE_TYPEReplace(LIS);
            out.print(WELL_CHANGE_TYPE);
        %></td>
    </tr>
    <tr>
        <th>周边井泉水位下降幅度（m）</th>
        <td><%=po.getDROP_RANGE() %></td>
    </tr>
    <tr>
        <th>周边井泉流量减少幅度（m3/s）</th>
        <td><%=po.getDECREASE_REANGE() %></td>
    </tr>
    <tr>
        <th>地下水主要污染物</th>
        <td><%=po.getDXSZYWRW() %></td>
    </tr>
    <tr>
        <th>超标倍数</th>
        <td><%=po.getCBBS() %></td>
    </tr>
    <tr>
        <th>污染范围（公顷）</th>
        <td><%=po.getWRFW() %></td>
    </tr>
    <tr>
        <th>地下水监测点数量</th>
        <td><%=po.getMONITOR_NUMBER() %></td>
    </tr>
    <tr>
        <th>地下水监测内容</th>
        <td><%=po.getMONITOR_CONTENT() %></td>
    </tr>
    <tr>
        <th>地下水监测层位</th>
        <td><%=po.getPREVENT_GRADATION() %></td>
    </tr>
    <tr>
        <th>监测频率</th>
        <td><%=po.getMONITOR_RATE() %></td>
    </tr>
    <tr>
        <th>监测结果</th>
        <td><%=po.getMONITOR_RESULT() %></td>
    </tr>
        <%
        }
    %>
    <!-- 受影响的含水岩组 -->
    <tr>
        <th colspan = "2" class="en">2.受影响的含水岩组</th>
    </tr>
        <%
        WaterTwoDao end = new WaterTwoDao();
        List<WaterTwo> list1 = end.readWaterTwo(request.getParameter("recid"));
        for(WaterTwo po:list1)
        {
    %>
    <tr>
        <th>含水岩组名称</th>
        <td><%=po.getFEATURE_NAME() %></td>
    </tr>
    <tr>
        <th>岩性</th>
        <td><%=po.getLITHOLOGY() %></td>
    </tr>
    <tr>
        <th>厚度</th>
        <td><%=po.getTHICKNESS() %></td>
    </tr>
    <tr>
        <th>埋深</th>
        <td><%=po.getBURIAL_DEPTH() %></td>
    </tr>
    <tr>
        <th>富水性</th>
        <td><%=po.getWATERY() %></td>
    </tr>
    <tr>
        <th>渗透系数</th>
        <td><%=po.getOSMOTIC_COEFFICIENT() %></td>
    </tr>
    <tr>
        <th>矿化度</th>
        <td><%=po.getMINERALIZATION() %></td>
    </tr>
    <tr>
        <th>水化学类型</th>
        <td><%=po.getWATER_TYPE() %></td>
    </tr>
    <tr>
        <th>采矿活动影响方式</th>
        <td><% String dtb = po.getEFFECT_METHOD();
            String EFFECT_METHOD = new Replace().EFFECT_METHODReplace(Integer.parseInt(dtb));
            out.print(EFFECT_METHOD);
        %>
        </td>
    </tr>
    <tr>
        <th>影响结构</th>
        <td><% String MLT = po.getSTRUCTURE();
            String STRUCTURE = new Replace().STRUCTUREReplace(Integer.parseInt(MLT));
            out.print(STRUCTURE);
        %></td>
    </tr>
    <tr>
        <th>水位变化</th>
        <td><% String MLA = po.getWETER_LEVEL_TYPE();
            String WETER_LEVEL_TYPE = new Replace().WETER_LEVEL_TYPEReplace(Integer.parseInt(MLT));
            out.print(WETER_LEVEL_TYPE);
        %></td>
    </tr>
    <tr>
        <th>水位变化幅度</th>
        <td><%=po.getWETER_LEVEL() %></td>
    </tr>
    <tr>
        <th>水质</th>
        <td><% String VN = po.getWATER_QUALITY();
            String WATER_QUALITY = new Replace().WATER_QUALITYReplace(Integer.parseInt(VN));
            out.print(WATER_QUALITY);
        %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
