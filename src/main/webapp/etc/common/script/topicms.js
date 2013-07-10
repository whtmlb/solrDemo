/**
 Title:框架控制所需要的JS代码
 author:康志强
 date:2005年07-07日
 */

//设置表格的属性等内容，在/style/topicms.css文件中有引用
function table(obj) {
    obj.border = 0;
    obj.cellSpacing = 1;
    obj.cellPadding = 2;
}

//操作时提示_Start
//author:LKY
//@参数confirmStr为具体的提示操作类型
//例如：用户点击“重填”按钮时，使用 onClick="return checkConfirm('重填');"
//如果同时需要转向其他页面时，使用url参数
//参数url为转向的路径
//例如: onClick="return checkConfirm('离开','<%=rootPath%>/WaitCopyListUI.do');"
function checkConfirm(confirmStr, url) {
    var cn = confirm("确定要" + confirmStr + "吗？\n" + "按\"确定\"您所填的信息将丢失！\n" + "按\"取消\"留在当前页面。");
    if (cn) {
        if (url != null) {
            window.location.href = url;
            return true;
        } else {
            return true;
        }
    } else {
        return false;
    }
}
//操作时提示_End

//删除时确认_Start
function checkDelete() {
    var cn = confirm("确定要删除吗？\n" + "按\"确定\"您所选信息将被永久删除！\n" + "按\"取消\"留在当前页面。");
    if (cn) {
        return true;
    } else {
        return false;
    }
}
//删除时确认_End

//离开、刷新、关闭页面时的提示信息_Start
/**
 Author:LKY
 在触发状态改变的控件中（即需要触发提示时）加入以下属性
 onChange="ShowConfirmClose(true);"

 在正常流程按钮中(即不需要提示时)加入以下属性：
 onclick="ShowConfirmClose(false);"
 */

function ConfirmClose() {
    window.event.returnValue = "如果按\"确定\"页面上的信息将丢失！\n";
}
function ShowConfirmClose(blnValue) {
    if (blnValue) {
        document.body.onbeforeunload = ConfirmClose;
    } else {
        document.body.onbeforeunload = null;
    }
}
//--离开、刷新、关闭页面时的提示信息_End

//帮助信息_Start
//在状态栏显示帮助信息
/**
 Author:LKY
 参数info为提示的信息
 在要提示信息的表格中加入此信息: onMouseOver="showInfo('这是帮助信息');" onMouseOut="clearInfo();"
 */
function showInfo(info) {
    var str = info;
    //帮助信息
    window.status = str;
}
//清除状态栏信息
function clearInfo() {
    var str = "";
    window.status = str;
}
//帮助信息_End
function turnNext(object) {
    if (object.keyCode == 13) {
        object.keyCode = 9;
    }
}

/****************************添加页面上默认行为 start *********************/
//add by yuexl,页面上不调用以下函数

//往页面上body元素上添加默认的回车跳转功能事件
window.attachEvent('onload', function () {
    _focusEdit();
    //添加focus函数
    document.body.attachEvent('onkeydown', _addOnkeyDown);
});

/**
 * body上回车跳转功能
 * 在textarea元素上通过ctrl＋回车，进行textarea中回车编辑
 */
function _addOnkeyDown() {
    with (window.event) {
        var type1 = srcElement.type;
        if (keyCode == 13) {
            if (ctrlKey && type1 == "textarea") {
                //ctrl + 回车，且textarea ，编辑状态
                window.clipboardData.setData('text', '\n');
                document.execCommand("Paste");
                return;
            } else if (type1 == 'text' || type1 == 'radio' || type1 == 'checkbox' || type1 == 'textarea' || srcElement.tagName == 'SELECT' || type1 == 'password' || type1 == 'file') {
                keyCode = 9;
                return;
            }
            else if (type1 == 'button' || type1 == 'reset' || type1 == 'submit') return;
            //其他元素不执行此事件
            returnValue = false;
        }
    }
}

/*
*  页面load后，焦点聚焦到第一个form中的可编辑元素中
*/
function _focusEdit() {
    with (document) {
        if (forms[0] != null) {
            for (var i = 0; i < forms[0].elements.length; i++) {
                var e = forms[0].elements[i];
                if (e.type != 'hidden' && !e.disabled && !e.readOnly) {
                    e.focus();
                    break;
                }
            }
        }
    }
}
/****************************添加页面上默认行为 end *********************/

/**
 * 控制checkBox选择
 *
 * @param elementName 复选框的Name值,例如：<input name="enterpriseId" ...
 * @return
 * Added by: LKY 
 * 注意：页面中的
 */
//******************************检查*****************************
function checkIt(elementName) {
    var a = document.getElementsByName(elementName);
    //只要有一个被选择的，则返回true
    for (var i = 0; i < a.length; i++) {
        if (a[i].checked) {
            return true;
            break;
        }
    }
    alert("请至少选择一个企业!");
    return false;
}
// ******************************全选*****************************
function CheckAll(elementName) {
    //alert("elementName: " + elementName);
    var a = document.getElementsByName(elementName);
    for (var i = 0; i < a.length; i++) {
        if (!a[i].checked) {
            a[i].checked = true;
        }
    }
}
//****************************全不选*****************************
function CancelAll(elementName) {
    //alert("elementName: " + elementName);
    var a = document.getElementsByName(elementName);
    for (var i = 0; i < a.length; i++) {
        if (a[i].checked) {
            a[i].checked = false;
        }
    }
}
//****************************反向选择*****************************
function reverse(elementName) {
    //alert("elementName: " + elementName);
    var a = document.getElementsByName(elementName);
    //只要有一个被选择的，则返回true
    for (var i = 0; i < a.length; i++) {
        if (!a[i].checked) {
            a[i].checked = true;
        } else {
            a[i].checked = false;
        }
    }
}
//控制checkBox选择_end

//在提交时disable的button按钮，输入form参数
function disButByForm(obj) {
    for (var i = 0; i < obj.all.length; i++) {
        if (obj.all[i].type == "button" || obj.all[i].type == "reset" || obj.all[i].type == "submit") {
            obj.all[i].disabled = true;
        }
    }
}


//比较两个String类型日期的大小
//author:wangpu
//不用解释了，相信大家都能看明白
function checkStrDate(strDate1, strDate2) {
    if (strDate1 == "" || strDate2 == "")return true;

    var year1 = strDate1.substring(0, 4);
    var month1 = strDate1.substring(5, 7);
    var day1 = strDate1.substring(8, 10);
    var year2 = strDate2.substring(0, 4);
    var month2 = strDate2.substring(5, 7);
    var day2 = strDate2.substring(8, 10);

    var stringDate1 = year1 + "" + month1 + "" + day1;
    var stringDate2 = year2 + "" + month2 + "" + day2;
    var date1 = new Number(stringDate1);
    var date2 = new Number(stringDate2);
    return  date1 <= date2;
}

/*
* 隐藏查询按钮所在TD的全部内容，并显示提示信息.注意td中每个元素必须有name
* @param input 提交按钮对象
* @param iFormIndex 要提交的Form对象所引,如果不提该供参数默认为0
* @param mForm 要提交到action。默认情况可以为空，表示提交第一个form
*/
function hiddentSubmit(input, iFormIndex, mForm) {
    //隐藏 参数 input 所在td的全部内容
    var nodes = input.parentElement.childNodes;
    for (var i = 0; i < nodes.length; i++) {
        var obj = document.getElementById(nodes[i].name);
        if (obj != null) {
            obj.style.width = "0";
        }
    }

    //显示提示信息
    var strContent = "<span align=\"center\" style=\"color: #2A5FAA; font-size: 14px\">正在查询，请稍候...</span>";
    input.parentElement.insertAdjacentHTML("BeforeEnd", strContent);

    //提交Form对象
    if (iFormIndex == null)
        iFormIndex = 0;
    if (mForm != null)
        document.forms[iFormIndex].action = mForm;

    //document.forms[iFormIndex].submit();
}
//author yangdongyu
//该方法用来获取一组单选按钮中选中的单选按钮的值
//prameter RedioButtonName    要检查的单选按钮组的名称,别忘了给名字加上引号:)
function getCheckedRedioButtonValue(RedioButtonName) {
    var obj = document.getElementsByName(RedioButtonName);
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].checked) {
            return obj[i].value;
        }
    }
}