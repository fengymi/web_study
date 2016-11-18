

/**
 * 更新上传文件数量显示
 */
var files_status = $("#files_status").find("span");
function updateFilesStatus() {
    var status = uploader.getStats();
    $(files_status[0]).html(status.successNum);
    $(files_status[1]).html(status.uploadFailNum);
    $(files_status[2]).html(status.cancelNum);
    $(files_status[3]).html(status.queueNum);
}
/**
 * 删除列表中的文件
 * @param file 文件或者文件id
 * @param removeFile 去队列删除
 */
function removeFile(file,removeFile) {
    if(removeFile){
        uploader.removeFile(file,true);//从队列删除
    }
    var fileView;
    if(file.id){
        fileView = $("#"+file.id);
    }else {
        fileView = $("#"+file);
    }
    fileView.remove();
    updateFilesStatus();
}
/**
 * 添加一个文件到列表
 * @param file
 * @returns {string}
 */
function appendFileItem(file) {
    var item =  '<div id="'+file.id+'" class="file-box">'+
        '   <div class="file">' +
        '      <div class="tools-bar">'+
        '           <div class="file-tools">'+
        '               <i title="上传" onclick="uploader.upload(\''+file.id+'\')" class="fa fa-check"></i>'+
        '               <i title="删除" onclick="removeFile(\''+file.id+'\',true)" class="fa fa-times"></i>'+
        '           </div>'+
        '       </div>'+
        '       <div class="icon" style="padding: 0;height: 80px;">'+
        getFileIcon(file.name)+
        '       </div>'+
        '       <div class="file-name">'+
        '           <span>文件名: '+file.name+'</span><br/>'+
        '           <small>大小: '+getFileSize(file.size)+'</small>'+
        '       </div>'+
        '   </div>';
    item += '</div>';
    return item;
}

/**
 * 获取文件图标
 * @param fileName
 * @returns {string}
 */
function getFileIcon(fileName) {
    return '<i class="img-responsive fa fa-film"></i>';
}
/**
 * 计算文件大小
 * @type {string[]}
 */
var sizeUnit = ["B","KB","MB","GB","TB"];//文件大小单位
function getFileSize(fileSize) {
    var index = 0;
    while(fileSize/1024>1){
        fileSize = (fileSize/1024).toFixed(2);
        index++;
    }
    return fileSize+sizeUnit[index<sizeUnit.length?index:sizeUnit.length];
}