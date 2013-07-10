
Validator = {
    require : /.+/,
    email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
    phone : /^((\(\d{2,3}\))|(\d{3}\-))?(((\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?)|13\d{9})$/,
    fixPhone : /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/,
    mobile : /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/,
    url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
    idCard : "this.IsIdCard(value)",
    currency : /^\d+(\.\d+)?$/,
    number : /^\d+$/,
    zip : /^[1-9]\d{5}$/,
    QQ : /^[1-9]\d{4,8}$/,
    integer : /^[-\+]?\d+$/,
    double : /^[-\+]?\d+(\.\d+)?$/,
    english : /^[A-Za-z]+$/,
    chinese :  /^[\u0391-\uFFE5]+$/,
    username : /^[a-z]\w{3,}$/i,
    UnSafe : /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
    year : /^\d{4}$/,

    IsSafe : function(str) {
        return !this.UnSafe.test(str);
    },
    safeString : "this.IsSafe(value)",
    filter : "this.DoFilter(value, getAttribute('accept'))",
    limit : "this.Limit(value.length,getAttribute('alt').split('/')[3],  getAttribute('alt').split('/')[4] )",
    limitB : "this.Limit(this.LenB(value), getAttribute('alt').split('/')[3], getAttribute('alt').split('/')[4] )",
    date : "this.IsDate(value, getAttribute('alt').split('/')[3] )",
    repeat : "value == document.getElementsByName(getAttribute('alt').split('/')[3])[0].value",
    range : "getAttribute('alt').split('/')[3] < (value|0) && (value|0) < getAttribute('alt').split('/')[4]",
    compare : "this.Compare(value,getAttribute('alt').split('/')[3],getAttribute('alt').split('/')[4])",
    custom : "this.Exec(value, getAttribute('alt').split('/')[3])",
    group : "this.MustChecked(getAttribute('name'), getAttribute('alt').split('/')[3], getAttribute('alt').split('/')[4])",
    ErrorItem : [document.forms[0]],
    ErrorMessage : ["����ԭ�����ύʧ�ܣ�\t\t\t\t"],
    Validate : function(theForm, mode) {
        var obj = theForm || event.srcElement;
        var count = obj.elements.length;
        this.ErrorMessage.length = 1;
        this.ErrorItem.length = 1;
        this.ErrorItem[0] = obj;
        for (var i = 0; i < count; i++) {
            with (obj.elements[i]) {
                var alt = getAttribute('alt');
                if(alt==null) continue;
                style.borderColor="#6699CC #DFE8F3 #DFE8F3 #6699CC";
                var _dataType = alt.split('/')[0];
                if (typeof(_dataType) == "object" || typeof(this[_dataType]) == "undefined")  continue;
                this.ClearState(obj.elements[i]);
                if (getAttribute('alt').split('/')[1] == "0" && value == "") continue;
                switch (_dataType) {
                    case "idCard" :
                    case "date" :
                    case "repeat" :
                    case "range" :
                    case "compare" :
                    case "custom" :
                    case "group" :
                    case "limit" :
                    case "limitB" :
                    case "safeString" :
                    case "filter" :
                        if (!eval(this[_dataType])) {
                            this.AddError(i,getAttribute('alt').split('/')[2]);
                        }
                        break;
                    default :
                        if (!this[_dataType].test(value)) {
                            this.AddError(i,getAttribute('alt').split('/')[2]);
                        }
                        break;
                }
            }
        }
        if (this.ErrorMessage.length > 1) {
            mode = mode || 3;
            var errCount = this.ErrorItem.length;
            switch (mode) {
                case 2 :
                    for (var i = 1; i < errCount; i++)
                        this.ErrorItem[i].style.borderColor = "#CC0000 #FFC1C1 #FFC1C1 #CC0000";
                case 1 :
                    alert(this.ErrorMessage.join("\n"));
                    this.ErrorItem[1].focus();
                    break;
                case 3 :
                    var errArray = new Array(); //��Ŵ�����Ϣ[errorItemName][errorMsg],
                    for (var i = 1; i < errCount; i++) {
                        try {
                            errArray[i-1]=[this.ErrorItem[i].name,this.ErrorMessage[i]];
                            this.ErrorItem[i].style.borderColor = "#CC0000 #FFC1C1 #FFC1C1 #CC0000";
//                            this.ErrorItem[i].title = this.ErrorMessage[i].replace(/\d+:/, "*");
                        }
                        catch(e) {
                            alert(e.description);
                        }
                    }
                    this.ErrorItem[1].focus();
                    fillJsErrorAndShow(errArray);
                    break;
                default :
                    alert(this.ErrorMessage.join("\n"));
                    break;
            }
            return false;
        }
        return true;
    },
    Limit : function(len, min, max) {
        min = min || 0;
        max = max || Number.MAX_VALUE;
        return min <= len && len <= max;
    },
    LenB : function(str) {
        return str.replace(/[^\x00-\xff]/g, "**").length;
    },
    ClearState : function(elem) {
        with (elem) {
            if (style.color == "red")
                style.color = "";
            var lastNode = parentNode.childNodes[parentNode.childNodes.length - 1];
            if (lastNode.id == "__ErrorMessagePanel")
                parentNode.removeChild(lastNode);
        }
    },
    AddError : function(index, str) {
        this.ErrorItem[this.ErrorItem.length] = this.ErrorItem[0].elements[index];
        this.ErrorMessage[this.ErrorMessage.length] = this.ErrorMessage.length + ":" + str;
    },
    Exec : function(op, reg) {
        return new RegExp(reg, "g").test(op);
    },
    Compare : function(op1, operator, op2) {
        switch (operator) {
            case "!=":
                return (op1 != op2);
            case ">":
                return (op1 > op2);
            case ">=":
                return (op1 >= op2);
            case "<":
                return (op1 < op2);
            case "<=":
                return (op1 <= op2);
            default:
                return (op1 == op2);
        }
    },
    MustChecked : function(name, min, max) {
        var groups = document.getElementsByName(name);
        var hasChecked = 0;
        min = min || 1;
        max = max || groups.length;
        for (var i = groups.length - 1; i >= 0; i--)
            if (groups[i].checked) hasChecked++;
        return min <= hasChecked && hasChecked <= max;
    },
    DoFilter : function(input, filter) {
        return new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g, filter.split(/\s*,\s*/).join("|")), "gi").test(input);
    },
    IsIdCard : function(number) {
        var date, Ai;
        var verify = "10x98765432";
        var Wi = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
        var area = ['','','','','','','','','','','','����','���','�ӱ�','ɽ��','���ɹ�','','','','','','����','����','������','','','','','','','','�Ϻ�','����','�㽭','��΢','����','����','ɽ��','','','','����','����','����','�㶫','����','����','','','','����','�Ĵ�','����','����','����','','','','','','','����','����','�ຣ','����','�½�','','','','','','̨��','','','','','','','','','','���','����','','','','','','','','','����'];
        var re = number.match(/^(\d{2})\d{4}(((\d{2})(\d{2})(\d{2})(\d{3}))|((\d{4})(\d{2})(\d{2})(\d{3}[x\d])))$/i);
        if (re == null) return false;
        if (re[1] >= area.length || area[re[1]] == "") return false;
        if (re[2].length == 12) {
            Ai = number.substr(0, 17);
            date = [re[9], re[10], re[11]].join("-");
        }
        else {
            Ai = number.substr(0, 6) + "19" + number.substr(6);
            date = ["19" + re[4], re[5], re[6]].join("-");
        }
        if (!this.IsDate(date, "ymd")) return false;
        var sum = 0;
        for (var i = 0; i <= 16; i++) {
            sum += Ai.charAt(i) * Wi[i];
        }
        Ai += verify.charAt(sum % 11);
        return (number.length == 15 || number.length == 18 && number == Ai);
    },
    IsDate : function(op, formatString) {
        formatString = formatString || "ymd";
        var m, year, month, day;
        switch (formatString) {
            case "ymd" :
                m = op.match(new RegExp("^((\\d{4})|(\\d{2}))([-./])(\\d{1,2})\\4(\\d{1,2})$"));
                if (m == null) return false;
                day = m[6];
                month = m[5] * 1;
                year = (m[2].length == 4) ? m[2] : GetFullYear(parseInt(m[3], 10));
                break;
            case "dmy" :
                m = op.match(new RegExp("^(\\d{1,2})([-./])(\\d{1,2})\\2((\\d{4})|(\\d{2}))$"));
                if (m == null) return false;
                Day = m[1];
                month = m[3] * 1;
                year = (m[5].length == 4) ? m[5] : GetFullYear(parseInt(m[6], 10));
                break;
            default :
                break;
        }
        if (!parseInt(month)) return false;
        month = month == 0 ?12:month;
        var date = new Date(year, month - 1, day);
        return (typeof(date) == "object" && year == date.getFullYear() && month == (date.getMonth() + 1) && day == date.getDate());
        function GetFullYear(y) {
            return ((y < 30 ? "20" : "19") + y) | 0;
        }
    }
}
function IsFloat(value){       //value ΪҪ��֤��ֵ
var reg =/^[-\+]?(0|([123456789]\d*))(\.\d+)?$/;
return reg.test(value);
}