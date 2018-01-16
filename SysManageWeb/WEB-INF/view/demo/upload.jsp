<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PV</title>
<style type="text/css"> 
</style>
</head>
<body style="width:100%;height:auto;background-color: rgb(237, 237, 237)">
	<input type="hidden" id="fileId" value="0"/>
    <div style="width:100%;height:auto;margin-left:20px">
    	<form id="upload" action="upload" enctype="multipart/form-data" method="post"> 
			<input class="btn" style="width: 100px;height: 100px;"
				id="uploadfile"  type="file" name="uploadfile" value="上传" style="position:absolute;clip:rect(0 0 0 0);"> 
			<input class="btn" style="width: 100px;height: 100px;"
				id="uploadfile1"  type="submit" name="uploadfil1" value="上传"> 
			
		</form>
		<form id="downFile" action="downFile" method="post"> 
			<input type="hidden" name="attchmentId" value="g170817-115415392-970f-5c32-0c5f">
			<input class="btn" style="width: 100px;height: 100px;"
				id="uploadfile1"  type="submit" name="uploadfil1" value="下载"> 
		</form>
			
	</div>
	
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
var fileList;
$(function() {
	
	/* $("#uploadfile").on('change',function(){
	var files = $(this).context.files;
	if(fileList == undefined){
		fileList = files;
	}else{
		fileList = $.merge(fileList,files);
	}
	 $.each(files,function(i,file){
		 console.log(file.name);
		 updateFile();
	}); 
	$("#uploadfile").context.files = fileList;
	}); */
	
	$("#download").click(function(){
		download();
	});
});

function updateFile(){
	$("#upload").ajaxSubmit({
			url : 'upload',
			data : {
			},
			type : 'POST',
			dataType : 'json',
			success : function(d) {
				console.log(d.data);
				$("#fileId").val(d.data);
			}
	});
}

//下载附件
function download(data){
	$.ajax({
		url : 'downFile',
		type : 'POST',
		data : {
			attchmentId : $("#fileId").val()
		},
		dataType : 'json',
		success : function(d) {
			//WebUtils.alert(d.msg);
		}
	});
}
</script>
</body>
</html>