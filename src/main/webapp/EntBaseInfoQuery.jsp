<%@ page pageEncoding="gbk"%>


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
  Readme:       ��ҵ��Ϣ�ۺϲ�ѯ(���û��ڲ�ѯ)
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
    <title>ϵͳ��������ҳ��ģ��</title>
    <%-- 
    <link rel="stylesheet" type="text/css" href="<%=rootPath%>/etc/common/style/topicms.css">
     <script type="text/javascript" src="<%=rootPath%>/etc/grid/grid.js"></script>
    <script type="text/javascript" src="<%=rootPath%>/etc/calendar/calendar.js"></script>   
    <script type="text/javascript" src="<%=rootPath%>/etc/common/script/topicms.js"></script>
    --%>
	<SCRIPT type="text/javascript">
		function viewReport(){
    	   //ƴ װת������
    	   var queryStr = "";
    	   if(document.all.qymc.value!=""){
    	   	queryStr = "entname:" + document.all.qymc.value;//��ҵ����
    	  }
    	  if( document.all.gxdw.value){
    	  	queryStr += " +superorgid:" + document.all.gxdw.value;//��Ͻ��λ
    	  }
        
        if(document.all.zch.value!=""){
        	queryStr += " +regno:" + document.all.zch.value;//ע���
        	}
        //
        if(document.all.fddbr.value!=""){
        	queryStr += " + lerep:" + document.all.fddbr.value;//����������
        	}
       // 
       if(document.all.jydz.value!=""){
       	queryStr += " + oploc:" + document.all.jydz.value;//��Ӫ����
        	}
       // 
       if(document.all.dah.value!=""){
        queryStr += " +archno:" + document.all.dah.value;//������
      	}
       if(document.all.jyfw.value!=""){
       	queryStr += " + opscope:" + document.all.jyfw.value;//��Ӫ��Χ
        	}
       // 
       if(document.all.hmt.value!=""){
       	queryStr += " + industryphy:" + document.all.hmt.value; //��ҵ����
        	}
       // 
       if(document.all.hmi.value!=""){
       	queryStr += " + industryphy:" + document.all.hmi.value; //��ҵ����
        	}
       // 
       if(document.all.xyjb.value!=""){
       	queryStr += " + credLevel:" + document.all.xyjb.value;//���ü���
        	}
       // 
       if( document.all.hmm.value!=""){
       	queryStr += " + industrycoxi:" + document.all.hmm.value;//��ҵϸ�� 
        	}
       // 
       if(document.all.hyxxl.value!=""){
       	queryStr += " + industrycoxiao:" + document.all.hyxxl.value; //��ҵС��
        	}
       // 
       if( document.all.qylx_xl.value!=""){
       	queryStr += " + enttypeitem:" + document.all.qylx_xl.value; //��ҵ����-С��
        	}
       // 
       if(document.all.qylx_zl.value!=""){
       	queryStr += " + enttype:" + document.all.qylx_zl.value; //��ҵ����
        	}
       // 
      // if(document.all.zt.value!=""){
       	// queryStr += " + state:" + document.all.zt.value;//��ҵ״̬
        //	}
       //
       if( document.all.fxhy.value!=""){
       	queryStr += " + venind:" + document.all.fxhy.value;//������ҵ
        	}
        //
        if(document.all.jylb.value!=""){
        	queryStr += " + optype:" + document.all.jylb.value;//��Ӫ���
        	}
       // 
     queryStr += " +opto:[1995-12-31T23:59:59Z   TO   *]"     
       // if(document.all.cjrqq.value!=""&&document.all.cjrqz.value==""){
        	
        //}
        
        //queryStr += " AND opto=" + document.all.cjrqq.value;//����������
       // queryStr += " AND opfrom:" + document.all.cjrqz.value;//��������ֹ
        //queryStr += " AND apprdate:" + document.all.hzrqq.value;//��׼������
       // queryStr += " AND apprdate:" + document.all.hzrqz.value;//��׼����ֹ
       
       
       
       
       
        //queryStr += " AND state:" + document.all.zt.value;//��ҵ״̬
        //queryStr += " AND venind:" + document.all.fxhy.value;//������ҵ
        //queryStr += " AND optype:" + document.all.jylb.value;//��Ӫ���
        //queryStr += " AND opto:" + document.all.cjrqq.value;//����������
        //queryStr += " AND opfrom:" + document.all.cjrqz.value;//��������ֹ
        //queryStr += " AND apprdate:" + document.all.hzrqq.value;//��׼������
        //queryStr += " AND apprdate:" + document.all.hzrqz.value;//��׼����ֹ
       
        var app_path = "http://localhost:8080/solr/collection1/select?q="+queryStr;
        alert(queryStr);
         window.location.href = encodeURI(app_path);

     		//&wt=xml&indent=true
     		//alert(queryStr);
     		//window.location.href = "";
<%-- 		   //window.location.href = "/topbirt/frameset?__report=EntBaseInfoQuery_h.rptdesign" + queryStr + "=commoninfo&__overwrite=true"; --%>
		
     

     
   
    
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
<!--ҳ�������begin-->
<table border="0" cellpadding="0" cellspacing="0" class="table-location" align="center">
    <tr>
        <td width="15%"><img src="/etc/common/images/moreblue.gif" width="21" height="10" alt="">&nbsp;������λ�ã�
        </td>
        <td width="85%" align="left"><div id="pageTitle"></div></td>
    </tr>
</table>
<!--ҳ�������end-->
<!--ҳ����begin-->
<table border="0" align="center" cellpadding="2" cellspacing="1" class="table-frame">
<tr>
<td>
<!--����ҳ��begin-->


<form name="FormName" method="post" action="#">
<table class="table-form">

<input type="hidden" name="type" value="1100">
<input type="hidden" name="itemType" value="1130">
<input type="hidden" name="minuteType" value="">


<tr>
    <td colspan="4" class="table-title">�������ѯ����</td>
</tr>
<%--
			   //����ʡ
			   if(PageComboxOptions.getSheng().equals("GUANGXI")){
				--%>
<tr>
        <td><b>˵����<b></td>
        <td colspan="3" class="two-content"><b>
         ��Ҫ��ӡ��ѯ�����û����뵽����ҵ��ѯ����ӡ���˵����в�ѯ��ӡ��<b>
        </td>
</tr>
<%--}--%>
<tr>
         <td>��ҵ����</td>
    <td  class="four-content">
        <input type="text" name="qymc" value="<%--=qymc--%>" >
    </td>
    <td>�Ƿ��ѷ����Ͻ��λ</td>
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
   <input name="rad2" type="radio" id ="r21"  value="block"  onClick ="show()"   style="width:auto"/>��
   <input name="rad2" type="radio" id ="r22"  value="none"   onClick="sel()"  style="width:auto"/>��
   <input name="rad2" type="radio" id ="r23"  value="none"   onClick="sel()" checked="checked"  style="width:auto"/>������

<%--
}else{	
--%>
  <input name="rad2" type="radio" id ="r21"  value="block" checked="checked" onClick ="show()"   style="width:auto"/>��
  <input name="rad2" type="radio" id ="r22"  value="none" onClick="sel()"  style="width:auto"/>��
  <input name="rad2" type="radio" id ="r23"  value="none" onClick="sel()"  style="width:auto"/>������
<%--
}
--%>

    </td>
</tr>

<tr>
     <td>ע���</td>
    <td class="four-content">
        <input type="text" name="zch" value="<%--=zch--%>">
    </td>
    <td>����������</td>
    <td class="four-content">
        <input type="text" name="fddbr" value="<%--=fddbr--%>">
    </td>

</tr>

<tr>
    <td>��Ӫ����</td>
    <td class="four-content">
        <input type="text" name="jydz" value="<%--=jydz--%>" >
    </td>
     <td>������</td>
    <td class="four-content">
        <input type="text" name="dah" value="<%--=dah--%>">
    </td>
</tr>
<tr>
    <td>��Ӫ��Χ</td>
    <td colspan="3" class="two-content">
        <input type="text" name="jyfw" maxlength="100" value="<%--=jyfw--%>" class="input-longer">
    </td>
</tr>
<tr>
    <td>��ҵ����-����</td>
    <td colspan="3" class="two-content">
        <select name="qylx_zl" id = "qylx_zl"   onchange="Change_Select()">
         <option value="">--������--</option>
		 <%--
        out.println(PageComboxOptions.getOptionsQYLX());
				--%>
        </select>
    </td>
    </tr>
    <tr>
    <td>��ҵ����-С��</td>
    <td colspan="3" class="two-content">
        <select name="qylx_xl" id = "qylx_xl">
		<option value="">--������--</option>
        </select>
    </td>

</tr>


<tr>
	<td>��ҵ����</td>
	 <td class="four-content" >
	 <select name="hmt" id="hmt"  onchange="hylb_Select1()" class="long-select" alt="��ҵ����">
	   <option value="">--������--</option>
		 <%--
             out.println(PageComboxOptions.getOptionsHYLB());
				--%>
		</select>
		</td>
		<td>��ҵ���� </td>
		<td class="four-content">
		<select name="hmi" id="hmi" onchange="hylb_dl_Select2()" class="long-select" alt="��ҵ����">
		<option value="">--������--</option>
</select>
</td>
		</tr>

<tr>	
<td>��ҵϸ��</td>
<td class="four-content">
        <select name="hmm" id="hmm"  onchange="hylb_xl_Select3()" class="long-select" alt="��ҵϸ��">
         <option value="">--������--</option>

</select>
</td>
<td>��ҵС��</td>
<td class="four-content">
        <select name="hyxxl" id="hyxxl"  class="long-select" alt="��ҵС��">
        <option value="">--������--</option>
		 

</select>
</td>
</tr>







<tr>
    <td>������ҵ</td>
   <td class="four-content">
        <select name="fxhy">
			<option value="">������</option>
            <option value="01">01-�׼�����-Σ�ջ�ѧƷ��������Ӫ</option>
                        <option value="02">02-�׼�����-ȼ�������͹�Ӧҵ</option>
                        <option value="03">03-�׼�����-�����Դ����</option>
                        <option value="04">04-�׼�����-ʳƷ��������Ӫ</option>
                        <option value="05">05-�׼�����-������ҵ</option>
                        <option value="06">06-�׼�����-�����ĺ��̻�������������Ӫ</option>
                        <option value="07">07-�׼�����-��������</option>
                        <option value="08">08-�׼�����-������ܶ���̬�������������Ⱦ���ƻ���</option>
                        <option value="09">09-�Ҽ�����-�̲���Ʒ��Ӫ</option>
                        <option value="10">10-�Ҽ�����-ҩƷ��ҽ����е����������Ӫ</option>
                        <option value="11">11-�Ҽ�����-���ʡ����ӵ�ũҵ�������ϵľ�Ӫ</option>
                        <option value="12">12-�Ҽ�����-�޻����ϼ��չ����ӹ�</option>
                        <option value="13">13-�Ҽ�����-��������������</option>
                        <option value="14">14-�Ҽ�����-�Ļ����ַ���</option>
                        <option value="15">15-�Ҽ�����-����������ϴԡ��ס��</option>
                        <option value="16">16-�Ҽ�����-ӡˢҵ</option>
                        <option value="17">17-�Ҽ�����-����ά�޼�������������</option>
                        <option value="18">18-�Ҽ�����-ȼ���߰�װ��ά��</option>
						<option value="19">19-�Ҽ�����-�Ͼ���Ʒ����</option>
						<option value="20">20-�Ҽ�����-������Ʒ��Ӫ</option>
						<option value="21">21-�Ҽ�����-�����н����</option>
						<option value="22">22-��������-��������</option>


        </select>
    </td>
	<td>���ü���</td>
    <td   class="four-content">
           <select name="xyjb">
            <option value="">������</option>            
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>            
        </select>
         </td>
</tr>

<tr>

	 <td>��Ӫ���</td>
        <td   class="four-content">
            <select name="jylb" styleClass="long-select">
                  <option value="" tourl="<%--=jylb--%>">������</option>
                   <%--

                        out.println(PageComboxOptions.getJylb());

               -- %>
            </select>
        </td>

   
     <td>��ҵ����</td>
                         <td class="four-content">
                                 <input type="checkbox" name="qysx" id="qysx0" checked  style="width:auto"/>
                                  ��  <input type="checkbox" name="qysx" id="qysx1" checked style="width:auto" />
                                  ��  <input type="checkbox" name="qysx" id="qysx2" checked  style="width:auto" />
                                  ˽
                                  <input type="checkbox" name="qysx" id="qysx3" checked style="width:auto" />
                                  ��
								  <input type="checkbox" name="qysx" id="qysx4" checked style="width:auto" />
                                  ũ��
                        </td>

</tr>
<tr>
    <td>��ҵ״̬</td>
    <td class="four-content">
        <select name="zt">
            <option value="">������</option>
			<option value="06" selected = true>��ҵ</option>
            <option value="07">ע��</option>
            <option value="11">����</option>
        </select>
    </td>
   
    <td>�Ǽ�����</td>
    <td class="four-content">
        <select name="djlx">
			<option value="">������</option>
            <option value="01">����</option>
            <option value="02">����</option>
            <option value="03">Ǩ��</option>
            <option value="04">����</option>
            <option value="05">����</option>
        </select>
    </td>
   


</tr>

<tr>
    <td>���������� *</td>
    <td class="four-content">
        <input type="text" name="cjrqq" value="<%=cjrqq%>" id="calendar">
    </td>
    <td>��������ֹ *</td>
    <td class="four-content">
        <input type="text" name="cjrqz" value="<%=cjrqz%>" id="calendar">
    </td>
</tr>


<tr>
    <td>��׼������ *</td>
    <td class="four-content">
        <input type="text" name="hzrqq" value="<%=hzrqq%>" id="calendar">
    </td>
    <td>��׼����ֹ *</td>
    <td class="four-content">
        <input type="text" name="hzrqz" value="<%=hzrqz%>" id="calendar">
    </td>
</tr>

<tr id="trDJJGone">
        <td>�Ǽǻ���</td>
        <td colspan="3" class="two-content">
            <select name="djjgone" styleClass="long-select">
                  <%--
                    if ("".equals(porgid)) {
                           out.println(PageComboxOptions.getOptionsJG(orgid));
                    } else {
                        out.println(PageComboxOptions.getNoSctWithPorgidOptionsDJJG(orgid));
                    }
                --%>
            </select>
        </td>
</tr>
<tr id="trDJJGtwo" style="display:none;">
        <td>�Ǽǻ���</td>
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
                           <input type="checkbox" name="chk1" align="left"   title="�Ƿ��ѯ�¼��������Ǽǵ���ҵ"style="width:auto"/>  ѡ�����ѯ��Χ�����¼��Ǽǻ���
                  </div>  </td>


                       <td style="width:auto"> </td>

                 <td class="two-content"></td>
            </tr>




   <%--
  if(PageComboxOptions.getSheng().equals("GUANGXI")) {
--%>
   <tr id="trGxdw" style="display:none;">
        <td>��Ͻ��λ</td>
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
         <input type="checkbox" name="chk2" title="�Ƿ��ѯ�¼���������Ͻ����ҵ"    style="width:auto"/>  ѡ�����ѯ��Χ�����¼���Ͻ����</div>
        </td>

    <td >
            </td>

                 <td class="two-content"></td>


</tr>     

<%--
}else{	
--%>
 <tr id="trGxdw" >
        <td>��Ͻ��λ</td>
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
         <input type="checkbox" name="chk2" title="�Ƿ��ѯ�¼���������Ͻ����ҵ"    style="width:auto"/>  ѡ�����ѯ��Χ�����¼���Ͻ����</div>
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
        <input type="button" name="viewReportB"  value="ȷ��"  onclick="viewReport()"/>
            
			<%--
			   //����ʡ
			   if(PageComboxOptions.getSheng().equals("HENAN")){  
				--%>
				
				
					
			<%--
				//����ʡ
				}	else if(PageComboxOptions.getSheng().equals("ANHUI")){
			--%>
			<input type="button" name="viewReportB"  value="ȷ��"  onclick="viewReport()"/>
			
			<%--
				//�ຣʡ
				}	else if(PageComboxOptions.getSheng().equals("QINGHEI")){
			--%>
			<input type="button" name="viewReportB"  value="ȷ��"  onclick="viewReport_qh()"/>
			

			<%--
				//����ʡ
				}	else if(PageComboxOptions.getSheng().equals("XIZANG")){
			--%>
			<input type="button" name="viewReportB"  value="ȷ��"  onclick="viewReport_xz()"/>
			
			<%--
				//����ʡ
				}	else if(PageComboxOptions.getSheng().equals("GUANGXI")){
			--%>
			<input type="button" name="viewReportB"  value="ȷ��"  onclick="viewReport_gx()"/>
			

			 <%--}--%>
			 <input type="reset" class="cancle" value="����"/>
			<input type="button" name="viewReportA"  value="˵��"  onclick="viewReport1()"/>
                
        </td>
    </tr>
</table>
</form>


<!--����ҳ��end-->
</td>
</tr>
</table>
<!--ҳ����end-->
</body>
</html>
<script language="javascript">
    //ҳ���в���title
    document.all.pageTitle.innerHTML = "�Ǽǲ�ѯ����ҵ��Ϣ�ۺϲ�ѯ";
</script>



<script type="text/javascript">
    //getPageTitle();     //���õ������ı���



   function viewReport1() {
    //if (checkYear()) {
    var sqlStr = "&qysx=14";
     window.showModalDialog('/pages/query/reg/EntTjsysm.jsp?sqlStr='+sqlStr,sqlStr,'status:no;center:yes;help:no;minimize:no;maximize:no;close:no;dialogWidth:560px; dialogHeight:200px');
}

    function viewReport9999999999999999() { 
    	alert("111");   //ƴװת������
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
    function viewReport_xz() {    //ƴװת������
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
	function viewReport_gx() {    //ƴװת������
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

	 function viewReport_qh() {    //ƴװת������
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
    function isRequired() { //�������������
        var cjrqq = document.all.cjrqq.value;
        var cjrqz = document.all.cjrqz.value;
        var hzrqq = document.all.hzrqq.value;
        var hzrqz = document.all.hzrqz.value;
        if (cjrqq == "" && cjrqz == "") {
            alert("�����롰���������𡱺͡���������ֹ����");
            return false;
        }
        if (hzrqq == "" && hzrqz == "") {
            alert("�����롰��׼�����𡱺͡���׼����ֹ����");
            return false;
        }
        if (cjrqq == "") {
            alert("�����롰���������𡱣�");
            return false;
        }
        if (hzrqq == "") {
            alert("�����롰��׼�����𡱣�");
            return false;
        }
        if (cjrqz == "") {
            alert("�����롰��������ֹ����");
            return false;
        }
        if (hzrqz == "") {
            alert("�����롰��׼����ֹ����");
            return false;
        }
        if (!checkStrDate(cjrqq, cjrqz)) {
            alert("����������ֹ���������ڡ�����������");
            return false;
        }
        if (!checkStrDate(hzrqq, hzrqz)) {
            alert("����׼����ֹ���������ڡ���׼������");
            return false;
        } else {
            return true;
        }
    }

</script>
