/**
 * jqGrid 初始化
 * @param data
 * @returns {{jsonReader: {root: string, page: string, total: string, records: string}, prmNames: {rows: string, page: string, order: string, sort: string, _search: null, nd: null}, height: string, emptyrecords: string, add: boolean, edit: boolean, viewrecords: boolean, addtext: string, edittext: string, pager: string, datatype: string, autowidth: boolean, shrinkToFit: boolean, rowNum: number, rowList: number[], hidegrid: boolean}}
 */
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

/**
 * 下拉框格式化
 * @param data 数据
 * @param value value取值
 * @param text text取值
 * @param defaultValue 没有时
 */
function selectFormat(data,value,text,defaultValue) {
    var con = ' <select>';
    if(data.length==0){
        con +='<option value="">'+defaultValue+'</option>';
    }else {
        $.each(data, function () {
            con += '    <option value="'+this[value]+'"> '+this[text]+'</option>';
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
        "progressBar": true,
        "positionClass": "toast-top-center",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "3000",
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