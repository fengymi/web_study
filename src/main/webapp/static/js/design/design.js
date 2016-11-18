/**
 * jqGrid 初始化
 * @param girdData
 * @param colModel
 * @returns {{jsonReader: {root: string, page: string, total: string, records: string}, prmNames: {rows: string, page: string, order: string, sort: string, _search: null, nd: null}, height: string, emptyrecords: string, add: boolean, edit: boolean, viewrecords: boolean, addtext: string, edittext: string, pager: string, datatype: string, autowidth: boolean, shrinkToFit: boolean, rowNum: number, rowList: number[], hidegrid: boolean}}
 */
function initGrid(girdData,colModel) {
    var table_data = $("#table_data");
    $.jgrid.defaults.styleUI = 'Bootstrap';
    table_data.jqGrid(getJqGirdInit(girdData));
    var defaultCol = getJqGirdColModel(colModel);
    table_data.jqGrid('navGrid', '#pager_list', {
        edit: true,
        add: true,
        del: true,
        search: false
    }, defaultCol[0],defaultCol[1]);

    $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#table_data').setGridWidth(width);
    });
}
function getJqGirdInit(data) {
    var girdData = {
        jsonReader : {              //后台返回数据格式
            root:"list",            //data
            page:"pageNum",         //页码
            total:"pages",          //总页数
            records:"total"         //总数据数
        },
        prmNames: {                 //ajax提交的参数
            rows: "pageSize",       // 分页大小
            page: "pageNum",        //当前页码
            order: "order",         //排序方式 desc,asc
            sort: "sidx",           //排序列
            _search: null,
            nd: null
        },
        height: "100%",             //默认列表框高度
        emptyrecords:"没有更多的数据了",//没有数据时的内容
        add: true,
        edit: true,
        viewrecords: true,          //显示总数据信息
        addtext: 'Add',
        edittext: 'Edit',
        pager: "#pager_list",       //分页dom
        datatype : "json",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList : [ 10, 20, 30 ],
        hidegrid: false
    };
    for(var i in data){
        girdData[i] = data[i];
    }
    return girdData;
}
function getJqGirdColModel(colModel) {
    var defaultEdit = {
        reloadAfterSubmit: true,
        closeAfterEdit: true,
        closeOnEscape: true,
        modal:true
    };
    var defaultAdd = {
        reloadAfterSubmit: true,
        closeAfterEdit: true,
        closeOnEscape: true,
        modal:true
    };
    if(colModel){
        for(var i in colModel){
            defaultEdit[i] = colModel[i];
            defaultAdd[i] = colModel[i];
        }
    }
    return [defaultEdit,defaultAdd];
}

/**
 * 下拉框格式化
 * @param data 数据
 * @param value value取值
 * @param text text取值
 * @param defaultValue 没有时
 */
function selectFormat(data,value,text,defaultValue,selected) {
    var con = ' <select>';
    if(data.length==0){
        con +='<option value="">'+defaultValue+'</option>';
    }else {

        $.each(data, function () {
            var select = "";
            if(this[value]==selected){
                select = "selected";
            }
            con += '    <option value="'+this[value]+'" '+select+'> '+this[text]+'</option>';
        });
    }
    con += '    </select>';
    return con;
}

/**
 * 初始化toast
 * @param data 修改的参数
 */
function initToast(data) {
    toastr.options = {
        "closeButton": true,
        "debug": true,
        "progressBar": false,//进度条
        "positionClass": "toast-top-center",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "1000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    for(var i in data){
        toastr.options[i] = data[i];
    }
}
/**
 * 初始化多选下拉框
 */
function initSelector() {
    var config = {
        '.chosen-select-no-results': {no_results_text: '没有可用权限'}
    };
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
}

/**
 * manager修改数据
 * @param data {selectedIds:[],oldIds:[],addData:"input对象",delData:"input对象"}
 */
function setUpdateData(data) {
    var selectedIds = data.selectedIds||[];
    var oldIds = data.oldIds||[];
    var addIds = [];
    var delIds = [];
    var selectedIdsStr = selectedIds.toString();
    var oldIdsStr = oldIds.toString();
    for(var i in oldIds){
        if(selectedIdsStr.indexOf(oldIds[i])==-1){
            delIds.push(oldIds[i]);
        }
    }
    for(i in selectedIds){
        if(oldIdsStr.indexOf(selectedIds[i])==-1){
            addIds.push(selectedIds[i]);
        }
    }
    $(data.addData).val(addIds.toString());
    $(data.delData).val(delIds.toString());
    $.ajax({
        url:data.url,
        data:$(data.form).serialize(),
        type:"post",
        success:function (result) {
            toastr["info"](result);
            data.success();
        },
        error:function () {
            toastr["error"]("修改失败");
        }
    });
}


function showNavBar(data) {
    var timeObj;
    $(data.trigger).mouseenter(function(){
        console.log("document:"+window.outerHeight);
        console.log("window:"+screen.availHeight);
        if(window.outerHeight==screen.availHeight){
            show.find("a").eq(1).css("display","none");
            show.find("a").eq(0).css("display","inline");
        }else{
            show.find("a").eq(0).css("display","none");
            show.find("a").eq(1).css("display","inline");
        }
        $(data.show).fadeIn(200);
    });
    $(data.show).mouseleave(function () {//对应mouseout会多次触发
        timeObj = setTimeout(function () {
            $(data.show).fadeOut(300);
        }, 1000);
    });
    $(data.show).mouseenter(function () { //对应mouseover会多次触发
        clearTimeout(timeObj);
    });
}
/**
 * 时间格式化
 * @param date 时间
 * @param showSecond 是否显示秒
 * @returns timeStr 返回格式化的时间
 */
function getDate(date,showSecond) {
    showSecond = showSecond || false;
    var dateTime = date?new Date(date):new Date();
    var year = dateTime.getYear() + 1900;
    var month = dateTime.getMonth()+1;
    var day = dateTime.getDate();
    var timeStr = year+"-"+(month<10?("0"+month):month)+"-"+(day<10?("0"+day):day);
    if(showSecond){
        var hours = dateTime.getHours();
        var minutes = dateTime.getMinutes();
        var seconds = dateTime.getSeconds();
        timeStr += " "+(hours<10?"0"+hours:hours)+":"+(minutes<10?"0"+minutes:minutes)+":"+(seconds<10?"0"+seconds:seconds);
    }
    return timeStr;
}