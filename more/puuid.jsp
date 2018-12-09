<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*, entity.*" %>
<%@ page import="java.util.List"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>崩塌信息详情表</title>
<style type = "text/css">
	body{font-family:Arial, Verdana, sans-serif; color:#111111;}
	table{width:600px;}
	th, td{padding:7px 10px 10px 10px;
		   boder-bottom:2px solid #111111; border-top:1px solid #999; text-align:left;}
	th{letter-spacing:0.1em;}
	th.info, th.en, th.pch, th.sign, th.ach, th.dam{font:30px "Microsoft New Tai Lue"}
	tr:hover{background-color:#efefef;}
	#x{ width: 240px;
		height: 20px}
	
	
</style>
</head>
<body>
	<form name = "uuid"  method="post">
		<input id="x" type = "text" name = "uuid" />
		<input type = "submit" value = "Go">
	</form>
	<table >
		<!-- 基本情况 -->
		<tr>
			<th colspan = "2" class="info">1.基本情况</th>
		</tr>
<%
	PartOneDao pod = new PartOneDao();
    List<PartOne> list = pod.readPartOne(request.getParameter("uuid"));
    for(PartOne po:list)
    {
%>
		<tr>
			<th>所属矿山</th>
			<td><%=po.getRECID() %></td>
		</tr>
		<tr>
			<th>是否发生</th>
			<td><%=po.getHAPPEN_FLAG() %></td>
		</tr>
		<tr>
			<th>发生时间</th>
			<td><%=po.getHAPPEN_DATE() %></td>
		</tr>
		<tr>
			<th>坡顶高程（m）</th>
			<td><%=po.getTOP_EVEVATION() %></td>
		</tr>
		<tr>
			<th>坡底高程（m）</th>
			<td><%=po.getBUTTOM_EVEVATION() %></td>
		</tr>
		<tr>
			<th>斜坡类型</th>
			<td><%=po.getSLOPE_TYPE() %></td>
		</tr>
		<tr>
			<th>崩塌类型</th>
			<td><%=po.getCOLLAPSE_TYPE() %></td>
		</tr>
		<tr>
			<th>监测建议</th>
			<td><%String MS = po.getMONITOR_SUGGEST();
				  String MONITOR_SUGGEST = new Replace().MSReplace(MS);
				  out.print(MONITOR_SUGGEST);
			%></td>
		</tr>
		<tr>
			<th>防治建议</th>
			<td><%String PS = po.getPREVENTION_SUGGEST();
				  String PREVENTION_SUGGEST = new Replace().PSReplace(PS);
				  out.print(PREVENTION_SUGGEST);
			%></td>
		</tr>
		<tr>
			<th>崩塌描述</th>
			<td><%=po.getMEMO() %></td>
		</tr>
<%
	}
%>
		<!-- 崩塌环境 -->
		<tr>
			<th colspan = "2" class="en">2.崩塌环境</th>
		</tr>
		<%
			EnvironmentDao end = new EnvironmentDao();
			List<Environment> list1 = end.readEnvironment(request.getParameter("uuid"));
			for(Environment en:list1)
			{
		%>
		<tr>
			<th>地层时代</th>
			<td><%=en.getSTRATUM_ERA() %></td>
		</tr>
		<tr>
			<th>地层岩性</th>
			<td><%=en.getSTRATUM_LITHOLOGY() %></td>
		</tr>
		<tr>
			<th>地层产状</th>
			<td><%=en.getATTITUDE() %></td>
		</tr>
		<tr>
			<th>地质构造部位</th>
			<td><%=en.getTECTONIC_POSITION() %></td>
		</tr>
		<tr>
			<th>地震烈度</th>
			<td><%=en.getEARTHQUAKE_LEVEL() %></td>
		</tr>
		<tr>
			<th>微地貌</th>
			<td><%String ML = en.getMICRO_LANDSCAPE();
				  String MICRO_LANDSCAPE = new Replace().MLReplace(ML);
				  out.print(MICRO_LANDSCAPE);
			%></td>
		</tr>
		<tr>
			<th>土地利用</th>
			<td><%String LUT = en.getLAND_USE_TYPE();
				  String LAND_USE_TYPE = new Replace().LUTReplace(LUT);
				  out.print(LAND_USE_TYPE);
			%></td>
		</tr>
		<%
			}
		%>
		<!-- 危岩体特征 -->
		<tr>
			<th colspan = "2" class="pch">3.危岩体特征</th>
		</tr>
		<%
			PCharacterDao pcd = new PCharacterDao();
			List<PCharacter> list2 = pcd.readPCharacter(request.getParameter("uuid"));
			for(PCharacter pc:list2)
			{
		%>
		<tr>
			<th>分布高程（m）</th>
			<td><%=pc.getDISTRIBUTE_ELEVATION() %></td>
		</tr>
		<tr>
			<th>坡高（m）</th>
			<td><%=pc.getSLOPE_HEIGHT() %></td>
		</tr>
		<tr>
			<th>坡长（m）</th>
			<td><%=pc.getSLOPE_LENGTH() %></td>
		</tr>
		<tr>
			<th>坡宽（m）</th>
			<td><%=pc.getSLOPE_WIDTH() %></td>
		</tr>
		<tr>
			<th>厚度（m）</th>
			<td><%=pc.getTHICK() %></td>
		</tr>
		<tr>
			<th>体积（m³）</th>
			<td><%=pc.getVOLUME() %></td>
		</tr>
		<tr>
			<th>规模等级</th>
			<td><%String SL = pc.getSCALE_LEVEL();
				  String SCALE_LEVEL = new Replace().SLReplace(SL);
				  out.print(SCALE_LEVEL);
			%></td>
		</tr>
		<tr>
			<th>坡度（°）</th>
			<td><%=pc.getGRADIENT() %></td>
		</tr>
		<tr>
			<th>坡向（°）</th>
			<td><%=pc.getASPECT() %></td>
		</tr>
		<tr>
			<th>岩质结构类型</th>
			<td><%String RTT = pc.getROCK_TEXTURE_TYPE();
				  String ROCK_TEXTURE_TYPE = new Replace().RTTReplace(RTT);
				  out.print(ROCK_TEXTURE_TYPE);
			%></td>
		</tr>
		<tr>
			<th>岩质厚度（m）</th>
			<td><%=pc.getROCK_THICK() %></td>
		</tr>
		<tr>
			<th>裂隙组数（组）</th>
			<td><%=pc.getYTLXZS() %></td>
		</tr>
		<tr>
			<th>岩质块度（长*宽*高）</th>
			<td><%=pc.getROCK_LINPINESS() %></td>
		</tr>
		<tr>
			<th>全风化带深度（m）</th>
			<td><%=pc.getBEDROCK_DEPTH() %></td>
		</tr>
		<tr>
			<th>卸荷裂缝深度（m）</th>
			<td><%=pc.getUNLOAD_FISSURE_DEPTH() %></td>
		</tr>
		<tr>
			<th>土质名称</th>
			<td><%=pc.getSOIL_NAME() %></td>
		</tr>
		<tr>
			<th>土质密实度</th>
			<td><%String SC = pc.getSOIL_COMPACTEDNESS();
				  String SOIL_COMPACTEDNESS = new Replace().SCReplace(SC);
				  out.print(SOIL_COMPACTEDNESS);
			%></td>
		</tr>
		<tr>
			<th>土质稠度</th>
			<td><%=pc.getSOIL_CONSISTENCE() %></td>
		</tr>
		<tr>
			<th>下伏基岩岩性</th>
			<td><%=pc.getBEDROCK_LITHOLOGY() %></td>
		</tr>
		<tr>
			<th>下伏基岩时代</th>
			<td><%=pc.getBEDROCK_ERA() %></td>
		</tr>
		<tr>
			<th>下伏基岩产状</th>
			<td><%=pc.getBEDROCK_ATTITUDE() %></td>
		</tr>
		<tr>
			<th>下伏基岩埋深</th>
			<td><%=pc.getBEDROCK_DEPTH() %></td>
		</tr>
		<tr>
			<th>目前稳定程度</th>
			<td><%String SD = pc.getSTABLE_DEGREE();
			      String STABLE_DEGREE = new Replace().SDReplace(SD);
			      out.print(STABLE_DEGREE);
			%></td>
		</tr>
		<tr>
			<th>今后变化趋势</th>
			<td><%String VT = pc.getVARIATION_TREND();
				  String VARIATION_TREND = new Replace().VTReplace(VT);
				  out.print(VARIATION_TREND);
			%></td>
		</tr>
<%
    }
%>
		<!-- 危岩体现今变形破坏类型 -->
		<tr>
			<th colspan = "2" class="sign">4.危岩体现今变形破坏类型</th>
		</tr>
<%
	DeSignDao dao = new DeSignDao();
	List<DeSign> list3 = dao.readDeSign(request.getParameter("uuid"));
	for(DeSign ds:list3)
	{
%>
		<tr>
			<th>变形破坏类型</th>
			<td><% int dt = ds.getDEFORMATION_TYPE();
				   String DEFORMATION_TYPE = new Replace().DTReplace(dt);
				   out.print(DEFORMATION_TYPE);
				%>
		</tr>
		<tr>
			<th>部位</th>
			<td><%=ds.getDEFORMATION_PARTS() %></td>
		</tr>
		<tr>
			<th>特征</th>
			<td><%=ds.getDEFORMATION_FEATURE() %></td>
		</tr>
		<tr>
			<th>初现时间</th>
			<td><%=ds.getHAPPEN_TIME() %></td>
		</tr>
<%
	}
%>	
		<!-- 堆积体特征 -->
		<tr>
			<th colspan = "2" class="ach">5.堆积体特征</th>
		</tr>
<%
	PartThreeDao ptd = new PartThreeDao();
	List<PartThree> list4 = ptd.readPartThree(request.getParameter("uuid"));
	for(PartThree pt:list4)
	{
%>
		<tr>
			<th>长度（m）</th>
			<td><%=pt.getAGGREGATE_LENGTH() %></td>
		</tr>
		<tr>
			<th>宽度（m）</th>
			<td><%=pt.getAGGREGATE_WIDTH() %></td>
		</tr>
		<tr>
			<th>厚度（m）</th>
			<td><%=pt.getAGGREGATE_THICKNESS() %></td>
		</tr>
		<tr>
			<th>体积（m³）</th>
			<td><%=pt.getAGGREGATE_VOLUME() %></td>
		</tr>
		<tr>
			<th>坡度（°）</th>
			<td><%=pt.getAGGREGATE_GRADIENT() %></td>
		</tr>
		<tr>
			<th>坡向（°）</th>
			<td><%=pt.getAGGREGATE_ASPET() %></td>
		</tr>
		<tr>
			<th>坡面形态</th>
			<td><%String ASS = pt.getAGGREGATE_SLOPE_SHAPE();
				  String AGGREGATE_SLOPE_SHAPE = new Replace().ASSReplace(ASS);
				  out.print(AGGREGATE_SLOPE_SHAPE);
			%></td>
		</tr>
		<tr>
			<th>目前稳定程度</th>
			<td><%String AS = pt.getAGGREGATE_STABILITY();
			      String AGGREGATE_STABILITY = new Replace().ASReplace(AS);
			      out.print(AGGREGATE_STABILITY);
			%></td>
		</tr>
		<tr>
			<th>今后变化趋势</th>
			<td><%String AT = pt.getAGGREGATE_TREND();
			      String AGGREGATE_TREND = new Replace().ATReplace(AT);
			      out.print(AGGREGATE_TREND);
			%></td>
		</tr>
		<%
			}
		%>
		<!-- 崩塌危害 -->
		<tr>
			<th colspan = "2" class="dam">6.崩塌危害</th>
		</tr>
		<%
			DamageDao dd = new DamageDao();
			List<Damage> list5 = dd.readDamage(request.getParameter("uuid"));
			for(Damage dm:list5)
			{
		%>
		<tr>
			<th>死亡人数</th>
			<td><%=dm.getDEAD_NUBER() %></td>
		</tr>
		<tr>
			<th>毁坏房屋</th>
			<td><%=dm.getDESTROY_HOUSE_NUMBER() %></td>
		</tr>
		<tr>
			<th>毁路（m）</th>
			<td><%=dm.getDESTROY_ROAD_LENGTH() %></td>
		</tr>
		<tr>
			<th>毁渠（m）</th>
			<td><%=dm.getDESTROY_CANAL_LENGTH() %></td>
		</tr>
		<tr>
			<th>其他危害</th>
			<td><%=dm.getOTHER_DAMAGE() %></td>
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
			      String DISASTER_LEVEL = new Replace().DLReplace(DL);
			      out.print(DISASTER_LEVEL);
			%></td>
		</tr>
		<tr>
			<th>危害对象</th>
			<td><%String HO = dm.getHARM_OBJECT();
				  String HARM_OBJECT = new Replace().HOReplace(HO);
				  out.print(HARM_OBJECT);
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
			<td><%String TO = dm.getTHREATEN_OBJECT();
			      String THREATEN_OBJECT = new Replace().TOReplace(TO);
			      out.print(THREATEN_OBJECT);
			%></td>
		</tr>
<%
	}
%>		
	</table>
	
</body>
</html>