<%@ page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统主操作区页面模板</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/etc/common/style/topicms.css" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/etc/grid/grid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/etc/calendar/calendar.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath}/etc/common/script/topicms.js"></script>
    

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery/themes/icon.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/locale/easyui-lang-zh_CN.js"></script>



<script type="text/javascript">
	var app_path= "";
	var takes;
	var pageSize;
	//var start;
	function viewReport(){  
   	   //拼 装转发参数
   	   var queryStr = "";
   	   var fqStr = "";
   	   if(document.all.qymc.value!=""){
   	   		queryStr = encodeURIComponent(' +entname:') + encodeURIComponent('*'+document.all.qymc.value+'*');//企业名称
	   }
	  
      
	   if(document.all.zch.value!=""){//oldregno
	     	queryStr += encodeURIComponent(" +(regno:") + encodeURIComponent('*'+document.all.zch.value) +   encodeURIComponent(" OR oldregno:")+ encodeURIComponent('*'+document.all.zch.value)+")";//注册号
	   }
	   if(document.all.fddbr.value!=""){
	     	queryStr += encodeURIComponent(" +lerep:") + encodeURIComponent('*'+document.all.fddbr.value+'*');//法定代表人
	   }
       if(document.all.jydz.value!=""){
       		queryStr += encodeURIComponent(" +oploc:") + encodeURIComponent('*'+document.all.jydz.value+'*');//经营场所
       }
       if(document.all.dah.value!=""){
        	queryStr += encodeURIComponent(" +archno:") + encodeURIComponent('*'+document.all.dah.value);//档案号
       }
       if(document.all.jyfw.value!=""){
       		queryStr += encodeURIComponent(" +opscope:") + encodeURIComponent('*'+document.all.jyfw.value+'*');//经营范围
       }
       if(document.all.qylx_zl.value!=""){
       		queryStr += encodeURIComponent(" +enttype:") + encodeURIComponent(document.all.qylx_zl.value); //企业中类
       }
       if( document.all.qylx_xl.value!=""){
       		queryStr += encodeURIComponent(" +enttypeitem:") + encodeURIComponent(document.all.qylx_xl.value); //企业类型-小类
       }
       if(document.all.hmt.value!=""){
       		queryStr += encodeURIComponent(" +industryphy:") + encodeURIComponent(document.all.hmt.value); //行业门类
       }
       if(document.all.hmi.value!=""){
       		queryStr += encodeURIComponent(" +industrycoda:") + encodeURIComponent(document.all.hmi.value); //行业大类
       }
       if( document.all.hmm.value!=""){
       		queryStr += encodeURIComponent(" +industrycoxi:") + encodeURIComponent(document.all.hmm.value);//行业细类 
       }
       if(document.all.hyxxl.value!=""){
       		queryStr += encodeURIComponent(" +industrycoxiao:") + encodeURIComponent(document.all.hyxxl.value); //行业小类
       }
       if( document.all.fxhy.value!=""){
       		queryStr += encodeURIComponent(" +venind:") + document.all.fxhy.value;//风险行业
       }
       if(document.all.xyjb.value!=""){
       		queryStr += encodeURIComponent(" +credLevel:") + encodeURIComponent(document.all.xyjb.value);//信用级别
       }
       if(document.all.jylb.value!=""){
        	queryStr += encodeURIComponent(" +optype:") + document.all.jylb.value;//经营类别
       }
       //企业属性
       var qysx =  document.all.qysx;
       
       var is_fist = true;
       for(var i = 0;i<qysx.length;i++){
    	   var value = qysx[i].checked?'0'+(i+1):'';
    	   if(i==4)
    		  value = qysx[i].checked?'07':'';
    	   
    	   if(value!=""){
    		   if(is_fist){
    			   is_fist = false;
    			   queryStr += encodeURIComponent(" +(enttypepro:")+ encodeURIComponent(value);
    		   }else{
    			   queryStr += encodeURIComponent(" OR enttypepro:")+ encodeURIComponent(value);
    		   }
    	   }
       }
       if(!is_fist){
    	   queryStr += encodeURIComponent(" )");
       }
       
       if(document.all.zt.value!=""){
      		queryStr += encodeURIComponent(" +state:") + encodeURIComponent(document.all.zt.value);//企业状态
       } 
       
       if(document.all.djlx.value!=""){
     		queryStr += encodeURIComponent(" +regtype:") + encodeURIComponent(document.all.djlx.value);//regtype 登记类型
       } 
       
       
       
      if(document.all.cjrqq.value==""&&document.all.cjrqz.value!=""){
    	  queryStr +=  encodeURIComponent(" +estDate:[* TO ")+encodeURIComponent(document.all.cjrqz.value)+encodeURIComponent("T23:59:59Z]");
      }
      if(document.all.cjrqq.value!=""&&document.all.cjrqz.value==""){
    	  queryStr +=  encodeURIComponent(" +estDate:[")+encodeURIComponent(document.all.cjrqq.value)+encodeURIComponent("T00:00:00Z TO NOW]");
      }
      if(document.all.cjrqq.value!=""&&document.all.cjrqz.value!=""){
    	  queryStr +=  encodeURIComponent(" +estDate:[")+encodeURIComponent(document.all.cjrqq.value)+encodeURIComponent("T00:00:00Z TO ")+
    	  encodeURIComponent(document.all.cjrqz.value)+encodeURIComponent("T23:59:59Z]");
      }
      
      if(document.all.hzrqq.value==""&&document.all.hzrqz.value!=""){
    	  queryStr +=  encodeURIComponent(" +apprdate:[* TO ")+encodeURIComponent(document.all.hzrqz.value)+encodeURIComponent("T23:59:59Z]");
      }
      if(document.all.hzrqq.value!=""&&document.all.cjrqz.value==""){
    	  queryStr +=  encodeURIComponent(" +apprdate:[")+encodeURIComponent(document.all.hzrqq.value)+encodeURIComponent("T00:00:00Z TO NOW]");
      }
      if(document.all.hzrqq.value!=""&&document.all.cjrqz.value!=""){
    	  queryStr +=  encodeURIComponent(" +apprdate:[")+encodeURIComponent(document.all.hzrqq.value)+encodeURIComponent("T00:00:00Z TO ")+
    	  encodeURIComponent(document.all.hzrqz.value)+encodeURIComponent("T23:59:59Z]");
      }
      
      
      
      
      var include_orgId = document.all.chk1;
      var include_superid = document.all.chk2;
      if(include_orgId.checked){
   		fqStr +="&fq="+ encodeURIComponent("{!join from=marpripinfo_zid to=orgId fromIndex=collection2}rootid:")+encodeURIComponent(document.all.djjgone.value);
      }else{
	    		queryStr += encodeURIComponent(" +orgId:") + encodeURIComponent(document.all.djjgone.value);//登记机关  chk1
      }
      if(include_superid.checked){
  		fqStr += "&fq="+encodeURIComponent("{!join from=marpripinfo_zid to=superorgid fromIndex=collection2}rootid:")+encodeURIComponent(document.all.djjgone.value);

      }else{
		   	  	queryStr += encodeURIComponent(" +superorgid:") + encodeURIComponent(document.all.gxdw.value);//管辖单位
      }
       if(fqStr == ""){
        	app_path = "${pageContext.request.contextPath}"+"/collection1/select?q="+queryStr+"&wt=json&indent=true&start=0&rows=20&sort=rownoi+asc";
    	   
       }else{
    	   app_path = "${pageContext.request.contextPath}"+"/collection1/select?q="+queryStr+fqStr+"&wt=json&indent=true&start=0&rows=20&sort=rownoi+asc";
       }
      	//init_ent_grid(app_path);
      	
      	
      	
      	create_table(app_path);
      	
      	
      	
      	
      	
      	//AddRow()
<%-- 		   //window.location.href = "/topbirt/frameset?__report=EntBaseInfoQuery_h.rptdesign" + queryStr + "=commoninfo&__overwrite=true"; --%>
    
    }
	
	function create_table(app_path){
		 $.ajax({
             type : "post",
             url : app_path,
             dataType : "json",
             success : function (data) {
               takes = data.responseHeader.QTime;
               totals=data.response.numFound;
               pageSize=data.responseHeader.params.rows;
			   rows= data.response.docs;
			   
			   var table=document.getElementById("DetailInfo");
		        var oBody=table.tBodies[0];
		        var r=oBody.rows;
		        for(var i=r.length;i>=1;i--)
		        {
		            oBody.deleteRow(rows[i]);
		        } 
			   
			   for(var i = 0;i<rows.length;i++){
				   AddRow(rows[i]);
			   }
			   create_pp(totals,pageSize);
			   $("#tm").text("查询结果耗时: " +takes+" 毫秒");
			   $('#pp').pagination('refresh',{	
					total: totals,
					pageNumber: 1
				});
             },
             error : function () {
                 error.apply(this, arguments);
             }
         });
	}
	
	function create_pp(totals,pageSize){
		$('#pp').pagination({  
			total:totals,  
			pageSize:pageSize,  
			showPageList:false,
			showRefresh:false,
			onSelectPage:function(pageNum, pageSize) {
				
				var start = app_path.indexOf("&start");
				var end  = app_path.indexOf("&rows");
				if(start==-1&&end==-1){
					app_path =  app_path+"&start="+((pageNum-1)*pageSize)+"&rows=20";
				}else{
					app_path =app_path.substr(0,start)+"&start="+((pageNum-1)*pageSize)+"&rows=20";
					
				}
				
				$.ajax({
		             type : "post",
		             url : app_path,
		             dataType : "json",
		             success : function (data) {
		               takes = data.responseHeader.QTime;
		               totals=data.response.numFound;
		               pageSize=data.responseHeader.params.rows;
					   rows= data.response.docs;
					   
					   var table=document.getElementById("DetailInfo");
				        var oBody=table.tBodies[0];
				        var r=oBody.rows;
				        for(var i=r.length;i>=1;i--)
				        {
				            oBody.deleteRow(rows[i]);
				        } 
					   
					   for(var i = 0;i<rows.length;i++){
						   AddRow(rows[i]);
					   }
					   //create_pp(totals,pageSize);
					   $("#tm").text("查询结果耗时: " +takes+" 毫秒");
					   //success(row);
		             },
		             error : function () {
		                 error.apply(this, arguments);
		             }
		         });
				//reload(number,size,pager.pagination('options').total);
			},
			onBeforeRefresh:function(number, size){
				//clearGrid();
			}
		});  

		
	}
	
	
	
	
	

	function AddRow(row){
		
		var table=document.getElementById("DetailInfo");
        var oBody=table.tBodies[0];
        var rowIndex=oBody.rows.length;
        oBody.insertRow(rowIndex);
        
        oBody.rows[rowIndex].insertCell(0);
        oBody.rows[rowIndex].cells[0].appendChild(document.createTextNode(row.entname));
        oBody.rows[rowIndex].cells[0].noWrap=true;
        
        oBody.rows[rowIndex].insertCell(1);
        oBody.rows[rowIndex].cells[1].appendChild(document.createTextNode(row.regno));
        oBody.rows[rowIndex].cells[1].noWrap=true;
        
        oBody.rows[rowIndex].insertCell(2);
        oBody.rows[rowIndex].cells[2].appendChild(document.createTextNode(row.tel));
        oBody.rows[rowIndex].cells[2].noWrap=true;
        
        oBody.rows[rowIndex].insertCell(3);
        oBody.rows[rowIndex].cells[3].appendChild(document.createTextNode(row.enttypename));
        oBody.rows[rowIndex].cells[3].noWrap=true;
        
        oBody.rows[rowIndex].insertCell(4);
        oBody.rows[rowIndex].cells[4].appendChild(document.createTextNode(row.industryphyname));
        oBody.rows[rowIndex].cells[4].noWrap=true;
        
        oBody.rows[rowIndex].insertCell(5);
        oBody.rows[rowIndex].cells[5].appendChild(document.createTextNode(row.industrycoxiname));
        oBody.rows[rowIndex].cells[5].noWrap=true;
        
        oBody.rows[rowIndex].insertCell(6);
        oBody.rows[rowIndex].cells[6].appendChild(document.createTextNode(row.lerep));
        oBody.rows[rowIndex].cells[6].noWrap=true;
        
        oBody.rows[rowIndex].insertCell(7);
        oBody.rows[rowIndex].cells[7].appendChild(document.createTextNode(row.oploc));
        oBody.rows[rowIndex].cells[7].noWrap=true;
        
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
		                    dataType : "json",
		                    success : function (data) {
		                      takes = data.responseHeader.QTime;
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
		                width:1000,
		    			height:250,
		    			loadFilter:function(r){
	                    	   r = {
	               					total:totals,
	               					rows: row
	               				};
	                    	   return r;
	                    },
	                    onLoadSuccess:function(data){
	                    	
	                    	$("#demoGrid").datagrid("getPanel").panel("setTitle","查询结果展示          耗时  "+takes+" 毫秒");
	                    	
	                    },
	                    onBeforeLoad:function(param){
	                    	//start = new Date().getTime();
	                    },
		                columns:[[
		                    {field:'entname',title:'企业名称',formatter:entname_link},
		                    {field:'regno',title:'注册号',formatter:regno_link},
		                    {field:'tel',title:'联系电话'},
		                    {field:'enttypename',title:'企业类型名称'},
		                    {field:'industryphyname',title:'行业门类名称'},
		                    {field:'industrycoxiname',title:'行业细类名称'},
		                    {field:'lerep',title:'法人代表人'},
		                    {field:'oploc',title:'经营地址'},
		                    {field:'opscope',title:'经营范围'},
		                    
		                    {field:'ConGro',title:'投资总额'},
		                    {field:'meConGroUSD',title:'投资总额折美元'},
		                    {field:'sszbzwmy',title:'实收资本折万美元'},
		                    {field:'zzczb',title:'总注册资本'},
		                    {field:'zczbzmy',title:'注册资本折美元'},
		                    
		                    {field:'estDate',title:'创建日期',formatter:_format},
		                    {field:'apprdate',title:'核准日期',formatter:_format},
		                    
		                    {field:'RegCap',title:'中方认缴资本'},
		                    {field:'RecCap',title:'中方实缴资本'},
		                    {field:'ForRegCap',title:'外方认缴资本'},
		                    {field:'ForRecCap',title:'外方实缴资本'},
		                    
		                    {field:'opFrom',title:'经营日期起',formatter:_format},
		                    {field:'opTo',title:'经营日期止',formatter:_format},
		                    {field:'statename',title:'企业状态'},
		                    {field:'optypename',title:'经营类别'},
		                    {field:'superorgname',title:'管辖单位名称'},
		                    {field:'orgname',title:'登记机关'}
		                    
		                ]]
		               
		            });
		    var pager =  $("#demoGrid").datagrid('getPager');
		    pager.pagination({
		    			pageSize:20,
				    	showPageList:false,
						showRefresh:false,
						onSelectPage:function(number, size) {
							reloadGird(number,size,pager.pagination('options').total);
						},
						onBeforeRefresh:function(number, size){
							clearGrid();
						}

		            });
		    
		}
		function entname_link(value,row,index){
			var url = "http://192.168.3.40:9081/IcisReport/pages/query/user/";
			if(row.enttypepro =='01')
				url += 'NeiEntInfo_main.jsp?';
			else if(row.enttypepro =='02')
				url += 'ForEntInfo_main.jsp?';
			else if(row.enttypepro =='03')
				url += 'PriEntInfo_main.jsp?';
			else if(row.enttypepro =='04')
				url += 'IndEntInfo_main.jsp?';
			else if(row.enttypepro =='07')
				url += 'IndEntInfo_main.jsp?';
			url +="ztbs="+row["id"] + "&orgid=999"+"&userid=999";
			url = encodeURI(url);
			return '<a href='+'"'+url+'"'+'target="_blank">'+value+'</a>';

		}
		
		function regno_link(value,row,index){
			var url;
			
			if(row.enttype==1100 || row.enttype==1200)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_nz.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==2100 || row.enttype==2200)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_fgs.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==3100 || row.enttype==3200 || row.enttype==3300 || row.enttype==3400 || row.enttype==3500)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_qyfr.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==4100 ||row.enttype==4200 || row.enttype==4300 || row.enttype==4400 || row.enttype==4600 || row.enttype==4700)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_yydw.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==4500 && row.enttypeitem==4530)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_hhqy.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==4500 && row.enttypeitem==4550)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_hhqyfzjg.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==4500 && row.enttypeitem==4540)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_dzqy.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==4500 && row.enttypeitem==4560)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_dzqyfzjg.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==5100 ||row.enttype==5200||row.enttype==5300|| row.enttype==6100||row.enttype==6200||row.enttype==6300)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_wz.jsp?ztbs="+row["BS"]+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==5800 || row.enttype==6800 || row.enttype==7100)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_wzfz.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==7200)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_wqdbjg.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&qylx="+row.enttype+"&orgid=999"
			if(row.enttype==7300)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_wqjyhd.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==5400 || row.enttype==6400)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_wstzhh.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==8100 ||row.enttype==8200)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_qyjt.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==9100)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_nh.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==9200)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_nhfz.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			if(row.enttype==9600)
				url = "http://192.168.3.40:9081/IcisReport/pages/query/reg/topbase_gt.jsp?ztbs="+row.id+"&qymcxx="+encodeURIComponent(encodeURIComponent(row.entname))+"&zchxx="+row.regno+"&jslx="+row.jslx+"&userid=999"+"&orgid=999"+"&url=http://192.168.3.29:9081/TopIcis";
			return '<a href='+'"'+url+'"'+'target="_blank">'+value+'</a>';;
		}
		function _format(value,row,index){
			if(value == null)
				return;
			return value.substr(0,10);
		}
		
		function reloadGird( pageNum, pageSize, total) {
			var start = app_path.indexOf("&start");
			var end  = app_path.indexOf("&rows");
			if(start==-1&&end==-1){
				app_path = $("#demoGrid").datagrid("options").url = app_path+"&start="+((pageNum-1)*pageSize)+"&rows=20";
			}else{
				app_path = $("#demoGrid").datagrid("options").url = app_path.substr(0,start)+"&start="+((pageNum-1)*pageSize)+"&rows=20";
				
			}
			 $("#demoGrid").datagrid('reload');
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
        var req;
       
        function Change_Select()
        {
            var zhi=document.getElementById('qylx_zl').value;
            //alert(zhi);
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
           
        }

    </SCRIPT>

<SCRIPT type="text/javascript">
      var req;
	  function hylb_xl_Select3()
        {
            var zhi_xl=document.getElementById("hmm").value;
            
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
	<table border="0" cellpadding="0" cellspacing="0"
		class="table-location" align="center">
		<tr>
			<td width="15%"><img src="/etc/common/images/moreblue.gif"
				width="21" height="10" alt="">&nbsp;您所在位置：</td>
			<td width="85%" align="left"><div id="pageTitle"></div></td>
		</tr>
	</table>
	<!--页面标题栏end-->
	<!--页面框架begin-->
	<table border="0" align="center" cellpadding="2" cellspacing="1"
		class="table-frame">
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
						
						<tr>
							<td><b>说明：<b></td>
							<td colspan="3" class="two-content"><b>
									需要打印咨询单的用户，请到“企业咨询单打印”菜单进行查询打印！<b></td>
						</tr>
						
						<tr>
							<td>企业名称</td>
							<td class="four-content"><input type="text" name="qymc"
								value="<%--=qymc--%>"></td>
							<td>是否已分配管辖单位</td>
							<td class="four-content"><script>

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
  </script>  <input name="rad2" type="radio" id="r21" value="block"
								checked="checked" onClick="show()" style="width: auto" />是 <input
								name="rad2" type="radio" id="r22" value="none" onClick="sel()"
								style="width: auto" />否 <input name="rad2" type="radio" id="r23"
								value="none" onClick="sel()" style="width: auto" />不限制 </td>
						</tr>

						<tr>
							<td>注册号</td>
							<td class="four-content"><input type="text" name="zch"
								value="<%--=zch--%>"></td>
							<td>法定代表人</td>
							<td class="four-content"><input type="text" name="fddbr"
								value="<%--=fddbr--%>"></td>

						</tr>

						<tr>
							<td>经营场所</td>
							<td class="four-content"><input type="text" name="jydz"
								value="<%--=jydz--%>"></td>
							<td>档案号</td>
							<td class="four-content"><input type="text" name="dah"
								value="<%--=dah--%>"></td>
						</tr>
						<tr>
							<td>经营范围</td>
							<td colspan="3" class="two-content"><input type="text"
								name="jyfw" maxlength="100" value="<%--=jyfw--%>"
								class="input-longer"></td>
						</tr>
						<tr>
							<td>企业类型-中类</td>
							<td colspan="3" class="two-content"><select name="qylx_zl"
								id="qylx_zl" onchange="Change_Select()">
									<option value="">--不限制--</option>
									<option value="1100">1100-有限责任公司</option>
									<option value="1200">1200-股份有限公司</option>
									
							</select></td>
						</tr>
						<tr>
							<td>企业类型-小类</td>
							<td colspan="3" class="two-content"><select name="qylx_xl"
								id="qylx_xl">
									<option value="">--不限制--</option>
									<option value="1110">1100-有限责任公司(国有独资)</option>
									<option value="1110">1210-股份有限公司(上市)</option>
							</select></td>

						</tr>


						<tr>
							<td>行业门类</td>
							<td class="four-content"><select name="hmt" id="hmt"
								onchange="hylb_Select1()" class="long-select" alt="行业门类">
									<option value="">--不限制--</option>
									<option value="A">A-农林牧渔</option>
									<option value="B">B-采矿业</option>
									
							</select></td>
							<td>行业大类</td>
							<td class="four-content"><select name="hmi" id="hmi"
								onchange="hylb_dl_Select2()" class="long-select" alt="行业大类">
									<option value="">--不限制--</option>
									<option value="01">01-农业</option>
									<option value="06">06-煤炭开采和洗选业</option>
							</select></td>
						</tr>

						<tr>
							<td>行业细类</td>
							<td class="four-content"><select name="hmm" id="hmm"
								onchange="hylb_xl_Select3()" class="long-select" alt="行业细类">
									<option value="">--不限制--</option>
									<option value="011">011-谷物种植</option>
									<option value="061">061-烟煤和无烟煤开采洗选</option>
							</select></td>
							<td>行业小类</td>
							<td class="four-content"><select name="hyxxl" id="hyxxl"
								class="long-select" alt="行业小类">
									<option value="">--不限制--</option>
									<option value="0111">0111-稻谷种植</option>
									<option value="0610">0610-烟煤和无烟煤开采洗选</option>


							</select></td>
						</tr>







						<tr>
							<td>风险行业</td>
							<td class="four-content"><select name="fxhy">
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


							</select></td>
							<td>信用级别</td>
							<td class="four-content"><select name="xyjb">
									<option value="">不限制</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
							</select></td>
						</tr>

						<tr>

							<td>经营类别</td>
							<td class="four-content"><select name="jylb"
								styleClass="long-select">
									<option value="" tourl="<%--=jylb--%>">不限制</option>
									<option value="0110" tourl="<%--=jylb--%>">0110-种植养殖类</option>
									<option value="0120" tourl="<%--=jylb--%>">0120-食品生产类</option>
									<option value="0130" tourl="<%--=jylb--%>">0130-食品经营类</option>
									<option value="0140" tourl="<%--=jylb--%>">0140-餐饮类</option>
									<option value="0190" tourl="<%--=jylb--%>">0190-其他食品经营类主体</option>
									<option value="9900" tourl="<%--=jylb--%>">9900-其他</option>


									<!--                         out.println(PageComboxOptions.getJylb()); -->


							</select></td>


							<td>企业属性</td>
							<td class="four-content">
								<input type="checkbox" name="qysx"id="qysx0" checked style="width: auto" /> 内 
								<input type="checkbox" name="qysx"id="qysx1" checked style="width: auto" /> 外
								<input type="checkbox" name="qysx"id="qysx2" checked style="width: auto" /> 私 
								<input type="checkbox" name="qysx"id="qysx3" checked style="width: auto" /> 个
								<input type="checkbox" name="qysx"id="qysx4" checked style="width: auto" /> 农合
							</td>

						</tr>
						<tr>
							<td>企业状态</td>
							<td class="four-content"><select name="zt">
									<option value="">不限制</option>
									<option value="06" selected=true>在业</option>
									<option value="07">注销</option>
									<option value="11">吊销</option>
							</select></td>

							<td>登记类型</td>
							<td class="four-content"><select name="djlx">
									<option value="">不限制</option>
									<option value="01">正常</option>
									<option value="02">备案</option>
									<option value="03">迁入</option>
									<option value="04">改制</option>
									<option value="05">集团</option>
							</select></td>



						</tr>

						<tr>
							<td>成立日期起 *</td>
							<td class="four-content"><input type="text" name="cjrqq"
								value="1980-01-01" id="calendar"></td>
							<td>成立日期止 *</td>
							<td class="four-content"><input type="text" name="cjrqz"
								value="2013-07-31" id="calendar"></td>
						</tr>


						<tr>
							<td>核准日期起 *</td>
							<td class="four-content"><input type="text" name="hzrqq"
								value="1980-01-01" id="calendar"></td>
							<td>核准日期止 *</td>
							<td class="four-content"><input type="text" name="hzrqz"
								value="2013-07-31" id="calendar"></td>
						</tr>

						<tr id="trDJJGone">
							<td>登记机关</td>
							<td colspan="3" class="two-content"><select name="djjgone"
								styleClass="long-select">
								<option value="999">340000-安徽省3</option>

									

							</select></td>
						</tr>

						<tr>
							<td colspan="2" class="two-content"><div align="right">
									<input type="checkbox" name="chk1" align="left"
										title="是否查询下级机关所登记的企业" style="width: auto" /> 选中则查询范围包括下级登记机关
								</div></td>


							<td style="width: auto"></td>

							<td class="two-content"></td>
						</tr>






						<tr id="trGxdw">
							<td>管辖单位</td>
							<td colspan="3" class="two-content"><select name="gxdw"
								styleClass="long-select">
								<option value="999">340000-安徽省3</option>
									
							</select></td>



						</tr>


						<tr id="trGxdwkg">
							<td colspan="2" class="two-content"><div align="right">
									<input type="checkbox" name="chk2" title="是否查询下级机关所管辖的企业"
										style="width: auto" /> 选中则查询范围包括下级管辖机关
								</div></td>

							<td></td>

							<td class="two-content"></td>


						</tr>



					</table>



					<table class="table-button">
						<tr>
							<td><input type="button" name="viewReportB" value="确定"
								onclick="viewReport()" /> <%--
			  

								<%--}--%> <input type="reset" class="cancle" value="重置" /> <input
								type="button" name="viewReportA" value="说明"
								onclick="viewReport1()" /></td>
						</tr>
					</table>


					

				</form> <!--内容页面end-->
			</td>
		</tr>
	</table>
<div style="height:500px width:1000px">
<table id="DetailInfo" border="1" align="center" style = "border:solid #add9c0; border-width:1px 0px 0px 1px;">
	<thead>
	<tr>
	<th id = "tm" style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;"  colspan="8">查询结果耗时</th>
	</tr>
    <tr>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;">企业名称</th>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;">注册号</th>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;">电话号码</th>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;">企业类型</th>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;"> 行业门类名称</th>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;"> 行业细类名称 </th>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;"> 法人代表人 </th>
      <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;"> 经营地址</th>
    </tr>
    </thead>
    <tbody>
     <th style = "border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;"></th>
	</tbody>
    <tfoot>
    	<tr>
	    	<th  colspan="8">
	    	<div id="pp" style="background:#efefef;border:1px solid #ccc;"></div>  
	    	</th>
    	</tr>
    </tfoot>
</table>
</div>
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
