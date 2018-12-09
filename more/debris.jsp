<%@ page import="java.util.List" %>
<%@ page import="LanddebrisDao.*" %>
<%@ page import="LanddebrisEntity.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/5
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>泥石流信息详情表</title>
</head>

<style type = "text/css">
    body{font-family:Arial, Verdana, sans-serif; color:#111111;}
    table{width:600px;}
    th, td{padding:7px 10px 10px 10px;
        boder-bottom:2px solid #111111; border-top:1px solid #999; text-align:left;}
    th{letter-spacing:0.1em;}
    th.info, th.en, th.pch, th.sign, th.ach, th.dam{font:30px "Microsoft New Tai Lue"}
    tr:hover{background-color:#efefef;}
</style>

<body>
<form name = "uuid"  method="post">
    <input type = "text" name = "uuid" maxlength="50"/>
    <input type = "submit" value = "Go">
</form>
    <br>
    <h3>泥石流信息详情表</h3>
<table >
        <!-- 基本情况 -->
        <tr>
            <th colspan = "2" class="info">1.基本情况</th>
        </tr>
        <%
            BasicDao bsd = new BasicDao();
            List<Basic> list = bsd.readBasic(request.getParameter("uuid"));
            for(Basic bs:list)
            {
        %>
        <tr>
            <th>所属矿山</th>
            <td><%=bs.getRECID() %></td>
        </tr>
        <tr>
            <th>是否发生</th>
            <td><%=bs.getHAPPEN_DATE() %></td>
        </tr>
        <tr>
            <th>发生时间</th>
            <td><%=bs.getHAPPEN_DATE() %></td>
        </tr>
        <tr>
            <th>高程（m）</th>
            <td><%=bs.getEVEVATION() %></td>
        </tr>
        <tr>
            <th>水动力类型</th>
            <td><%=bs.getWATER_POWER_TYPE() %></td>
        </tr>
        <tr>
            <th>沟口巨石A（m）</th>
            <td><%=bs.getROCK_A() %></td>
        </tr>
        tr>
        <th>沟口巨石A（m）</th>
        <td><%=bs.getROCK_B() %></td>
        </tr>
        tr>
        <th>沟口巨石A（m）</th>
        <td><%=bs.getROCK_C() %></td>
        </tr>
        <tr>
            <th>补给途径</th>
            <td><%String MI = bs.getSUPPLY_APPROACH();
                String SUPPLY_APPROACH = new Replace().SUPPLY_APPROACHReplace(MI);
                out.print(SUPPLY_APPROACH);
            %></td>
        </tr>
        <tr>
            <th>补给区位置</th>
            <td><%String PI = bs.getSUPPLY_POSITION();
                String SUPPLY_POSITION = new Replace().SUPPLY_POSITIONReplace(PI);
                out.print(SUPPLY_POSITION);
            %></td>
        </tr>
        <tr>
            <th>监测措施</th>
            <td><%String MS = bs.getMONITOR_MEASURES();
                String MONITOR_MEASURES = new Replace().MONITOR_MEASURESReplace(MS);
                out.print(MONITOR_MEASURES);
            %></td>
        </tr>
        <tr>
            <th>防治措施</th>
            <td><%String PS = bs.getCONTROL_MEASURES();
                String CONTROL_MEASURES = new Replace().CONTROL_MEASURESReplace(PS);
                out.print(CONTROL_MEASURES);
            %></td>
        </tr>
        <tr>
            <th>监测建议</th>
            <td><%String MSI = bs.getMONITOR_SUGGEST();
                String MONITOR_SUGGEST = new Replace().MONITOR_SUGGESTIONReplace(MSI);
                out.print(MONITOR_SUGGEST);
            %></td>
        </tr>
        <tr>
            <th>防治建议</th>
            <td><%String PSI = bs.getPREVENTION_SUGGEST();
                String PREVENTION_SUGGEST = new Replace().PREVENTION_SUGGESTIONReplace(PSI);
                out.print(PREVENTION_SUGGEST);
            %></td>
        </tr>
        <%
            }
        %>

        <!-- 沟口扇形地特征 -->
        <tr>
            <th colspan = "2" class="en">2.沟口扇形地特征</th>
        </tr>
        <%
            GouFeatureDao sad = new GouFeatureDao();
            List<GouFeature> list1 = sad.readGouFeature(request.getParameter("uuid"));
            for(GouFeature sa:list1)
            {
        %>
        <tr>
            <th>扇形地完整性(%)</th>
            <td><%=sa.getFAN_INTEGRITY() %></td>
        </tr>
        <tr>
            <th>扇面冲淤变幅</th>
            <td><%=sa.getFAN_AMPLITUDE() %></td>
        </tr>

        <tr>
            <th>发展趋势</th>
            <td><%String PSI = sa.getFAN_TENDENCY();
                String FAN_TENDENCY = new Replace().FAN_TENDENCYReplace(PSI);
                out.print(FAN_TENDENCY);
            %></td>
        </tr>

        <tr>
            <th>扇长(m)</th>
            <td><%=sa.getFAN_LENGTH() %></td>
        </tr>
        <tr>
            <th>扇宽(m)</th>
            <td><%=sa.getFAN_WIDTH() %></td>
        </tr>
        <tr>
            <th>扩散角(°)</th>
            <td><%=sa.getFAN_ANGLE() %></td>
        </tr>

        <tr>
            <th>挤压大河</th>
            <td><%String PI = sa.getFAN_RIVER_TYPE();
                String FAN_RIVER_TYPE = new Replace().FAN_RIVER_TYPEReplace(PI);
                out.print(FAN_RIVER_TYPE);
            %></td>
        </tr>
        <%
            }
        %>
        <!-- 泥石流环境 -->
        <tr>
            <th colspan = "2" class="pch">3.泥石流环境</th>
        </tr>
        <%
            DebrisEnvironmentDao end = new DebrisEnvironmentDao();
            List<DebrisEnvironment> list2 = end.readDebrisEnvironment(request.getParameter("uuid"));
            for(DebrisEnvironment en:list2)
            {
        %>
        <tr>
            <th>地质构造</th>
            <td><%String PI = en.getGEOLOGY_STRUCTURE();
                String GEOLOGY_STRUCTURE = new Replace().GEOLOGY_STRUCTUREReplace(PI);
                out.print(GEOLOGY_STRUCTURE);
            %></td>
        </tr>
        <tr>
            <th>地震烈度</th>
            <td><%=en.getEARTHQUAKE_INTENSITY() %></td>
        </tr>
        <tr>
            <th>不良地质体类型</th>
            <td><%String PIO = en.getGEOLOGICAL_TYPE();
                String GEOLOGICAL_TYPE = new Replace().GEOLOGICAL_TYPEReplace(PIO);
                out.print(GEOLOGICAL_TYPE);
            %></td>
        </tr>
        <tr>
            <th>不良地质体活动程度</th>
            <td><%String PIA = en.getLEVEL1();
                String LEVEL1 = new Replace().LEVEL1Replace(PIA);
                out.print(LEVEL1);
            %></td>
        </tr>
        <tr>
            <th>规模</th>
            <td><%String PIB = en.getSCALE();
                String SCALE = new Replace().SCALEReplace(PIB);
                out.print(SCALE);
            %></td>
        </tr>
        <tr>
            <th>土地利用</th>
            <td><%String PIC = en.getLAND_USE_TYPE();
                String LAND_USE_TYPE = new Replace().LAND_USE_TYPEReplace(PIC);
                out.print(LAND_USE_TYPE);
            %></td>
        </tr>
        <%
            }
        %>

        <!-- 泥石特征 -->
        <tr>
            <th colspan = "2" class="sign">4.泥石特征</th>
        </tr>
        <%
            DebrisFeatureDao pcd = new DebrisFeatureDao();
            List<DebrisFeature> list3 = pcd.readDebrisFeature(request.getParameter("uuid"));
            for(DebrisFeature pc:list3)
            {
        %>
        <tr>
            <th>暴发频率(次/年)</th>
            <td><%=pc.getBURST_FREQUENCY() %></td>
        </tr>
        <tr>
            <th>泥石流类型</th>
            <td><%String PIC = pc.getDEBRIS_TYPE();
                String DEBRIS_TYPE = new Replace().DEBRIS_TYPEReplace(PIC);
                out.print(DEBRIS_TYPE);
            %></td>
        </tr>
        <tr>
            <th>冲出方量(m3)</th>
            <td><%=pc.getMUD_QUANTITY() %></td>
        </tr>
        <tr>
            <th>规模等级</th>
            <td><%String PI = pc.getDEBRIS_LEVEL();
                String DEBRIS_LEVEL = new Replace().DEBRIS_LEVELReplace(PI);
                out.print(DEBRIS_LEVEL);
            %></td>
        </tr>
        <tr>
            <th>泥位(m)</th>
            <td><%=pc.getMUD_A() %></td>
        </tr>
        <%
            }
        %>

        <!-- 泥石流综合评判 -->
        <tr>
            <th colspan = "2" class="ach">5.泥石流综合评判</th>
        </tr>
        <%
            ScoreDao pid = new ScoreDao();
            List<Score> list4 = pid.readScore(request.getParameter("uuid"));
            for(Score pc:list4)
            {
        %>
        <tr>
            <th>不良地质现象</th>
            <td><%String PI = pc.getHARMFUL_GEOLOGY_LEVEL();
                String HARMFUL_GEOLOGY_LEVEL = new Replace().HARMFUL_GEOLOGY_LEVELReplace(PI);
                out.print(HARMFUL_GEOLOGY_LEVEL);
            %></td>
        </tr>
        <tr>
            <th>补给段长度比(%)</th>
            <td><%=pc.getSUPPLY_LENGTH_RATIO() %></td>
        </tr>
        <tr>
            <th>沟口扇形地</th>
            <td><%String PIM = pc.getFAN_AREA();
                String FAN_AREA = new Replace().FAN_AREAReplace(PIM);
                out.print(FAN_AREA);
            %></td>
        </tr>
        <tr>
            <th>主沟纵坡(‟)</th>
            <td><%=pc.getCHANNEL_SLOPE() %></td>
        </tr>
        <tr>
            <th>新构造影响</th>
            <td><%String PIMN = pc.getEFFECT();
                String EFFECT = new Replace().EFFECTReplace(PIMN);
                out.print(EFFECT);
            %></td>
        </tr>
        <tr>
            <th>植被覆盖率(%)</th>
            <td><%=pc.getVEGETATION_COVERAGE_RATIO() %></td>
        </tr>
        <tr>
            <th>冲淤变幅(m)</th>
            <td><%=pc.getEROSION_AMPLITUDE() %></td>
        </tr>
        <tr>
            <th>岩性因素</th>
            <td><%String PM = pc.getLITHOLOGY_FACTOR();
                String LITHOLOGY_FACTOR = new Replace().LITHOLOGY_FACTORReplace(PM);
                out.print(LITHOLOGY_FACTOR);
            %></td>
        </tr>
        <tr>
            <th>松散物储量</th>
            <td><%=pc.getMATERIAL_RESERVES() %></td>
        </tr>
        <tr>
            <th>山坡坡度(°)</th>
            <td><%=pc.getHILLSIDE_GRADIENT() %></td>
        </tr>
        <tr>
            <th>沟槽横断面</th>
            <td><%String PMb = pc.getGROOVE_CROSS_TYPE();
                String GROOVE_CROSS_TYPE = new Replace().GROOVE_CROSS_TYPEReplace(PMb);
                out.print(GROOVE_CROSS_TYPE);
            %></td>
        </tr>
        <tr>
            <th>松散物平均厚度(m)</th>
            <td><%=pc.getMATERIAL_THICK() %></td>
        </tr>
        <tr>
            <th>流域面积(km2)</th>
            <td><%=pc.getBASIN_AREA() %></td>
        </tr>
        <tr>
            <th>相对高差(m)</th>
            <td><%=pc.getRELATIVE_DISPERSION() %></td>
        </tr>
        <tr>
            <th>堵塞程度</th>
            <td><%String PMc = pc.getBLOCKING_DEGREE();
                String BLOCKING_DEGREE = new Replace().BLOCKING_DEGREEReplace(PMc);
                out.print(BLOCKING_DEGREE);
            %></td>
        </tr>
        <tr>
            <th>不良地质现象评分</th>
            <td><%=pc.getPF() %></td>
        </tr>
        <tr>
            <th>补给段长度比评分</th>
            <td><%=pc.getPF2() %></td>
        </tr>
        <tr>
            <th>沟口扇形地评分</th>
            <td><%=pc.getPF3() %></td>
        </tr>
        <tr>
            <th>主沟纵坡评分</th>
            <td><%=pc.getPF4() %></td>
        </tr>
        <tr>
            <th>新构造影响评分</th>
            <td><%=pc.getPF5() %></td>
        </tr>
        <tr>
            <th>植被覆盖率评分</th>
            <td><%=pc.getPF6() %></td>
        </tr>
        <tr>
            <th>冲淤变幅评分</th>
            <td><%=pc.getPF7() %></td>
        </tr>
        <tr>
            <th>岩性因素评分</th>
            <td><%=pc.getPF8() %></td>
        </tr>
        <tr>
            <th>松散物储量评分</th>
            <td><%=pc.getPF9() %></td>
        </tr>
        <tr>
            <th>山坡坡度评分</th>
            <td><%=pc.getPF10() %></td>
        </tr>
        <tr>
            <th>沟槽横断面评分</th>
            <td><%=pc.getPF11() %></td>
        </tr>
        <tr>
            <th>松散物平均厚度评分</th>
            <td><%=pc.getPF12() %></td>
        </tr>
        <tr>
            <th>流域面积评分</th>
            <td><%=pc.getPF13() %></td>
        </tr>
        <tr>
            <th>相对高差评分</th>
            <td><%=pc.getPF14() %></td>
        </tr>
        <tr>
            <th>堵塞程度评分</th>
            <td><%=pc.getPF15() %></td>
        </tr>
        <tr>
            <th>考核总分</th>
            <td><%=pc.getTOTAL_SCORE() %></td>
        </tr>
        <tr>
            <th>易发程度</th>
            <td>%String PM = pc.getOCCUR_DEGREE();
                String OCCUR_DEGREE = new Replace().OCCUR_DEGREEReplace(PM);
                out.print(OCCUR_DEGREE);
                %></td>
        </tr>
        <tr>
            <th>发展阶段</th>
            <td>%String PM = pc.getDEVELOP_STAGE();
                String DEVELOP_STAGE = new Replace().DEVELOP_STAGEReplace(PM);
                out.print(DEVELOP_STAGE);
                %></td>
        </tr>
        <%
            }
        %>

        <!-- 滑坡危害 -->
        <tr>
            <th colspan = "2" class="dam">6.滑坡危害</th>
        </tr>
        <%
            DebrisDamageDao dd = new DebrisDamageDao();
            List<DebrisDamage> list5 = dd.readDebrisDamage(request.getParameter("uuid"));
            for(DebrisDamage dm:list5)
            {
        %>
    <tr>
        <th>危害对象</th>
        <td><%String TO = dm.getDAMAGE_OBJEAT();
            String DAMAGE_OBJEAT = new Replace().HOReplace(TO);
            out.print(DAMAGE_OBJEAT);
        %></td>
    </tr>
        <tr>
            <th>死亡人数</th>
            <td><%=dm.getDEAD_NUBER() %></td>
        </tr>

        <tr>
            <th>直接经济损失（万元）</th>
            <td><%=dm.getDIRECT_LOSS() %></td>
        </tr>

        <tr>
            <th>灾情等级</th>
            <td><%String DL = dm.getDISASTER_LEVEL();
                String DISASTER_LEVEL = new Replace().DLReplace(DL);
                out.print(DISASTER_LEVEL);
            %></td>
        </tr>

        <tr>
            <th>威胁人数</th>
            <td><%=dm.getTHREATEN_POPULATION() %></td>
        </tr>
        <tr>
            <th>威胁财产</th>
            <td><%=dm.getTHREATEN_PROPERTY() %></td>
        </tr>
        <tr>
            <th>险情等级</th>
            <td><%String DLe = dm.getDANGER_LEVEL();
                String DANGER_LEVEL = new Replace().DLevelReplace(DLe);
                out.print(DANGER_LEVEL);
            %></td>
        </tr>
        <tr>
            <th>威胁对象</th>
            <td><%String TOU = dm.getTHREATEN_OBJECT();
                String THREATEN_OBJECT = new Replace().TOReplace(TOU);
                out.print(THREATEN_OBJECT);
            %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
