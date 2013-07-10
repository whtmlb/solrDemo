/**
* add by yuexl
*/


//本系统中所有的联动都使用该函数。
//linkSelect(sourceSelectObj,destSelectObj,key)为主调函数

//将连动后的select控件里option子控件的值原封不动的铺到页面
//特点：保留option中所有自定义的值
//例如<option value = "a" key1 = "b" key2 = "c"></option>
//连动后所有的key1、key2等自定义的值，将会被完整的写入连动后的option中
var linkSelectSourceArray = new Array();

/**
* linkSelect主调函数
* 参数:sourceSelectObj, 施动者的select对象句柄
* 参数:destSelectObj,   受动者的select对象句柄
* 参数:key,             数字型参数，在同一个页面中，此值不能相同
*/
function linkSelect(sourceSelectObj, destSelectObj, key) {
    //初始化数组
    if (linkSelectSourceArray[key] == undefined) {
        linkSelectSourceArray[key] = new Array();
        for (var destIndex = 0; destIndex < destSelectObj.length; destIndex ++) {
            linkSelectSourceArray[key][destIndex] = destSelectObj.options[destIndex].outerHTML;
        }
    }

    //清空destSelectObj
    cleanSelectObj(destSelectObj);

    //取出相应的option
    var linkKey = "key=\"" + sourceSelectObj.value + "\"";
    for (var i = 0; i < linkSelectSourceArray[key].length; i ++) {
        if (linkSelectSourceArray[key][i].indexOf(linkKey) != -1) {
            doParse(linkSelectSourceArray[key][i], destSelectObj, i);
        }
    }
}

//----------------------解析outerHTML
//----------------------写入select控件
function doParse(html, obj, i) {
    var oXML = new ActiveXObject("Microsoft.XMLDOM");
    oXML.async = "false";
    var valueStr = html.substring(html.indexOf("value="), html.length);
    valueStr = valueStr.substring(0, valueStr.indexOf(" "));
    var targetStr = valueStr.split("=");
    html = html.replace(valueStr, targetStr[0] + "='" + targetStr[1] + "'");
    html = html.replace("selected", "");
    oXML.loadXML("<root>" + html + "</root>");
    var nodes = oXML.documentElement.childNodes;
    var attribs = nodes[0].attributes;
    var opt = document.createElement("OPTION");
    opt.text = nodes[0].text;
    for (var j = 0; j < attribs.length; j++) {
        opt.setAttribute(attribs[j].name, attribs[j].value);
    }
    obj.add(opt, i);
}

//清除一个select控件的所有options
function cleanSelectObj(selectObj)
{
    while (selectObj.length > 0)
        for (var i = 0; i <= selectObj.length - 1; i++) {
            //清空原有列表
            selectObj.options[i] = null;
        }

}