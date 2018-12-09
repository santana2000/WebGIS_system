<%@ page import="java.util.List" %>

<%@ page import="LandslideDao.*" %>
<%@ page import="LandslideEntity.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/5
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>滑坡信息详情表</title>
</head>
<style type = "text/css">
body{font-family:Arial, Verdana, sans-serif; color:#111111;}
table{width:600px;}
th, td{padding:7px 10px 10px 10px;
boder-bottom:2px solid #111111; border-top:1px solid #999; text-align:left;}
th{letter-spacing:0.1em;}
th.info, th.en, th.pch, th.sign, th.ach{font:30px "Microsoft New Tai Lue"}
tr:hover{background-color:#efefef;}


</style>
<body>
<form name = "uuid"  method="post">
    <input type = "text" name = "uuid" maxlength="50"/>
    <input type = "submit" value = "Go">
</form>
<br>
<h3>滑坡信息详情表</h3>
<table >
    <!-- 基本情况 -->
    <tr>
        <th colspan = "2" class="info">1.基本情况</th>
    </tr>
    <%
        BasicsituationDao bsd = new BasicsituationDao();
        List<Basicsituation> list = bsd.readbasicsituation(request.getParameter("uuid"));
        for(Basicsituation bc:list)
        {
    %>
    <tr>
        <th>所属矿山</th>
        <td><%=bc.getRECID() %></td>
    </tr>

    <tr>
        <th>是否发生</th>
        <td><%=bc.getHAPPEN_FLAG() %></td>
    </tr>
    <tr>
        <th>发生时间</th>
        <td><%=bc.getHAPPEN_DATE() %></td>
    </tr>
    <tr>
        <th>坡顶高程（m）</th>
        <td><%=bc.getTOP_EVEVATION() %></td>
    </tr>
    <tr>
        <th>坡底高程（m）</th>
        <td><%=bc.getBUTTOM_EVEVATION() %></td>
    </tr>
    <tr>
        <th>滑坡类型</th>
        <td><%=bc.getSLIDE_TYPE() %></td>
    </tr>
    <tr>
        <th>滑坡性质</th>
        <td><%=bc.getHTXZ() %></td>
    </tr>
    <tr>
        <th>监测建议</th>
        <td><%String MS = bc.getMONITOR_SUGGESTION();
            String MONITOR_SUGGEST = new ReplaceTwo().MONITOR_SUGGESTIONReplace(MS);
            out.print(MONITOR_SUGGEST);
        %></td>
    </tr>
    <tr>
        <th>防治建议</th>
        <td><%String PS = bc.getCONTROL_SUGGESTION();
            String CONTROL_SUGGESTION = new ReplaceTwo().CONTROL_SUGGESTIONReplace(PS);
            out.print(CONTROL_SUGGESTION);
        %></td>
    </tr>
    <tr>
        <th>滑坡及其隐患描述</th>
        <td><%=bc.getMEMO() %></td>
    </tr>
    <%
        }
    %>
    <!-- 滑坡环境 -->
    <tr>
        <th colspan = "2" class="en">2.滑坡环境</th>
    </tr>
    <%
        SlideenvironmentDao end = new SlideenvironmentDao();
        List<Slideenvironment> list1 = end.readSlideenvironment(request.getParameter("uuid"));
        for(Slideenvironment en:list1)
        {
    %>
    <tr>
        <th>地层时代</th>
        <td><%=en.getSTRATUM_ERA() %></td>
    </tr>

    <tr>
        <th>地层产状</th>
        <td><%=en.getSTRATUM_ATTITUDE() %></td>
    </tr>
    <tr>
        <th>地质构造部位</th>
        <td><%=en.getTECTONIC_POSITION() %></td>
    </tr>

    <tr>
        <th>微地貌</th>
        <td><%String ML = en.getMICRO_LANDFORM();
            String MICRO_LANDFORM = new ReplaceTwo().MICRO_LANDFORMReplace(ML);
            out.print(MICRO_LANDFORM);
        %></td>
    </tr>
    <tr>
        <th>地下水类型</th>
        <td><%String LUT = en.getGROUND_WATER_TYPE();
            String GROUND_WATER_TYPE = new ReplaceTwo().GROUND_WATER_TYPEReplace(LUT);
            out.print(GROUND_WATER_TYPE);
        %></td>
    </tr>
    <tr>
        <th>原始斜坡坡高(m)</th>
        <td><%=en.getORIGINAL_SLOPE_HEIGHT() %></td>
    </tr>
    <tr>
        <th>原始斜坡坡度()</th>
        <td><%=en.getORIGINAL_SLOPE_ANGLE() %></td>
    </tr>
    <tr>
        <th>原始斜坡坡形</th>
        <td><%String LT= en.getORIGINAL_SLOPE_SHAPE();
            String ORIGINAL_SLOPE_SHAPE = new ReplaceTwo().ORIGINAL_SLOPE_SHAPEReplace(LT);
            out.print(ORIGINAL_SLOPE_SHAPE);
        %></td>
    </tr>
    <%
        }
    %>

    <!-- 滑坡基本特征 -->
    <tr>
        <th colspan = "2" class="pch">3.滑坡基本特征</th>
    </tr>
    <%
       SlideFeatureDao pcd = new SlideFeatureDao();
        List<SlideFeature> list2 = pcd.readSlideFeature(request.getParameter("uuid"));
        for(SlideFeature pc:list2)
        {
    %>
    <tr>
        <th>滑坡长度（m）</th>
        <td><%=pc.getSLIDE_LENGTH() %></td>
    </tr>
    <tr>
        <th>滑坡宽度(m)</th>
        <td><%=pc.getSLIDE_WIDTH() %></td>
    </tr>
    <tr>
        <th>滑坡厚度(m)</th>
        <td><%=pc.getSLIDE_THICKNESS() %></td>
    </tr>
    <tr>
        <th>滑坡面积(m2)</th>
        <td><%=pc.getSLIDE_AREA() %></td>
    </tr>
    <tr>
        <th>滑坡体积(m3)</th>
        <td><%=pc.getSLIDE_VOLUME() %></td>
    </tr>
    <tr>
        <th>体积（m³）</th>
        <td><%=pc.getSLIDE_VOLUME() %></td>
    </tr>
    <tr>
        <th>规模等级</th>
        <td><%String SL = pc.getSLIDE_LEVEL();
            String SCALE_LEVEL = new ReplaceTwo().SLIDE_LEVELReplace(SL);
            out.print(SCALE_LEVEL);
        %></td>
    </tr>
    <tr>
        <th>坡度（°）</th>
        <td><%=pc.getSLIDE_GRADIENT() %></td>
    </tr>
    <tr>
        <th>坡向（°）</th>
        <td><%=pc.getSLIDE_ASPECT() %></td>
    </tr>
    <tr>
        <th>平面形态</th>
        <td><%String RTT = pc.getPLANE_FORM();
            String PLANE_FORM = new ReplaceTwo().PLANE_FORMReplace(RTT);
            out.print(PLANE_FORM);
        %></td>
    </tr>

    <tr>
        <th>滑体岩性</th>
        <td><%=pc.getSLIPEMASS_LITHOLOGY() %></td>
    </tr>

    <tr>
        <th>滑体结构</th>
        <td><%String RIT = pc.getSLIPEMASS_STRUCTURE();
            String SLIPEMASS_STRUCTURE = new ReplaceTwo().SLIPEMASS_STRUCTUREReplace(RIT);
            out.print(SLIPEMASS_STRUCTURE);
        %></td>
    </tr>
    <tr>
        <th>滑体碎石含量（%）</th>
        <td><%=pc.getSLIDEMASS_GRAVEL_CONTENT() %></td>
    </tr>
    <tr>
        <th>滑体块度类型</th>
        <td><%String IT = pc.getSLIDEMASS_LUMPINESS_TYPE();
                                                             //SLIDEMASS_LUMPINESS_TYPEReplace
            String SLIDEMASS_LUMPINESS_TYPE = new ReplaceTwo().SLIDEMASS_LUMPINESS_TYPEReplace(IT);
            out.print(SLIDEMASS_LUMPINESS_TYPE);
        %></td>
    </tr>

    <tr>
        <th>滑床岩性</th>
        <td><%=pc.getSLIPPERY_LITHOLOGY() %></td>
    </tr>
    <tr>
        <th>滑床时代</th>
        <td><%=pc.getSLIPPERY_ERA() %></td>
    </tr>
    <tr>
         <th>滑床产状</th>
         <td><%=pc.getSLIPPERY_ATTITUDE() %></td>
    </tr>

    <tr>
        <th>滑面形态</th>
        <td><%String SIT = pc.getSLIDEFACE_FORM();
            String SLIDEFACE_FORM= new ReplaceTwo().SLIDEFACE_FORMReplace(SIT);
            out.print(SLIDEFACE_FORM);
        %>
        </td>

    <tr>
        <th>滑面埋深(m)</th>
        <td><%=pc.getSLIDEFACE_DEPTH() %></td>
    </tr>
    <tr>
        <th>滑面倾向()</th>
        <td><%=pc.getSLIDEFACE_TENDENCY() %></td>
    </tr>
    <tr>
        <th>滑面倾角()</th>
        <td><%=pc.getSLIDEFACE_ANGLE() %></td>
    </tr>
    <tr>
        <th>滑带厚度(m)</th>
        <td><%=pc.getSLIDEZONE_THICKNESS() %></td>
    </tr>

    <tr>
        <th>滑带土名称</th>
        <td><%String SRT = pc.getSLIDEZONE_NAME();
            String SLIDEZONE_NAME= new ReplaceTwo().SLIDEZONE_NAMEReplace(SRT);
            out.print(SLIDEZONE_NAME);
        %>
        </td>
    </tr>

    <tr>
        <th>滑带土性状</th>
        <td><%=pc.getSLIDEZONE_PROERTY() %></td>
    </tr>

    <tr>
        <th>土地利用</th>
        <td><%String SOT = pc.getLAND_USE();
            String LAND_USE= new ReplaceTwo().LAND_USEReplace(SOT);
            out.print(LAND_USE);
        %>
        </td>
    </tr>
    <%
        }
    %>

    <!-- 滑坡基本特征 -->
    <tr>
        <th colspan = "2" class="sign">4.变形活动特征</th>
    </tr>
    <%
        ChangeOneDao pad = new  ChangeOneDao();
        List<ChangeOne> list3 = pad.readChangeOne(request.getParameter("uuid"));
        for(ChangeOne po:list3)
        {
    %>
    <tr>
        <th>现今变形迹象名称</th>
        <td><%String ST = po.getDEFORMATION_TYPE();
            String DEFORMATION_TYPE= new ReplaceTwo().DEFORMATION_TYPEReplace(Integer.parseInt(ST));
            out.print(DEFORMATION_TYPE);
        %>
        </td>
    </tr>
    <tr>
        <th>现今变形迹象部位</th>
        <td><%=po.getDEFORMATION_POSITION() %></td>
    </tr>
    <tr>
        <th>现今变形迹象特征</th>
        <td><%=po.getDEFORMATION_FEATURE() %></td>
    </tr>
    <tr>
        <th>现今变形迹象初现时间</th>
        <td><%=po.getHAPPEN_DATE() %></td>
    </tr>
    <%
        }
    %>
    <%
        ChangeTwoDao pa = new  ChangeTwoDao();
        List<ChangeTwo> list4 = pa.readChangeTwo(request.getParameter("recid"));
        for(ChangeTwo pm:list4)
        {
    %>
    <tr>
        <th>变形活动阶段</th>
        <td><%String ST = pm.getACTIVITY_STAGE();
            String ACTIVITY_STAGE= new ReplaceTwo().ACTIVITY_STAGEReplace(ST);
            out.print(ACTIVITY_STAGE);
        %>
        </td>
    </tr>
    <tr>
        <th>目前稳定程度</th>
        <td><%String SD = pm.getPRESENT_STATE();
            String STABLE_DEGREE = new ReplaceTwo().PRESENT_STATEReplace(SD);
            out.print(STABLE_DEGREE);
        %></td>
    </tr>
    <tr>
        <th>今后变化趋势</th>
        <td><%String VT = pm.getTREND();
            String TREND = new ReplaceTwo().TRENDReplace(VT);
            out.print(TREND);
        %></td>
    </tr>
    <%
        }
    %>
    <!-- 滑坡危害 -->
    <tr>
        <th colspan = "2" class="ach">5.滑坡危害</th>
    </tr>
    <%
        SlideDamageDao dd = new SlideDamageDao();
        List<SlideDamage> list5 = dd.readDamage(request.getParameter("uuid"));
        for(SlideDamage dm:list5)
        {
    %>
    <tr>
        <th>死亡人数</th>
        <td><%=dm.getDEAD_NUBER() %></td>
    </tr>
    <tr>
        <th>毁坏房屋</th>
        <td><%=dm.getDESTROY_HOUSE() %></td>
    </tr>
    <tr>
        <th>毁路（m）</th>
        <td><%=dm.getDESTROY_ROAD() %></td>
    </tr>
    <tr>
        <th>毁渠（m）</th>
        <td><%=dm.getDESTROY_CANAL() %></td>
    </tr>
    <tr>
        <th>其他危害</th>
        <td><%=dm.getDESTROY_OTHER() %></td>
    </tr>
    <tr>
        <th>直接损失（万元）</th>
        <td><%=dm.getDIRECT_LOSS() %></td>
    </tr>
    <tr>
        <th>间接损失（万元）</th>
        <td><%=dm.getINDIRECT_LOSS() %></td>
    </tr>
    <tr>
        <th>灾情等级</th>
        <td><%String DL = dm.getDISASTER_LEVEL();
            String DISASTER_LEVEL = new ReplaceTwo().DLReplace(DL);
            out.print(DISASTER_LEVEL);
        %></td>
    </tr>
    <tr>
        <th>危害对象</th>
        <td><%String HO = dm.getDAMAGE_OBJECT();
            String DAMAGE_OBJECT = new ReplaceTwo().HOReplace(HO);
            out.print(DAMAGE_OBJECT);
        %></td>
    </tr>
    <tr>
        <th>威胁人数</th>
        <td><%=dm.getTHREATEN_PEOPLE() %></td>
    </tr>
    <tr>
        <th>威胁财产</th>
        <td><%=dm.getTHREATEN_PROPERTY() %></td>
    </tr>
    <tr>
        <th>险情等级</th>
        <td><%String DLe = dm.getDANGER_LEVEL();
            String DANGER_LEVEL = new ReplaceTwo().DLevelReplace(DLe);
            out.print(DANGER_LEVEL);
        %></td>
    </tr>
    <tr>
        <th>威胁对象</th>
        <td><%String TO = dm.getTHREATEN_OBJECT();
            String THREATEN_OBJECT = new ReplaceTwo().TOReplace(TO);
            out.print(THREATEN_OBJECT);
        %></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
