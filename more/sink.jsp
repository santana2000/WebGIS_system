<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/7
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import = "sinkDao.*, sinkEntity.*" %>
<%@ page import="java.util.List"%>
<%@ page import="sinkDao.Repalce" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>地面塌陷信息详情表</title>
</head>
<style type = "text/css">
    body{font-family:Arial, Verdana, sans-serif; color:#111111;}
    table{width:600px;}
    th, td{padding:7px 10px 10px 10px;
        boder-bottom:2px solid #111111; border-top:1px solid #999; text-align:left;}
    th{letter-spacing:0.1em;}
    th.info, th.pit, th.area, th.single, th.slits, th.geofea, th.sinkdamage,th.mudslide{font:30px "Microsoft New Tai Lue"}
    tr:hover{background-color:#efefef;}


</style>
<body>
<form name = "uuid"  method="post">
    <input type = "text" name = "uuid" maxlength="50"/>
    <input type = "submit" value = "Go">
</form>
<br>
<h3>地面塌陷信息详情表</h3>
<table >
    <!-- 基本情况 -->
    <tr>
        <th colspan = "2" class="info">1.基本情况</th>
    </tr>
    <%
        BaseSituationDao bsd = new BaseSituationDao();
        List<BaseSituation> list = bsd.readBaseSituation(request.getParameter("uuid"));
        for(BaseSituation bs:list)
        {
    %>
    <tr>
        <th>所属矿山</th>
        <td><%=bs.getRECID() %></td>
    </tr>

    <tr>
        <th>塌陷地裂缝类型</th>
        <td><%String txd = bs.getTXDLFXZ();
            String TXDLFXZ = new Repalce().TXDReplace(txd);
            out.print(TXDLFXZ);%></td>
    </tr>
    <tr>
        <th>已采取治理措施</th>
        <td><%=bs.getMANAGE_MEASURE()%></td>
    </tr>
    <tr>
        <th>治理投入费用（万元）</th>
        <td><%=bs.getMANAGE_COST()%></td>
    </tr>
    <tr>
        <th>治理投入来源</th>
        <td><%=bs.getCOST_SOURCE()%></td>
    </tr>
    <tr>
        <th>治理面积（公顷）</th>
        <td><%=bs.getMANAGE_AREA()%></td>
    </tr>
    <tr>
        <th>防治措施</th>
        <td><%=bs.getCONTROL_MEASURE()%></td>
    </tr>
    <tr>
        <th>防治投入</th>
        <td><%=bs.getCONTROL_COST()%></td>
    </tr>
    <tr>
        <th>防治面积</th>
        <td><%=bs.getCONTROL_AREA()%></td>
    </tr>

    <%
        }
    %>

    <!-- 塌陷区 -->
    <tr>
        <th colspan = "2" class="area">2.塌陷区</th>
    </tr>
    <%
        SinkAreaDao sad = new SinkAreaDao();
        List<SinkArea> list1 = sad.readSinkArea(request.getParameter("uuid"));
        for(SinkArea sa:list1)
        {
    %>
    <tr>
        <th>塌陷坑数量</th>
        <td><%=sa.getPIT_NUMBER() %></td>
    </tr>
    <tr>
        <th>分布面积(k㎡)</th>
        <td><%=sa.getSINK_AREA() %></td>
    </tr>
    <tr>
        <th>排列形式</th>
        <td><%String sl = sa.getSINK_LAYOUT();
            String SINK_LAYOUT = new Repalce().SLReplace(sl);
        out.print(SINK_LAYOUT);
        %></td>
    </tr>
    <tr>
        <th>长列方向</th>
        <td><%=sa.getDIRECTION() %></td>
    </tr>
    <tr>
        <th>始发时间</th>
        <td><%=sa.getSTART_DATE() %></td>
    </tr>
    <tr>
        <th>盛发开始时间</th>
        <td><%=sa.getBLOOM_START_DATE() %></td>
    </tr>
    <tr>
        <th>盛发截止时间</th>
        <td>
            <%--<%String bed = sa.getBLOOM_END_DATE();--%>
              <%--String BLOOM_END_DATE = new Repalce().BEDReplace(bed);--%>
              <%--out.print(BLOOM_END_DATE);%>--%>
        </td>
    </tr>
    <tr>
        <th>停止时间</th>
        <td><%=sa.getEND_DATE() %></td>
    </tr>
    <tr>
        <th>发展变化</th>
        <td><%String dc  = sa.getDEVELOP_CHANGE();
              String DEVELOP_CHANGE = new Repalce().DCReplace(dc);
              out.print(DEVELOP_CHANGE);%></td>
    </tr>

    <%
        }
    %>
    <!-- 单坑特征 -->
    <tr>
        <th colspan = "2" class="pit">3.单坑特征</th>
    </tr>
    <%
        SinkPitDao spd = new SinkPitDao();
        List<SinkPit> list2 = spd.readSinkPit(request.getParameter("uuid"));
        for(SinkPit sp:list2)
        {
    %>

    <tr>
        <th>单坑长轴(m)</th>
        <td><%=sp.getLONG_AXIS()%></td>
    </tr>
    <tr>
        <th>单坑短轴(m)</th>
        <td><%=sp.getMINOR_AXIS()%></td>
    </tr>
    <tr>
        <th>单坑深度(m)</th>
        <td><%=sp.getDEPTH()%></td>
    </tr>
    <tr>
        <th>单坑面积(㎡)</th>
        <td><%=sp.getAREA()%></td>
    </tr>
    <tr>
        <th>单坑形状</th>
        <td><%String shape = sp.getSHAPE();
              String SHAPE = new Repalce().SHAPEReplace(shape);
              out.print(SHAPE);%></td>
    </tr>
    <%
        }
    %>

    <!-- 伴生裂缝 -->
    <tr>
        <th colspan = "2" class="slits">4.伴生裂缝</th>
    </tr>
    <%
        SlitsChDao ptd = new SlitsChDao();
        List<SlitsCh> list3 = ptd.readSlitsCh(request.getParameter("uuid"));
        for(SlitsCh sc:list3)
        {
    %>
    <tr>
        <th>群裂缝数</th>
        <td><%=sc.getFISSURE_NUMBER() %></td>
    </tr>
    <tr>
        <th>裂缝分布面积(k㎡)</th>
        <td><%=sc.getFISSURE_AREA() %></td>
    </tr>
    <tr>
        <th>裂缝间距（m）</th>
        <td><%=sc.getFISSURE_GAP() %></td>
    </tr>
    <tr>
        <th>裂缝排列形式</th>
        <td><%String fa = sc.getFISSURE_ARRANGE();
              String FISSURE_ARRANGE = new Repalce().FAReplace(fa);
              out.print(FISSURE_ARRANGE);%></td>
    </tr>
    <tr>
        <th>主要展布方位</th>
        <td><%=sc.getSPREAD_DIRECTION() %></td>
    </tr>
    <tr>
        <th>阶步指向</th>
        <td><%=sc.getSTEP_DIRECTION() %></td>
    </tr>

    <%
        }
    %>


    <!-- 单缝特征 -->
    <tr>
        <th colspan = "2" class="single">5.单缝特征</th>
    </tr>
    <%
       SingleSlitChDao dao = new SingleSlitChDao();
        List<SingleSlitCh> list4 = dao.readSingleSlitCh(request.getParameter("uuid"));
        for(SingleSlitCh ssc:list4)
        {
    %>
    <tr>
        <th>单缝形态</th>
        <td><%int form = ssc.getFORM();
              String FORM = new Repalce().FORMReplace(form);
              out.print(FORM);
           %>
    </tr>
    <tr>
        <th>延伸方向</th>
        <td><%=ssc.getDERECTION() %></td>
    </tr>
    <tr>
        <th>倾向(°)</th>
        <td><%=ssc.getTENDENCY() %></td>
    </tr>
    <tr>
        <th>倾角(°)</th>
        <td><%=ssc.getANGLE() %></td>
    </tr>
    <tr>
        <th>长度(m)</th>
        <td><%=ssc.getLENGTH() %></td>
    </tr>
    <tr>
        <th>宽度(m)</th>
        <td><%=ssc.getWIDTH() %></td>
    </tr>
    <tr>
        <th>深度(m)</th>
        <td><%=ssc.getDEPTH() %></td>
    </tr>
    <tr>
        <th>性质</th>
        <td><%int pro = ssc.getPROPERTY();
              String PROPERTY = new Repalce().PROPERTYReplace(pro);
              out.print(PROPERTY);%></td>
    </tr>
    <%
        }
    %>

    <!-- 地貌特征 -->
    <tr>
        <th colspan = "2" class="geofea">6.地貌特征</th>
    </tr>
    <%
        GeoFeatureDao dd = new GeoFeatureDao();
        List<GeoFeature> list5 = dd.readGeoFeature(request.getParameter("uuid"));
        for(GeoFeature gf:list5)
        {
    %>
    <tr>
        <th>地貌区类型</th>
        <td><%String lt = gf.getLANDFORM_TYPE();
              String LANDFORM_TYPE = new Repalce().LTReplace(lt);
              out.print(LANDFORM_TYPE);%></td>
    </tr>
    <tr>
        <th>土层时代</th>
        <td><%=gf.getSOIL_ERA() %></td>
    </tr>
    <tr>
        <th>土层土性</th>
        <td><%=gf.getSOIL_PROPERTY() %></td>
    </tr>
    <tr>
        <th>土层厚度（m）</th>
        <td><%=gf.getSOIL_THICKNESS() %></td>
    </tr>
    <tr>
        <th>岩层时代</th>
        <td><%=gf.getROCK_ERA() %></td>
    </tr>
    <tr>
        <th>岩层土性</th>
        <td><%=gf.getROCK_PROPERTY() %></td>
    </tr>
    <tr>
        <th>岩层厚度(m)</th>
        <td><%=gf.getROCK_THICKNESS() %></td>
    </tr>
    <%
        }
    %>
    <!-- 地面塌陷危害 -->
    <tr>
        <th colspan = "2" class="sinkdamage">7.地面塌陷危害</th>
    </tr>
    <%
        SinkDamageDao sdd = new SinkDamageDao();
        List<SinkDamage> list6 = sdd.readSinkDamage(request.getParameter("uuid"));
        for(SinkDamage sd:list6)
        {
    %>

    <tr>
        <th>破坏农田（亩）</th>
        <td><%=sd.getDESTROY_FARM()%></td>
    </tr>
    <tr>
        <th>损毁房间数（间）</th>
        <td><%=sd.getDESTRORY_HOUSE()%></td>
    </tr>
    <tr>
        <th>人员伤亡数（人）</th>
        <td><%=sd.getDEAD_NUMBER()%></td>
    </tr>
    <tr>
        <th>阻断交通类型</th>
        <td><%String tt = sd.getTRAFFIC_TYPE();
              String TRAFFIC_TYPE = new Repalce().TTReplace(tt);
              out.print(TRAFFIC_TYPE);%></td>
    </tr>
    <tr>
        <th>直接经济损失</th>
        <td><%=sd.getDIRECT_LOSS()%></td>
    </tr>
    <tr>
        <th>危害河流原流量(m³/S)</th>
        <td><%=sd.getRIVER_FLOW_ORGINAL()%></td>
    </tr>
    <tr>
        <th>危害河流现流量(m³/S)</th>
        <td><%=sd.getRIVER_FLOW_PRESENT()%></td>
    </tr>
    <tr>
        <th>河流量状态</th>
        <td><%String rfs = sd.getRIVER_FLOW_STATE();
              String RIVER_FLOW_STATE = new Repalce().RFSReplace(rfs);
              out.print(RIVER_FLOW_STATE);%></td>
    </tr>
    <tr>
        <th>危害泉现流量(m³/S)</th>
        <td><%=sd.getSPRING_FLOW_PRESENT()%></td>
    </tr>
    <tr>
        <th>泉流量变化</th>
        <td><%String SPRING_FLOW_CHANGE = new Repalce().SFCSReplace(sd.getSPRING_FLOW_CHANGE());
              out.print(SPRING_FLOW_CHANGE);%></td>
    </tr>
    <tr>
        <th>井水水位状态</th>
        <td><%out.print(new Repalce().WSSReplace(sd.getWELL_STATE()));%></td>
    </tr>
    <tr>
        <th>井水水位下降高度(m)</th>
        <td><%=sd.getWELL_FALL_HEIGHT()%></td>
    </tr>
    <tr>
        <th>井水干枯时间</th>
        <td><%=sd.getWELL_DRIED_DATE()%></td>
    </tr>
    <tr>
        <th>危害主要植物</th>
        <td><%=sd.getPLANT()%></td>
    </tr>
    <tr>
        <th>植物生长状况</th>
        <td><%out.print(new Repalce().PSReplace(sd.getPLANT_STATE()));%></td>
    </tr>
    <tr>
        <th>潜在威胁人数（人）</th>
        <td><%=sd.getTHREATEN_POPULATION()%></td>
    </tr>
    <tr>
        <th>潜在威胁财产（万元）</th>
        <td><%=sd.getTHREATEN_PROPERTY()%></td>
    </tr>
    <tr>
        <th>潜在威胁田地（亩）</th>
        <td><%=sd.getTHREATEN_FARM()%></td>
    </tr>
    <tr>
        <th>潜在威胁房屋（间）</th>
        <td><%=sd.getTHREATEN_HOUSE()%></td>
    </tr>
    <tr>
        <th>潜在威胁对象</th>
        <td><%out.print(new Repalce().TOReplace(sd.getTHREAEN_OBJECT()));%></td>
    </tr>
    <%
        }
    %>

</table>

</body>
</html>
