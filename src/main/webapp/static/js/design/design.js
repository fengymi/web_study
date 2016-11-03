

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
        addtext: 'Add',
        edittext: 'Edit',
        pager: "#pager_list",       //分页dom
        datatype : "json",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList : [ 10, 20, 30 ],
        hidegrid: true
    };
    for(var i in data){
        girdData[i] = data[i];
    }
    return girdData;
}