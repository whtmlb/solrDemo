<%@ page pageEncoding="UTF-8"%>


<%--
<%@ include file="../check.jsp"%>
--%>
<%--
  File Name:    EntBaseInfoQuery.jsp
  Created by:   IntelliJ IDEA.
  Copyright:    Copyright (c) 2003-2006
  Company:      TopSoft( http://www.topnet.net.cn)
  Author:       leizhimin
  Modifier:     leizhimin
  Date:         2006-11-13 21:30:35
  Readme:       企业信息综合查询(经济户口查询)
--%>


<%--@ page contentType="text/html;charset=GBK" --%>
<%--
 

    String qymc = request.getParameter("qymc");
    String zch = request.getParameter("zch");
    String fddbr = request.getParameter("fddbr");
    String jydz = request.getParameter("jydz");
    String jyfw = request.getParameter("jyfw");
    String djjgone = request.getParameter("djjg");
    String djjgtwo = request.getParameter("djjg");
    String gxdw = request.getParameter("gxdw");
    String gxdwkg = request.getParameter("gxdwkg");
    String djjgkg = request.getParameter("djjgkg");
    String hylb = request.getParameter("hylb");
    String qylx_zl = request.getParameter("qylx_zl");
    String qylx_xl = request.getParameter("qylx_xl");
    String qysx = request.getParameter("qysx");
    String zt = request.getParameter("zt");
	String jylb = request.getParameter("jylb");
    String cjrqq = request.getParameter("cjrqq");
    String cjrqz = request.getParameter("cjrqz");
    String hzrqq = request.getParameter("hzrqq");
    String hzrqz = request.getParameter("hzrqz");
    String djlx = request.getParameter("djlx");
    String dah = request.getParameter("dah");

    

    if (qymc == null) qymc = "";
    if (zch == null) zch = "";
    if (fddbr == null) fddbr = "";
    if (jydz == null) jydz = "";
    if (jyfw == null) jyfw = "";
    if (gxdw == null) gxdw = "";
    if (djjgone == null) djjgone = "";
    if (djjgtwo == null) djjgtwo = "";
    if (gxdwkg == null) gxdwkg = "1";
    if (djjgkg == null) gxdwkg = "1";
    if (hylb == null) hylb = "";
    if (qylx_zl == null) qylx_zl = "";
    if (qylx_xl == null) qylx_xl = "";
    if (qysx == null) qysx = "";
    if (zt == null) zt = "06";
    if (jylb == null) jylb = "";
    if (dah == null) dah = "";

    if (jylb == null) jylb = "";
    if (cjrqq == null) cjrqq = "1980-01-01";
    if (hzrqq == null) hzrqq = "1980-01-01";

    Calendar calendar = Calendar.getInstance();
    int year = calendar.get(Calendar.YEAR);
    int month = calendar.get(Calendar.MONTH) + 1;
    int day = calendar.get(Calendar.DATE);

    String monthStr = "" + month;
    String dayStr = "" + day;
    if(month<10)
    {
        monthStr = "0" + month;
    }
    if(day<10)
    {
        dayStr = "0" + day;
    }
    if (cjrqz == null) cjrqz =    year+"-"+monthStr+"-"+dayStr;
    if (hzrqz == null) hzrqz =    year+"-"+monthStr+"-"+dayStr;


    if (djlx == null) djlx = "";
	
	
	
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>系统主操作区页面模板</title>
    <%-- 
    <link rel="stylesheet" type="text/css" href="<%=rootPath%>/etc/common/style/topicms.css">
     <script type="text/javascript" src="<%=rootPath%>/etc/grid/grid.js"></script>
    <script type="text/javascript" src="<%=rootPath%>/etc/calendar/calendar.js"></script>   
    <script type="text/javascript" src="<%=rootPath%>/etc/common/script/topicms.js"></script>
    --%>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/icon.css" />
    
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/locale/easyui-lang-zh_CN.js"></script>
	
	
	
	<SCRIPT type="text/javascript">
	var app_path= "";
		function viewReport(){
    	   //拼 装转发参数
    	   var queryStr = "";
    	   if(document.all.qymc.value!=""){
    	   	queryStr = encodeURIComponent(" +entname:") + encodeURIComponent(document.all.qymc.value);//企业名称
    	  }
    	  if( document.all.gxdw.value){
    	  	queryStr += encodeURIComponent(" +superorgid:") + encodeURIComponent(document.all.gxdw.value);//管辖单位
    	  }
        
        if(document.all.zch.value!=""){
        	queryStr += encodeURIComponent(" +regno:") + encodeURIComponent(document.all.zch.value);//注册号
        	}
        //
        if(document.all.fddbr.value!=""){
        	queryStr += encodeURIComponent(" +lerep:") + document.all.fddbr.value;//法定代表人
        	}
       // 
       if(document.all.jydz.value!=""){
       	queryStr += encodeURIComponent(" +oploc:") + document.all.jydz.value;//经营场所
        	}
       // 
       if(document.all.dah.value!=""){
        queryStr += encodeURIComponent(" +archno:") + document.all.dah.value;//档案号
      	}
       if(document.all.jyfw.value!=""){
       	queryStr += encodeURIComponent(" +opscope:") + document.all.jyfw.value;//经营范围
        	}
       // 
       if(document.all.hmt.value!=""){
       	queryStr += encodeURIComponent(" +industryphy:") + document.all.hmt.value; //行业门类
        	}
       // 
       if(document.all.hmi.value!=""){
       	queryStr += encodeURIComponent(" +industryphy:") + document.all.hmi.value; //行业大类
        	}
       // 
       if(document.all.xyjb.value!=""){
       	queryStr += encodeURIComponent(" +credLevel:") + document.all.xyjb.value;//信用级别
        	}
       // 
       if( document.all.hmm.value!=""){
       	queryStr += encodeURIComponent(" +industrycoxi:") + document.all.hmm.value;//行业细类 
        	}
       // 
       if(document.all.hyxxl.value!=""){
       	queryStr += encodeURIComponent(" +industrycoxiao:") + document.all.hyxxl.value; //行业小类
        	}
       // 
       if( document.all.qylx_xl.value!=""){
       	queryStr += encodeURIComponent(" +enttypeitem:") + document.all.qylx_xl.value; //企业类型-小类
        	}
       // 
       if(document.all.qylx_zl.value!=""){
       	queryStr += encodeURIComponent(" +enttype:") + document.all.qylx_zl.value; //企业中类
        	}
       // 
      // if(document.all.zt.value!=""){
       	// queryStr += " + state:" + document.all.zt.value;//企业状态
        //	}
       //
       if( document.all.fxhy.value!=""){
       	queryStr += encodeURIComponent(" +venind:") + document.all.fxhy.value;//风险行业
        	}
        //
        if(document.all.jylb.value!=""){
        	queryStr += encodeURIComponent(" +optype:") + document.all.jylb.value;//经营类别
        	}
       // 
     //queryStr += " +opto:[1995-12-31T23:59:59Z   TO   *]";   
       // if(document.all.cjrqq.value!=""&&document.all.cjrqz.value==""){
        	
        //}
        
        //queryStr += " AND opto=" + document.all.cjrqq.value;//成立日期起
       // queryStr += " AND opfrom:" + document.all.cjrqz.value;//成立日期止
        //queryStr += " AND apprdate:" + document.all.hzrqq.value;//核准日期起
       // queryStr += " AND apprdate:" + document.all.hzrqz.value;//核准日期止
       
       
       
       
       
        //queryStr += " AND state:" + document.all.zt.value;//企业状态
        //queryStr += " AND venind:" + document.all.fxhy.value;//风险行业
        //queryStr += " AND optype:" + document.all.jylb.value;//经营类别
        //queryStr += " AND opto:" + document.all.cjrqq.value;//成立日期起
        //queryStr += " AND opfrom:" + document.all.cjrqz.value;//成立日期止
        //queryStr += " AND apprdate:" + document.all.hzrqq.value;//核准日期起
        //queryStr += " AND apprdate:" + document.all.hzrqz.value;//核准日期止

        //queryStr = escape(queryStr);
       
        app_path = "http://localhost:8080/solrDemo/collection1/select?q="+queryStr+"&wt=json&indent=true";
        //window.location.href =app_path;
        
       //init_demo_grid(app_path);
      init_ent_grid(app_path);
        
       /*  $.ajax({
            type : 'post',
            url : app_path,
            //data : param,
            //dataType : "json",
            success : function (data) {
               alert(data);
            },
            error : function () {
                alert("fail");
            }
        }); */
        
        
        
        
        
        
        
        
        
        
        
        
        // window.location.href =app_path;

     		//&wt=xml&indent=true
     		//alert(queryStr);
     		//window.location.href = "";
<%-- 		   //window.location.href = "/topbirt/frameset?__report=EntBaseInfoQuery_h.rptdesign" + queryStr + "=commoninfo&__overwrite=true"; --%>
		
     

     
   
    
    }
		
		
		
		function init_ent_grid(app_path){ 
			
			var totals = 0;
			var row ;
			
		    var _loader = function(param,success,error){
		        var _this = $(this);
		        var opts = _this.datagrid("options");
		        if (!opts.url) {
		            return false;
		        }

		        $.ajax({
		                    type : opts.method,
		                    url : opts.url,
		                    //data : param,
		                    dataType : "json",
		                    success : function (data) {
		                      //alert(data.response.numFound);
		                     // alert(1234567890);
		                      totals=data.response.numFound;
             				  row= data.response.docs;
             				 success(row);
		                    },
		                    error : function () {
		                        error.apply(this, arguments);
		                    }
		                });
		    };
			
		
		    $("#demoGrid").datagrid({
		                title:'查询结果展示',
		                striped: true,
		                fit: true,
		                fitColumns: true,
		                url:app_path,
		                method: 'post',
		                nowrap: true,
		                loadMsg:'加载中，请稍后..',
		                loader: _loader,
		                singleSelect:true,
		                autoRowHeight: false,
		                remoteSort: false,
		                rownumbers:true,
		                pagination:true,
		                width:700,
		    			height:250,
		    			loadFilter:function(r){
	                    	   r = {
	               					total:totals,
	               					rows: row
	               				};
	                    	   return r;
	                    },
		                columns:[[
		                    {field:'entname',title:'企业名称',width:80},
		                    {field:'regno',title:'注册号',width:80}
		                ]],
		               
		            });
		    var pager =  $("#demoGrid").datagrid('getPager');
		    pager.pagination({
		    			pageSize:10,
				    	showPageList:false,
						showRefresh:false,
						onSelectPage:function(number, size) {
							debugger;
							reloadGird(number,size,pager.pagination('options').total);
						},
						onBeforeRefresh:function(number, size){
							clearGrid();
						}

		            });
		    
		    
		    
		    
		    
		} 
		
		function reloadGird( pageNum, pageSize, total) {
			var start = app_path.indexOf("&start");
			//alert("start: "+start);
			var end  = app_path.indexOf("&rows");
			//alert("end: "+end);
			if(start==-1&&end==-1){
				app_path = $("#demoGrid").datagrid("options").url = app_path+"&start="+((pageNum-1)*pageSize)+"&rows=10";
			}else{
				app_path = $("#demoGrid").datagrid("options").url = app_path.substr(0,start)+"&start="+((pageNum-1)*pageSize)+"&rows=10";
				
			}
			//alert(app_path);
			 $("#demoGrid").datagrid('reload');
		}
		
		
		
		
		
		function init_demo_grid(url){
			$('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(url));
		}
		
		function getData(url){
			var rows=[];
			
			  $.ajax({
                  type : "post",
                  url : url,
                  //data : param,
                  dataType : "json",
                  async:false,
                  success : function (data) {
                	 
                     alert(data.response.numFound);
                    /* 
                     var griddata={};
                     griddata.total=data.response.numFound;
                     griddata.rows=data.response.docs; */
                     alert(data.response.docs);
                     
                     
                     rows = data.response.docs;
                     /* for(var i=1; i<=data.response.numFound; i++){
                    	 rows.push({
         					entname: 'Ientname '+i,
         					regno: $.fn.datebox.defaults.formatter(new Date()),

         				});
                     } */
                  },
                  error : function () {
                      error.apply(this, arguments);
                  }
              });
			
			
			
			
			
			
			
			/* var rows = [];
			for(var i=1; i<=800; i++){
				var amount = Math.floor(Math.random()*1000);
				var price = Math.floor(Math.random()*1000);
				rows.push({
					entname: 'Ientname '+i,
					regno: $.fn.datebox.defaults.formatter(new Date()),

				});
			} */
			alert(rows.length);
			return rows;
		}
		
		function pagerFilter(data){
			
			if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
				data = {
					total: data.length,
					rows: data
				}
			}
			var dg = $(this);
			var opts = dg.datagrid('options');
			var pager = dg.datagrid('getPager');
			pager.pagination({
				onSelectPage:function(pageNum, pageSize){
					opts.pageNumber = pageNum;
					opts.pageSize = pageSize;
					pager.pagination('refresh',{
						pageNumber:pageNum,
						pageSize:pageSize
					});
					dg.datagrid('loadData',data);
				}
			});
			if (!data.originalRows){
				data.originalRows = (data.rows);
			}
			var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
			var end = start + parseInt(opts.pageSize);
			data.rows = (data.originalRows.slice(start, end));
			return data;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
        var req;
       
        function Change_Select()
        {
            var zhi=document.getElementById('qylx_zl').value;
            //alert(zhi);
            <%--var url="<%=rootPath%>/pages/query/reg/qylxxl.jsp?qylx_zl="+escape(zhi);%-->
           // alert(url);
            if(window.XMLHttpRequest)
            {
				req=new XMLHttpRequest();
            }else if(window.ActiveXObject)
            {
                req=new ActiveXObject("Microsoft.XMLHTTP");
            }
            if(req)
            {
                req.open("GET",url,true);
                req.onreadystatechange=callback;
                req.send(null);
            }
        }

        function callback()
        {
            if(req.readyState == 4)
            {
                if(req.status == 200)
                {
                    parseMessage();
                }else{
                    alert("Not able to retrieve description"+req.statusText);
                }
            }
        }
        function parseMessage()
        {
			var xmlDoc=req.responseXML.documentElement;
            var xSel=xmlDoc.getElementsByTagName('select');
            var select_root=document.getElementById('qylx_xl');
            select_root.options.length=0;
            //alert(select_root);
            for(var i=0;i<xSel.length;i++)
            {
                var xValue=xSel[i].childNodes[0].firstChild.nodeValue;
                var xText=xSel[i].childNodes[1].firstChild.nodeValue;
                var option=new Option(xText,xValue);
                try{
                    select_root.add(option);
                }catch(e){
                }
				}
           // alert(option);
        }

    </SCRIPT>
	<SCRIPT type="text/javascript">
      var req;
	
      function hylb_Select1()
        {
            var hylb=document.getElementById("hmt").value;
            //alert(zhi);
            <%--var url1="<%=rootPath%>/pages/query/reg/hylbdl.jsp?hylb="+escape(hylb);--%>
           // alert(url);
            if(window.XMLHttpRequest)
            {
				req=new XMLHttpRequest();
            }else if(window.ActiveXObject)
            {
                req=new ActiveXObject("Microsoft.XMLHTTP");
            }
            if(req)
            {
                req.open("GET",url1,true);
                req.onreadystatechange=callback1;
                req.send(null);
            }
        }

        function callback1()
        {
            if(req.readyState == 4)
            {
                if(req.status == 200)
                {
                    parseMessage1();
                }else{
                    alert("Not able to retrieve description"+req.statusText);
                }
            }
        }
        function parseMessage1()
        {
			var xmlDoc=req.responseXML.documentElement;
            var xSel=xmlDoc.getElementsByTagName('select');
            var hylb_root=document.getElementById("hmi");
                hylb_root.options.length=0;
            //alert(select_root);
            for(var i=0;i<xSel.length;i++)
            {
                var xValue=xSel[i].childNodes[0].firstChild.nodeValue;
                var xText=xSel[i].childNodes[1].firstChild.nodeValue;
                var option=new Option(xText,xValue);
                try{
                    hylb_root.add(option);
                }catch(e){
                }
				}
           // alert(option);
        }
		function hylb_dl_Select2()
        {
            var zhi_dl=document.getElementById("hmi").value;
            //alert(zhi_dl);
            <%--var url2="<%=rootPath%>/pages/query/reg/hylbxl.jsp?hylbdl="+escape(zhi_dl);--%>
			
            //alert(url2);
             if(window.XMLHttpRequest)
            {
				req=new XMLHttpRequest();

            }else if(window.ActiveXObject)
            try {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");
               } catch (e) {
                     try {
                         http_request = new ActiveXObject("Microsoft. XMLHTTP");
                    } catch (e) {}
               }

            if(req)
            {
                req.open("GET",url2,true);
				
                req.onreadystatechange=callback2;
                req.send(null);
            }
        }

        function callback2()
        {
            if(req.readyState == 4)
            {
                if(req.status == 200)
                {
                    parseMessage2();
                }else{

                    alert("Not able to retrieve description"+req.statusText);
                }
            }
        }
        function parseMessage2()
        {
			var xmlDoc=req.responseXML.documentElement;
            var xSel=xmlDoc.getElementsByTagName('select');
            var hylb_xl_root=document.getElementById("hmm");
                hylb_xl_root.options.length=0;
            //alert(select_root);
            for(var i=0;i<xSel.length;i++)
            {
                var xValue=xSel[i].childNodes[0].firstChild.nodeValue;
                var xText=xSel[i].childNodes[1].firstChild.nodeValue;
                var option=new Option(xText,xValue);
                try{
                    hylb_xl_root.add(option);
                }catch(e){
                }
				}
           // alert(option);
        }

    </SCRIPT>

<SCRIPT type="text/javascript">
      var req;
	  function hylb_xl_Select3()
        {
            var zhi_xl=document.getElementById("hmm").value;
            //alert(zhi_xl);
            <%--var url23="<%=rootPath%>/pages/query/reg/hylbxxl.jsp?hylbdl="+escape(zhi_xl);--%>
			
            //alert(url23);
             if(window.XMLHttpRequest)
            {
				req=new XMLHttpRequest();

            }else if(window.ActiveXObject)
            try {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");
               } catch (e) {
                     try {
                         http_request = new ActiveXObject("Microsoft. XMLHTTP");
                    } catch (e) {}
               }

            if(req)
            {
                req.open("GET",url23,true);
				
                req.onreadystatechange=callback3;
                req.send(null);
            }
        }

        function callback3()
        {
            if(req.readyState == 4)
            {
                if(req.status == 200)
                {
                    parseMessage3();
                }else{

                    alert("Not able to retrieve description"+req.statusText);
                }
            }
        }
        function parseMessage3()
        {
			var xmlDoc=req.responseXML.documentElement;
            var xSel=xmlDoc.getElementsByTagName('select');
            var hylb_xxl_root=document.getElementById("hyxxl");
                hylb_xxl_root.options.length=0;
            //alert(select_root);
            for(var i=0;i<xSel.length;i++)
            {
                var xValue=xSel[i].childNodes[0].firstChild.nodeValue;
                var xText=xSel[i].childNodes[1].firstChild.nodeValue;
                var option=new Option(xText,xValue);
                try{
                    hylb_xxl_root.add(option);
                }catch(e){
                }
				}
           // alert(option);
        }
</SCRIPT>
</head>

<body>
<!--页面标题栏begin-->
<table border="0" cellpadding="0" cellspacing="0" class="table-location" align="center">
    <tr>
        <td width="15%"><img src="/etc/common/images/moreblue.gif" width="21" height="10" alt="">&nbsp;您所在位置：
        </td>
        <td width="85%" align="left"><div id="pageTitle"></div></td>
    </tr>
</table>
<!--页面标题栏end-->
<!--页面框架begin-->
<table border="0" align="center" cellpadding="2" cellspacing="1" class="table-frame">
<tr>
<td>
<!--内容页面begin-->


<form name="FormName" method="post" action="#">
<table class="table-form">

<input type="hidden" name="type" value="1100">
<input type="hidden" name="itemType" value="1130">
<input type="hidden" name="minuteType" value="">


<tr>
    <td colspan="4" class="table-title">请输入查询条件</td>
</tr>
<%--
			   //广西省
			   if(PageComboxOptions.getSheng().equals("GUANGXI")){
				--%>
<tr>
        <td><b>说明：<b></td>
        <td colspan="3" class="two-content"><b>
         需要打印咨询单的用户，请到“企业咨询单打印”菜单进行查询打印！<b>
        </td>
</tr>
<%--}--%>
<tr>
         <td>企业名称</td>
    <td  class="four-content">
        <input type="text" name="qymc" value="<%--=qymc--%>" >
    </td>
    <td>是否已分配管辖单位</td>
    <td class="four-content">
<script>

  function   show(){
  document.all('trGxdw').style.display=event.srcElement.value ;
  document.all('trGxdwkg').style.display=event.srcElement.value;
  document.all('trDJJGone').style.display="block";
  document.all('trDJJGtwo').style.display="none";
  }
   function   sel(){
  document.all('trGxdw').style.display=event.srcElement.value ;
  document.all('trGxdwkg').style.display=event.srcElement.value;
  document.all('trDJJGone').style.display="none";
  document.all('trDJJGtwo').style.display="block";
  }
  </script>
<%--
  if(PageComboxOptions.getSheng().equals("GUANGXI")) {
--%>
   <input name="rad2" type="radio" id ="r21"  value="block"  onClick ="show()"   style="width:auto"/>是
   <input name="rad2" type="radio" id ="r22"  value="none"   onClick="sel()"  style="width:auto"/>否
   <input name="rad2" type="radio" id ="r23"  value="none"   onClick="sel()" checked="checked"  style="width:auto"/>不限制

<%--
}else{	
--%>
  <input name="rad2" type="radio" id ="r21"  value="block" checked="checked" onClick ="show()"   style="width:auto"/>是
  <input name="rad2" type="radio" id ="r22"  value="none" onClick="sel()"  style="width:auto"/>否
  <input name="rad2" type="radio" id ="r23"  value="none" onClick="sel()"  style="width:auto"/>不限制
<%--
}
--%>

    </td>
</tr>

<tr>
     <td>注册号</td>
    <td class="four-content">
        <input type="text" name="zch" value="<%--=zch--%>">
    </td>
    <td>法定代表人</td>
    <td class="four-content">
        <input type="text" name="fddbr" value="<%--=fddbr--%>">
    </td>

</tr>

<tr>
    <td>经营场所</td>
    <td class="four-content">
        <input type="text" name="jydz" value="<%--=jydz--%>" >
    </td>
     <td>档案号</td>
    <td class="four-content">
        <input type="text" name="dah" value="<%--=dah--%>">
    </td>
</tr>
<tr>
    <td>经营范围</td>
    <td colspan="3" class="two-content">
        <input type="text" name="jyfw" maxlength="100" value="<%--=jyfw--%>" class="input-longer">
    </td>
</tr>
<tr>
    <td>企业类型-中类</td>
    <td colspan="3" class="two-content">
        <select name="qylx_zl" id = "qylx_zl"   onchange="Change_Select()">
         <option value="">--不限制--</option>
         <option value="1100">1100-责任有限公司</option>
		 <%--
        out.println(PageComboxOptions.getOptionsQYLX());
				--%>
        </select>
    </td>
    </tr>
    <tr>
    <td>企业类型-小类</td>
    <td colspan="3" class="two-content">
        <select name="qylx_xl" id = "qylx_xl">
		<option value="">--不限制--</option>
         <option value="1110">1100-责任有限公司(国有独资)</option>
        </select>
    </td>

</tr>


<tr>
	<td>行业门类</td>
	 <td class="four-content" >
	 <select name="hmt" id="hmt"  onchange="hylb_Select1()" class="long-select" alt="行业门类">
	   <option value="">--不限制--</option>
	   <option value="A">A-农林牧渔</option>
		 <%--
             out.println(PageComboxOptions.getOptionsHYLB());
				--%>
		</select>
		</td>
		<td>行业大类 </td>
		<td class="four-content">
		<select name="hmi" id="hmi" onchange="hylb_dl_Select2()" class="long-select" alt="行业大类">
		<option value="">--不限制--</option>
		<option value="01">01-农业</option>
</select>
</td>
		</tr>

<tr>	
<td>行业细类</td>
<td class="four-content">
        <select name="hmm" id="hmm"  onchange="hylb_xl_Select3()" class="long-select" alt="行业细类">
         <option value="">--不限制--</option>
		<option value="011">011-谷物种植</option>
</select>
</td>
<td>行业小类</td>
<td class="four-content">
        <select name="hyxxl" id="hyxxl"  class="long-select" alt="行业小类">
        <option value="">--不限制--</option>
        <option value="0111">01-稻谷种植</option>
        
		 

</select>
</td>
</tr>







<tr>
    <td>风险行业</td>
   <td class="four-content">
        <select name="fxhy">
			<option value="">不限制</option>
            <option value="01">01-甲级风险-危险化学品生产、经营</option>
                        <option value="02">02-甲级风险-燃气生产和供应业</option>
                        <option value="03">03-甲级风险-矿产资源开采</option>
                        <option value="04">04-甲级风险-食品生产、经营</option>
                        <option value="05">05-甲级风险-餐饮行业</option>
                        <option value="06">06-甲级风险-民爆器材和烟花爆竹生产、经营</option>
                        <option value="07">07-甲级风险-定点屠宰</option>
                        <option value="08">08-甲级风险-各类可能对生态环境造成严重污染和破坏的</option>
                        <option value="09">09-乙级风险-烟草制品经营</option>
                        <option value="10">10-乙级风险-药品、医疗器械的生产、经营</option>
                        <option value="11">11-乙级风险-化肥、种子等农业生产资料的经营</option>
                        <option value="12">12-乙级风险-棉花、蚕茧收购、加工</option>
                        <option value="13">13-乙级风险-互联网上网服务</option>
                        <option value="14">14-乙级风险-文化娱乐服务</option>
                        <option value="15">15-乙级风险-美容美发、洗浴、住宿</option>
                        <option value="16">16-乙级风险-印刷业</option>
                        <option value="17">17-乙级风险-汽车维修及报废汽车回收</option>
                        <option value="18">18-乙级风险-燃气具安装、维修</option>
						<option value="19">19-乙级风险-废旧物品回收</option>
						<option value="20">20-乙级风险-消防产品经营</option>
						<option value="21">21-乙级风险-各类中介机构</option>
						<option value="22">22-丙级风险-其他类型</option>


        </select>
    </td>
	<td>信用级别</td>
    <td   class="four-content">
           <select name="xyjb">
            <option value="">不限制</option>            
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>            
        </select>
         </td>
</tr>

<tr>

	 <td>经营类别</td>
        <td   class="four-content">
            <select name="jylb" styleClass="long-select">
                  <option value="" tourl="<%--=jylb--%>">不限制</option>
                 

<!--                         out.println(PageComboxOptions.getJylb()); -->

               
            </select>
        </td>

   
     <td>企业属性</td>
                         <td class="four-content">
                                 <input type="checkbox" name="qysx" id="qysx0" checked  style="width:auto"/>
                                  内  <input type="checkbox" name="qysx" id="qysx1" checked style="width:auto" />
                                  外  <input type="checkbox" name="qysx" id="qysx2" checked  style="width:auto" />
                                  私
                                  <input type="checkbox" name="qysx" id="qysx3" checked style="width:auto" />
                                  个
								  <input type="checkbox" name="qysx" id="qysx4" checked style="width:auto" />
                                  农合
                        </td>

</tr>
<tr>
    <td>企业状态</td>
    <td class="four-content">
        <select name="zt">
            <option value="">不限制</option>
			<option value="06" selected = true>在业</option>
            <option value="07">注销</option>
            <option value="11">吊销</option>
        </select>
    </td>
   
    <td>登记类型</td>
    <td class="four-content">
        <select name="djlx">
			<option value="">不限制</option>
            <option value="01">正常</option>
            <option value="02">备案</option>
            <option value="03">迁入</option>
            <option value="04">改制</option>
            <option value="05">集团</option>
        </select>
    </td>
   


</tr>

<tr>
    <td>成立日期起 *</td>
    <td class="four-content">
        <input type="text" name="cjrqq" value="<%--=cjrqq--%>" id="calendar">
    </td>
    <td>成立日期止 *</td>
    <td class="four-content">
        <input type="text" name="cjrqz" value="<%--=cjrqz--%>" id="calendar">
    </td>
</tr>


<tr>
    <td>核准日期起 *</td>
    <td class="four-content">
        <input type="text" name="hzrqq" value="<%--=hzrqq--%>" id="calendar">
    </td>
    <td>核准日期止 *</td>
    <td class="four-content">
        <input type="text" name="hzrqz" value="<%--=hzrqz--%>" id="calendar">
    </td>
</tr>

<tr id="trDJJGone">
        <td>登记机关</td>
        <td colspan="3" class="two-content">
            <select name="djjgone" styleClass="long-select">
               
                   <!--  if ("".equals(porgid)) {
                           out.println(PageComboxOptions.getOptionsJG(orgid));
                    } else {
                        out.println(PageComboxOptions.getNoSctWithPorgidOptionsDJJG(orgid));
                    } -->
               
            </select>
        </td>
</tr>
<tr id="trDJJGtwo" style="display:none;">
        <td>登记机关</td>
        <td colspan="3" class="two-content">
            <select name="djjgtwo" styleClass="long-select">
                  <%--
                    if ("".equals(porgid)) {
                           out.println(PageComboxOptions.getOptionsJG(orgid));
                    } else {
                        out.println(PageComboxOptions.getNoSctWithPorgidOptionsGXDW(orgid));
                    }
                --%>
            </select>
        </td>
</tr>

<tr>
                       <td colspan="2" class="two-content"  ><div align="right">
                           <input type="checkbox" name="chk1" align="left"   title="是否查询下级机关所登记的企业"style="width:auto"/>  选中则查询范围包括下级登记机关
                  </div>  </td>


                       <td style="width:auto"> </td>

                 <td class="two-content"></td>
            </tr>




   <%--
  if(PageComboxOptions.getSheng().equals("GUANGXI")) {
--%>
   <tr id="trGxdw" style="display:none;">
        <td>管辖单位</td>
        <td colspan="3" class="two-content">
            <select name="gxdw" styleClass="long-select">
                   <%--
                    if ("".equals(porgid)) {
                           out.println(PageComboxOptions.getOptionsJG(orgid));
                    } else {
                        out.println(PageComboxOptions.getNoSctWithPorgidOptionsGXDW(orgid));
                    }
                --%>
            </select>
        </td>

    

  </tr>


<tr id="trGxdwkg" style="display:none;">
    <td colspan="2" class="two-content"  ><div align="right">
         <input type="checkbox" name="chk2" title="是否查询下级机关所管辖的企业"    style="width:auto"/>  选中则查询范围包括下级管辖机关</div>
        </td>

    <td >
            </td>

                 <td class="two-content"></td>


</tr>     

<%--
}else{	
--%>
 <tr id="trGxdw" >
        <td>管辖单位</td>
        <td colspan="3" class="two-content">
            <select name="gxdw" styleClass="long-select">
                   <%--
                    if ("".equals(porgid)) {
                           out.println(PageComboxOptions.getOptionsJG(orgid));
                    } else {
                        out.println(PageComboxOptions.getNoSctWithPorgidOptionsGXDW(orgid));
                    }
                --%>
            </select>
        </td>

    

  </tr>


<tr id="trGxdwkg">
    <td colspan="2" class="two-content"  ><div align="right">
         <input type="checkbox" name="chk2" title="是否查询下级机关所管辖的企业"    style="width:auto"/>  选中则查询范围包括下级管辖机关</div>
        </td>

    <td >
            </td>

                 <td class="two-content"></td>


</tr>
<%--
}
--%>


</table>



<table class="table-button">
    <tr>
        <td>
        <input type="button" name="viewReportB"  value="确定"  onclick="viewReport()"/>
            
			<%--
			   //河南省
			   if(PageComboxOptions.getSheng().equals("HENAN")){  
				--%>
				
				
					
			<%--
				//安徽省
				}	else if(PageComboxOptions.getSheng().equals("ANHUI")){
			--%>
<!-- 			<input type="button" name="viewReportB"  value="确定"  onclick="viewReport()"/> -->
			
			<%--
				//青海省
				}	else if(PageComboxOptions.getSheng().equals("QINGHEI")){
			--%>
<!-- 			<input type="button" name="viewReportB"  value="确定"  onclick="viewReport_qh()"/> -->
			

			<%--
				//西藏省
				}	else if(PageComboxOptions.getSheng().equals("XIZANG")){
			--%>
<!-- 			<input type="button" name="viewReportB"  value="确定"  onclick="viewReport_xz()"/> -->
			
			<%--
				//广西省
				}	else if(PageComboxOptions.getSheng().equals("GUANGXI")){
			--%>
<!-- 			<input type="button" name="viewReportB"  value="确定"  onclick="viewReport_gx()"/> -->
			

			 <%--}--%>
			 <input type="reset" class="cancle" value="重置"/>
			<input type="button" name="viewReportA"  value="说明"  onclick="viewReport1()"/>
                
        </td>
    </tr>
</table>


<table  style="width:700px;height:250px" >
<tr>
<td>
<div data-options="region:'center',collapsed:false,border:false,height:360">
<table id="demoGrid"></table> 
 <table id="dg" title="Client Side Pagination" style="width:700px;height:300px" data-options="
				rownumbers:true,
				singleSelect:true,
				autoRowHeight:false,
				pagination:true,
				pageSize:10">
		<thead>
			<tr>
				<!-- <th field="entname" width="80">公司名称</th>
				<th field="regno" width="100">注册号</th> -->
			</tr>
		</thead>
	</table> 
</div>
</td>
</tr>
</table>

</form>


<!--内容页面end-->
</td>
</tr>
</table>
<!--页面框架end-->
</body>
</html>
<script language="javascript">

    //页面中插入title
    document.all.pageTitle.innerHTML = "登记查询》企业信息综合查询";
</script>



<script type="text/javascript">
    //getPageTitle();     //设置导航栏的标题



   function viewReport1() {
    //if (checkYear()) {
    var sqlStr = "&qysx=14";
     window.showModalDialog('/pages/query/reg/EntTjsysm.jsp?sqlStr='+sqlStr,sqlStr,'status:no;center:yes;help:no;minimize:no;maximize:no;close:no;dialogWidth:560px; dialogHeight:200px');
}

    function viewReport9999999999999999() { 
    	alert("111");   //拼装转发参数
        if (!isRequired())return false;
        var root_bb= document.URL  ;
                //  root_bb= root_bb.slice(7) ;
                  var sz_root=root_bb.split("/");
                  root_bb=sz_root[2];

        var queryStr = "&qymc=" + document.all.qymc.value;
        queryStr += "&zch=" + document.all.zch.value;
        queryStr += "&fddbr=" + document.all.fddbr.value;
        queryStr += "&jydz=" + document.all.jydz.value;
        queryStr += "&jyfw=" + document.all.jyfw.value;


//        alert(""+queryStr)

     if(document.all.hmt.value=="99")
		{
          queryStr += "&hmt=" + "";
         }
         else
         {
          queryStr += "&hmt=" + document.all.hmt.value;
         }

		  if(document.all.hmi.value=="99")
		{
          queryStr += "&hmi=" + "";
         }
         else
         {
          queryStr += "&hmi=" + document.all.hmi.value;
         }

		 queryStr += "&xyjb=" + document.all.xyjb.value;

		  if(document.all.hmm.value=="99")
		{
          queryStr += "&hmm=" + "";
         }
         else
         {
          queryStr += "&hmm=" + document.all.hmm.value;
         }

		  if(document.all.hyxxl.value=="99")
		{
          queryStr += "&hyxl=" + "";
         }
         else
         {
          queryStr += "&hyxl=" + document.all.hyxxl.value;
         }

        queryStr += "&qylx_zl=" + document.all.qylx_zl.value;
        if(document.all.qylx_xl.value=='99'){
			queryStr += "&qylx_xl=";
		}
		else
		{
			queryStr += "&qylx_xl=" + document.all.qylx_xl.value;
		}
        queryStr += "&zt=" + document.all.zt.value;
        queryStr += "&fxhy=" + document.all.fxhy.value;
        queryStr += "&jylb=" + document.all.jylb.value;
        queryStr += "&cjrqq=" + document.all.cjrqq.value;
        queryStr += "&cjrqz=" + document.all.cjrqz.value;
        queryStr += "&hzrqq=" + document.all.hzrqq.value;
        queryStr += "&hzrqz=" + document.all.hzrqz.value;
        queryStr += "&djlx=" + document.all.djlx.value;
        queryStr += "&dah=" + document.all.dah.value;
           queryStr += "&root_bb=" + root_bb;
        if(document.all.chk1.checked )
         {
         queryStr += "&djjgkg=1";
         }
         else
         {
         queryStr += "&djjgkg=0";
         }
    var qysx =  document.all.qysx;
    var nzkg =  qysx[0].checked?'01':'';
    var wzkg =  qysx[1].checked?'02':'';
    var sykg =  qysx[2].checked?'03':'';
    var gtkg =  qysx[3].checked?'04':'';
	var nhkg =  qysx[4].checked?'07':'';
	

    queryStr += "&nzkg="+ nzkg ;
    queryStr += "&wzkg="+ wzkg ;
    queryStr += "&sykg="+ sykg ;
    queryStr += "&gtkg="+ gtkg ;
	queryStr += "&nhkg="+ nhkg ;
   alert(123);
        
            queryStr += "&gxdw=" + document.all.gxdw.value;
            queryStr += "&djjg=" + document.all.djjgone.value;
            if(document.all.chk2.checked )
             {
             queryStr += "&gxdwkg=1";
             }
             else
             {
             queryStr += "&gxdwkg=0";
             }
    
     
		   window.location.href = "/topbirt/frameset?__report=EntBaseInfoQuery_h.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
		
     if(document.all.rad2[1].checked ){    
      	queryStr += "&djjg=" + document.all.djjgtwo.value;
	  
            window.location.href = "/topbirt/frameset?__report=EntBaseNogxdw_h.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
       
			}
     if(document.all.rad2[2].checked ){     
     	queryStr += "&djjg=" + document.all.djjgtwo.value;
        
			window.location.href = "/topbirt/frameset?__report=EntBasebxz_h.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
			//alert(queryStr);
		
            
        }
    }
    function viewReport_xz() {    //拼装转发参数
        if (!isRequired())return false;
        var root_bb= document.URL  ;
                //  root_bb= root_bb.slice(7) ;
                  var sz_root=root_bb.split("/");
                  root_bb=sz_root[2];

        var queryStr = "&qymc=" + document.all.qymc.value;
        queryStr += "&zch=" + document.all.zch.value;
        queryStr += "&fddbr=" + document.all.fddbr.value;
        queryStr += "&jydz=" + document.all.jydz.value;
        queryStr += "&jyfw=" + document.all.jyfw.value;


//        alert(""+queryStr)

     if(document.all.hmt.value=="99")
		{
          queryStr += "&hmt=" + "";
         }
         else
         {
          queryStr += "&hmt=" + document.all.hmt.value;
         }

		  if(document.all.hmi.value=="99")
		{
          queryStr += "&hmi=" + "";
         }
         else
         {
          queryStr += "&hmi=" + document.all.hmi.value;
         }

		 queryStr += "&xyjb=" + document.all.xyjb.value;

		  if(document.all.hmm.value=="99")
		{
          queryStr += "&hmm=" + "";
         }
         else
         {
          queryStr += "&hmm=" + document.all.hmm.value;
         }
        if(document.all.hyxxl.value=="99")
		{
          queryStr += "&hyxl=" + "";
         }
         else
         {
          queryStr += "&hyxl=" + document.all.hyxxl.value;
         }
        queryStr += "&qylx_zl=" + document.all.qylx_zl.value;
        if(document.all.qylx_xl.value=='99'){
			queryStr += "&qylx_xl=";
		}
		else
		{
			queryStr += "&qylx_xl=" + document.all.qylx_xl.value;
		}
        queryStr += "&zt=" + document.all.zt.value;
        queryStr += "&fxhy=" + document.all.fxhy.value;
        queryStr += "&jylb=" + document.all.jylb.value;
        queryStr += "&cjrqq=" + document.all.cjrqq.value;
        queryStr += "&cjrqz=" + document.all.cjrqz.value;
        queryStr += "&hzrqq=" + document.all.hzrqq.value;
        queryStr += "&hzrqz=" + document.all.hzrqz.value;
        queryStr += "&djlx=" + document.all.djlx.value;
        queryStr += "&dah=" + document.all.dah.value;
           queryStr += "&root_bb=" + root_bb;
        if(document.all.chk1.checked )
         {
         queryStr += "&djjgkg=1";
         }
         else
         {
         queryStr += "&djjgkg=0";
         }
    var qysx =  document.all.qysx;
    var nzkg =  qysx[0].checked?'01':'';
    var wzkg =  qysx[1].checked?'02':'';
    var sykg =  qysx[2].checked?'03':'';
    var gtkg =  qysx[3].checked?'04':'';
	var nhkg =  qysx[4].checked?'07':'';
	

    queryStr += "&nzkg="+ nzkg ;
    queryStr += "&wzkg="+ wzkg ;
    queryStr += "&sykg="+ sykg ;
    queryStr += "&gtkg="+ gtkg ;
	queryStr += "&nhkg="+ nhkg ;
    if(document.all.rad2[0].checked )
        {
            queryStr += "&gxdw=" + document.all.gxdw.value;
            queryStr += "&djjg=" + document.all.djjgone.value;
            if(document.all.chk2.checked )
             {
             queryStr += "&gxdwkg=1";
             }
             else
             {
             queryStr += "&gxdwkg=0";
             }
     
		   window.location.href = "/topbirt/frameset?__report=EntBaseInfoQuery_xz.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
		}
     if(document.all.rad2[1].checked )
      {    queryStr += "&djjg=" + document.all.djjgtwo.value;
	  
            window.location.href = "/topbirt/frameset?__report=EntBaseNogxdw_xz.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
       
			}
     if(document.all.rad2[2].checked )
      {     queryStr += "&djjg=" + document.all.djjgtwo.value;
        
			window.location.href = "/topbirt/frameset?__report=EntBasebxz_xz.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
			//alert(queryStr);
		
            
        }
    }
	function viewReport_gx() {    //拼装转发参数
        if (!isRequired())return false;
        var root_bb= document.URL  ;
                //  root_bb= root_bb.slice(7) ;
                  var sz_root=root_bb.split("/");
                  root_bb=sz_root[2];

        var queryStr = "&qymc=" + document.all.qymc.value;
        queryStr += "&zch=" + document.all.zch.value;
        queryStr += "&fddbr=" + document.all.fddbr.value;
        queryStr += "&jydz=" + document.all.jydz.value;
        queryStr += "&jyfw=" + document.all.jyfw.value;


//        alert(""+queryStr)

     if(document.all.hmt.value=="99")
		{
          queryStr += "&hmt=" + "";
         }
         else
         {
          queryStr += "&hmt=" + document.all.hmt.value;
         }

		  if(document.all.hmi.value=="99")
		{
          queryStr += "&hmi=" + "";
         }
         else
         {
          queryStr += "&hmi=" + document.all.hmi.value;
         }

		 queryStr += "&xyjb=" + document.all.xyjb.value;

		  if(document.all.hmm.value=="99")
		{
          queryStr += "&hmm=" + "";
         }
         else
         {
          queryStr += "&hmm=" + document.all.hmm.value;
         }
         if(document.all.hyxxl.value=="99")
		{
          queryStr += "&hyxl=" + "";
         }
         else
         {
          queryStr += "&hyxl=" + document.all.hyxxl.value;
         }
        queryStr += "&qylx_zl=" + document.all.qylx_zl.value;
        if(document.all.qylx_xl.value=='99'){
			queryStr += "&qylx_xl=";
		}
		else
		{
			queryStr += "&qylx_xl=" + document.all.qylx_xl.value;
		}
        queryStr += "&zt=" + document.all.zt.value;
        queryStr += "&fxhy=" + document.all.fxhy.value;
        queryStr += "&jylb=" + document.all.jylb.value;
        queryStr += "&cjrqq=" + document.all.cjrqq.value;
        queryStr += "&cjrqz=" + document.all.cjrqz.value;
        queryStr += "&hzrqq=" + document.all.hzrqq.value;
        queryStr += "&hzrqz=" + document.all.hzrqz.value;
        queryStr += "&djlx=" + document.all.djlx.value;
        queryStr += "&dah=" + document.all.dah.value;
           queryStr += "&root_bb=" + root_bb;
        if(document.all.chk1.checked )
         {
         queryStr += "&djjgkg=1";
         }
         else
         {
         queryStr += "&djjgkg=0";
         }
    var qysx =  document.all.qysx;
    var nzkg =  qysx[0].checked?'01':'';
    var wzkg =  qysx[1].checked?'02':'';
    var sykg =  qysx[2].checked?'03':'';
    var gtkg =  qysx[3].checked?'04':'';
	var nhkg =  qysx[4].checked?'07':'';
	

    queryStr += "&nzkg="+ nzkg ;
    queryStr += "&wzkg="+ wzkg ;
    queryStr += "&sykg="+ sykg ;
    queryStr += "&gtkg="+ gtkg ;
	queryStr += "&nhkg="+ nhkg ;
    if(document.all.rad2[0].checked )
        {
            queryStr += "&gxdw=" + document.all.gxdw.value;
            queryStr += "&djjg=" + document.all.djjgone.value;
            if(document.all.chk2.checked )
             {
             queryStr += "&gxdwkg=1";
             }
             else
             {
             queryStr += "&gxdwkg=0";
             }
     
		   window.location.href = "/topbirt/frameset?__report=EntBaseInfoQuery_gx.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
		}
     if(document.all.rad2[1].checked )
      {    queryStr += "&djjg=" + document.all.djjgtwo.value;
	  
            window.location.href = "/topbirt/frameset?__report=EntBaseNogxdw_gx.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
       
			}
     if(document.all.rad2[2].checked )
      {     queryStr += "&djjg=" + document.all.djjgtwo.value;
        
			window.location.href = "/topbirt/frameset?__report=EntBasebxz_gx.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
			//alert(queryStr);
		
            
        }
    }

	 function viewReport_qh() {    //拼装转发参数
        if (!isRequired())return false;
        var root_bb= document.URL  ;
                //  root_bb= root_bb.slice(7) ;
                  var sz_root=root_bb.split("/");
                  root_bb=sz_root[2];

        var queryStr = "&qymc=" + document.all.qymc.value;
        queryStr += "&zch=" + document.all.zch.value;
        queryStr += "&fddbr=" + document.all.fddbr.value;
        queryStr += "&jydz=" + document.all.jydz.value;
        queryStr += "&jyfw=" + document.all.jyfw.value;


//        alert(""+queryStr)

     if(document.all.hmt.value=="99")
		{
          queryStr += "&hmt=" + "";
         }
         else
         {
          queryStr += "&hmt=" + document.all.hmt.value;
         }

		  if(document.all.hmi.value=="99")
		{
          queryStr += "&hmi=" + "";
         }
         else
         {
          queryStr += "&hmi=" + document.all.hmi.value;
         }

		 queryStr += "&xyjb=" + document.all.xyjb.value;

		  if(document.all.hmm.value=="99")
		{
          queryStr += "&hmm=" + "";
         }
         else
         {
          queryStr += "&hmm=" + document.all.hmm.value;
         }
           if(document.all.hyxxl.value=="99")
		{
          queryStr += "&hyxl=" + "";
         }
         else
         {
          queryStr += "&hyxl=" + document.all.hyxxl.value;
         }
        queryStr += "&qylx_zl=" + document.all.qylx_zl.value;
        if(document.all.qylx_xl.value=='99'){
			queryStr += "&qylx_xl=";
		}
		else
		{
			queryStr += "&qylx_xl=" + document.all.qylx_xl.value;
		}
        queryStr += "&zt=" + document.all.zt.value;
        queryStr += "&fxhy=" + document.all.fxhy.value;
        queryStr += "&jylb=" + document.all.jylb.value;
        queryStr += "&cjrqq=" + document.all.cjrqq.value;
        queryStr += "&cjrqz=" + document.all.cjrqz.value;
        queryStr += "&hzrqq=" + document.all.hzrqq.value;
        queryStr += "&hzrqz=" + document.all.hzrqz.value;
        queryStr += "&djlx=" + document.all.djlx.value;
        queryStr += "&dah=" + document.all.dah.value;
           queryStr += "&root_bb=" + root_bb;
        if(document.all.chk1.checked )
         {
         queryStr += "&djjgkg=1";
         }
         else
         {
         queryStr += "&djjgkg=0";
         }
    var qysx =  document.all.qysx;
    var nzkg =  qysx[0].checked?'01':'';
    var wzkg =  qysx[1].checked?'02':'';
    var sykg =  qysx[2].checked?'03':'';
    var gtkg =  qysx[3].checked?'04':'';
	var nhkg =  qysx[4].checked?'07':'';
	

    queryStr += "&nzkg="+ nzkg ;
    queryStr += "&wzkg="+ wzkg ;
    queryStr += "&sykg="+ sykg ;
    queryStr += "&gtkg="+ gtkg ;
	queryStr += "&nhkg="+ nhkg ;
    if(document.all.rad2[0].checked )
        {
            queryStr += "&gxdw=" + document.all.gxdw.value;
            queryStr += "&djjg=" + document.all.djjgone.value;
            if(document.all.chk2.checked )
             {
             queryStr += "&gxdwkg=1";
             }
             else
             {
             queryStr += "&gxdwkg=0";
             }
     
		   window.location.href = "/topbirt/frameset?__report=EntBaseInfoQuery_qh.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
		}
     if(document.all.rad2[1].checked )
      {    queryStr += "&djjg=" + document.all.djjgtwo.value;
	  
            window.location.href = "/topbirt/frameset?__report=EntBaseNogxdw_qh.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
       
			}
     if(document.all.rad2[2].checked )
      {     queryStr += "&djjg=" + document.all.djjgtwo.value;
        
			window.location.href = "/topbirt/frameset?__report=EntBasebxz_qh.rptdesign" + queryStr + "<%--=commoninfo--%>&__overwrite=true";
			//alert(queryStr);
		
            
        }
    }
    function isRequired() { //检查日期输入域
        var cjrqq = document.all.cjrqq.value;
        var cjrqz = document.all.cjrqz.value;
        var hzrqq = document.all.hzrqq.value;
        var hzrqz = document.all.hzrqz.value;
        if (cjrqq == "" && cjrqz == "") {
            alert("请输入“成立日期起”和“成立日期止”！");
            return false;
        }
        if (hzrqq == "" && hzrqz == "") {
            alert("请输入“核准日期起”和“核准日期止”！");
            return false;
        }
        if (cjrqq == "") {
            alert("请输入“成立日期起”！");
            return false;
        }
        if (hzrqq == "") {
            alert("请输入“核准日期起”！");
            return false;
        }
        if (cjrqz == "") {
            alert("请输入“成立日期止”！");
            return false;
        }
        if (hzrqz == "") {
            alert("请输入“核准日期止”！");
            return false;
        }
        if (!checkStrDate(cjrqq, cjrqz)) {
            alert("“成立日期止”不能早于“成立日期起！");
            return false;
        }
        if (!checkStrDate(hzrqq, hzrqz)) {
            alert("“核准日期止”不能早于“核准日期起！");
            return false;
        } else {
            return true;
        }
    }

</script>
