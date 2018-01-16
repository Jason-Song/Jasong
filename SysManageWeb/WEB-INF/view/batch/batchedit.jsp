<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="s" uri="/auth"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>批量控制维护</title>
<link rel="stylesheet" href="../assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet" href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link rel="stylesheet" href="../assets/css/xenon-core.css">
<link rel="stylesheet" href="../assets/css/xenon-forms.css">
<link rel="stylesheet" href="../assets/css/xenon-components.css">
<link rel="stylesheet" href="../assets/css/xenon-skins.css">
<link rel="stylesheet" href="../assets/css/custom.css">

<script src="../assets/js/jquery-1.11.1.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="../assets/js/html5shiv.min.js"></script>
		<script src="../assets/js/respond.min.js"></script>
	<![endif]-->
<link rel="stylesheet" href="../assets/js/datatables/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="../assets/js/select2/select2.css">
<link rel="stylesheet" href="../assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="../assets/js/multiselect/css/multi-select.css">
<link rel="stylesheet" href="../css/app.css">
<link href="../assets/js/structure/structure.css" rel="stylesheet" type="text/css" />
<style>
.node_type0 {background: url(../images/jiedian.png) no-repeat center ;}
.node_type1 {background: url(../images/bingfa.png) no-repeat center ;}
.node_type2 {background: url(../images/shunxu.png) no-repeat center ;}
</style>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/xenon-custom.js"></script>
<script src="../assets/js/resizeable.js"></script>
<script src="../assets/js/joinable.js"></script>
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="../assets/js/structure/structure.js"></script>
<script type="text/javascript" src="../js/WebUtils.js"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>
	<div id='StructureView'></div>
</body>
<div class="modal fade" id="detail">
    <div class="modal-dialog" style="width:80%;" >
        <div class="modal-content">
            <form method="post" class="validate" onsubmit="return submitDetail()">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="batchId" class="control-label">批处理编号</label>
                            <input type="text" class="form-control" id="batchId" name="batchId" readonly="true" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="parentId" class="control-label">父节点编号</label>
                            <input type="text" class="form-control" id="parentId" name="parentId" readonly="true" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="stepId" class="control-label">步骤编号</label>
                            <input type="text" class="form-control" id="stepId" name="stepId" placeholder="请输入步骤编号" 
                              data-validate="required" data-message-required="此项必须输入." min="1"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="stepName" class="control-label">步骤名称</label>
                            <input type="text" class="form-control" id="stepName" name="stepName" placeholder="请输入步骤名称"
                                data-validate="required" data-message-required="此项必须输入."/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="dependIds" class="control-label">依赖步骤编号</label>
                            <input type="text" class="form-control" id="dependIds" name="dependIds" placeholder=""/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="stepType" class="control-label">节点类型</label>
                            <select class="form-control" id="stepType" name="stepType" data-validate="required" 
                            data-message-required="此项必须输入."></select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="procFreq" class="control-label">执行频率</label>
                            <select class="form-control" id="procFreq" name="procFreq" data-validate="required"></select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="skipStepId" class="control-label">失败跳转步骤</label>
                            <input type="text" class="form-control" id="skipStepId" name="skipStepId"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="procClass" class="control-label">执行类名</label>
                            <select class="form-control" id="procClass" name="procClass" data-validate="required" 
                            data-message-required="此项必须输入."></select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="stepDesc" class="control-label">步骤描述</label>
                            <input type="text" class="form-control" id="stepDesc" name="stepDesc"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="stepNo" class="control-label">步骤顺序号</label>
                            <input type="text" class="form-control" id="stepNo" name="stepNo" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="compCount" class="control-label">并发数</label>
                            <input type="text" class="form-control" id="compCount" name="compCount" min="1"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="refTime" class="control-label">执行时间参考值</label>
                            <input type="text" class="form-control" id="refTime" name="refTime"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="param1" class="control-label">参数1</label>
                            <input type="text" class="form-control" id="param1" name="param1" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="param2" class="control-label">参数2</label>
                            <input type="text" class="form-control" id="param2" name="param2"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="param3" class="control-label">参数3</label>
                            <input type="text" class="form-control" id="param3" name="param3"/>
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="param4" class="control-label">参数4</label>
                            <input type="text" class="form-control" id="param4" name="param4"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="param5" class="control-label">参数5</label>
                            <input type="text" class="form-control" id="param5" name="param5"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="ext1" class="control-label">EXT</label>
                            <input type="text" class="form-control" id="ext1" name="ext1"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-blue" >保存</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
	var nodecolors = {
		"1" : [ 'node_type1', '并发节点' ],
		"2" : [ 'node_type2', '顺序节点' ],
		'3' : [ 'node_type0', '普通节点' ]
	};
//	var linecolors = {
//		"1" : [ "#ddddff", "依赖关系" ],
//		"2" : [ "#ffdddd", "所属关系" ],
//		'3' : [ '#dd6666', '客户关系' ]
//	};

	function queryData() {
		var bid = '${bid}';
		var result = {retcode:'${retCode}',msg:'${retMsg}'};
		if (WebUtils.isSuccess(result)) {
			var mdata = {"batchId" : "${bid}"};
			WebUtils.ajaxSubmit("batch/step", mdata,afterdone);
		}
		else {
			WebUtils.alert('无法展示.' +result.msg);
		}
	}

	var view;
	function afterdone(result) {
		var vconfigs = {
			data : result.data,
			nodeIdField : 'stepId',
			nodeNameField : 'stepName',
			parentField : 'parentId',
			nodeHeight : 40,
			lineHeight : 20,
			nodeSpan : 4,
			nodeWidth : 50,
			//lineClassMap:linecolors,
			lineClassField : 'color',
			nodeClassMap : nodecolors,
			nodeClassField : 'nc',
			leftoffset : 0,
			menuitems : [ {
				name : '修改节点',
				click : toModifyNode,
				filter : 'all'
			}, {
				name : '增加子节点',
				click : toAddNode,
				filter : 'root,branch'
			}, {
				name : '删除节点',
				click : removeNode,
				filter : 'all'
			} ],
			renderUnit : function(i, item, data) {
				$(item).html(data.stepName);
				$(item).attr('class','st_nodecontent node_type'+ data.stepType);
			},
			isRootRecord : function(record) {
				return record.parentId == null || record.parentId == 0;
			},
			canExpand : function(data) {
				if (data.stepType == '1' || data.stepType == '2') {
					return true;
				}
				return false;
			},
			showTip : function(content, data) {
				content.height(100);
				content.html(data.stepId + "<br/>" + data.stepName);
			}
		};
		view = $('#StructureView').zStructure(vconfigs);
	}
	$(function() {
		WebUtils.bindSelect('procFreq','batstep_type');
		//WebUtils.bindSelect('procClass','batch_process');
		WebUtils.bindSelect('stepType','batch_node_type');
		WebUtils.bindSelectFromUrl('procClass','enumitem?eid=batch_process',null,'itemValue','itemValue');
		queryData();
		$("#stepType").on("change", function(e) {
            if (e.val == '0') {
                $('#procClass').select2('readonly',false);
                $('#procClass').select2('val','com.good.sys.batch.step.EmptyProcess');
            }
            else if (e.val == '1'){
                $('#procClass').select2('readonly',true);
                $('#procClass').select2('val','com.good.sys.batch.step.ParallelProcess');
            }
            else if (e.val == '2'){
                $('#procClass').select2('readonly',true);
                $('#procClass').select2('val','com.good.sys.batch.step.SequenceProcess');
            }
        });
		//明细对话框显示后处理
        $('#detail').on('show.bs.modal', function (event) {
            //设置详细对话框内容
            var button = $(event.relatedTarget);
            var modal = $(this);
            var mdata = button.attr('data');
            modal.find('.modal-title').text(button.attr('title'));
            modal.find('form').attr("action", button.attr('action'));
            //清除原来的校验
            $('#detail form').validate().resetForm();
            $('#detail .form-group').removeClass('validate-has-error');

            $('#batchId').val(mdata['batchId']);
            if (button.attr('action') == 'batch/add') {
                $('#parentId').val(mdata['stepId']);
                $('#stepId').removeAttr('readonly');
                $('#stepName').val('NO_NAME');
                $('#stepType').select2('val','');
                WebUtils.ajaxSubmit("batch/nextid?bid=" + mdata['batchId'], null, function(result) {
                    $('#stepId').val(result.data);
                });
            } else {
                $('#parentId').val(mdata['parentId']);
                $('#stepId').attr('readonly','true');
                $('#stepName').val(mdata['stepName']);
                $('#stepId').val(mdata['stepId']);
                $('#dependIds').val(mdata['dependIds']);
                $('#skipStepId').val(mdata['skipStepId']);
                $('#stepDesc').val(mdata['stepDesc']);
                $('#stepNo').val(mdata['stepNo']);
                $('#compCount').val(mdata['compCount']);
                $('#refTime').val(mdata['refTime']);
                $('#param1').val(mdata['param1']);
                $('#param2').val(mdata['param2']);
                $('#param3').val(mdata['param3']);
                $('#param4').val(mdata['param4']);
                $('#param5').val(mdata['param5']);
                $('#ext1').val(mdata['ext1']);
                setTimeout(function() {
                     $('#procFreq').select2('val',mdata['procFreq']);
                     $('#stepType').select2('val',mdata['stepType']);
                     $('#procClass').select2('val',mdata['procClass']);
                },200);
            }
        });
	});
	function toAddNode(event) {
		var data = event.data;
		jQuery('#detail').modal('show', {backdrop: 'static',action: "batch/add",
			title:"新增节点",data:data._data});
	}
	function toModifyNode(event) {
		var data = event.data;
		jQuery('#detail').modal('show', {backdrop: 'static',action: "batch/update",
			title:"修改节点",data:data._data});
	}
	function removeNode(event) {
		var p = event.data;
		var data = {
			"batchId" : p._data.batchId,
			"stepId" : p.nodeId
		};
		//TODO删除确认
		doDeleteNode(data);
	}
	function doDeleteNode(data) {
		var rows = [ data ];
		var url = "batch/delete";
		WebUtils.ajaxSubmit(url, data, function(result) {
			WebUtils.alert(result.msg);
			view.removeNode(data);
		});
	}
	function submitDetail() {
        var form = $('#detail form');
        if (form.valid()) {
            var url = form.attr('action');
            var data = form.serialize();
            var dataobj = WebUtils.convertFormData('detail form');
            WebUtils.ajaxSubmit(url,data,function(result){
                $('#detail').modal('hide');
                if (url == 'batch/add') {
                    view.insertNode(dataobj);
                }
                else {
                    view.modifyNode(dataobj);
                }
            });
        }
        return false;
    }
</script>
<s:enums keys="batstep_type,batch_process,batch_node_type"></s:enums>

</html>
