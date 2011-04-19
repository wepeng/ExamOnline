$(document).ready(function(){
		var winW=  document.documentElement.clientWidth;
		var winH = document.documentElement.clientHeight;
		$("#flex1").flexigrid
		(
		 {
			url: 'scorelist',
			dataType: 'json',
			colModel : [
			{display: 'Student_id', name : 'student_id', width : 50, sortable : true, align: 'center', hide: true},
			{display: '学号', name : 'username', width : 100, sortable : true, align: 'left'},
			{display: '姓名', name : 'name', width : 100, sortable : true, align: 'left'},
			{display: '班级', name : 'class_name', width : 100, sortable : true, align: 'left'},
			{display: '考试ID', name : 'examination_id', width : 50, sortable : true, align: 'left', hide: true},
			{display: '考试名', name : 'examination_name', width : 200, sortable : true, align: 'left'},
			{display: '类别', name : 'category_name', width : 100, sortable : true, align: 'left'},
			{display: '各部分成绩', name : 'parts_score', width : 100, sortable : true, align: 'left'},
			{display: '总成绩', name : 'total_score', width : 50, sortable : true, align: 'center'}
			],
			buttons : [
			{name: '修 改', bclass: 'edit', onpress: goToDo},
			{separator: true},
			{name: '删 除', bclass: 'delete', onpress : goToDo}
			],
			searchitems : [
					{display: '学号', name : 'username', isdefault: true},
					{display: '姓名', name : 'name'},
					{display: '班级', name : 'class_name'}
			],
				sortname: "student_id",
				sortorder: "asc",
				usepager: true,
				title: '成绩信息',
				useRp: true,
				rp: 50,
				rpOptions :[10,30,50,100],
				pagestat:'显示第{from}条到{to}条，共{total}条数据。',
				procmsg:'正在处理，请稍后...',
				showTableToggleBtn: true,
				width:'auto',
				height: (winH-155),
				resizable:false,
				nomsg: "没有内容...",
				errormsg : '连接错误!'
		}
);   

$('div.pSearch').click();
/* 显示提示信 息*/
function alert_msg(msg){			
	$('#alert_msg').text(msg).css('opacity','0.9').show(200,function(){
			var alert_timer = setTimeout( function(){$('#alert_msg').hide();	},2000);
			});
}

/* 获得选取的信息 */
function get_selectInfo(grid){
	var dataArray = new Array();
	dataArray['student_id'] = $('.trSelected td:nth-child(1)',grid).text();
	dataArray['name'] = $('.trSelected td:nth-child(3)',grid).text();
	dataArray['examination_id'] = $('.trSelected td:nth-child(5)',grid).text();
	dataArray['examination_name'] = $('.trSelected td:nth-child(6)',grid).text();
	dataArray['parts_score'] = $('.trSelected td:nth-child(8)',grid).text();
	return dataArray;
}
function checkForm(type,str){
	if(type == 'username'){
		result = str.match(/^\d{1,11}$/);
	}else if(type=='name'){
		result = str.match(/^[\u4e00-\u9fa5a-zA-Z]+$/);
	}
	return (result==null?false:true)
}
/*  显示对话框 */
function showDialog(datas){

	var html = $('<div id="shade"></div>');
	html.css({
			'opacity':'0.5',
			height:winH,
			width:winW
			});
	$('body').append(html);
	$('#dialog').css('opacity','0.9').show();

	if(datas){					/* 编辑 */
		$('#dialog_form input[name=student_id]').val(datas['student_id']);
		$('#dialog_form input[name=examination_id]').val(datas['examination_id']);
		$('#dialog_form input[name=name]').val(datas['name']);
		$('#dialog_form input[name=examination_name]').val(datas['examination_name']);
		$('#dialog_form input[name=parts_score]').val(datas['parts_score']);
		
		/** 编辑的 ok 按钮 **/
		$('#okBtn').unbind('click').click(function(){
				var ifParts_score = $('#dialog_form input[name=parts_score]').val()==datas['parts_score']?false:true;

				//var ckscore = checkForm('parts_score',$('#dialog_form input[name=parts_score]').val()); //检查分数格式

				if(ifParts_score){/** 修改了 **/
					$.post('managescore',$('form#dialog_form').serialize(),function(data){
					if(data == 'yes') {
						msg = '修改成功';
						$('#flex1').flexReload();//表格重载  
					}else {
						msg = '失败!';
					}
					alert_msg(msg);
					});
					$('#cancelBtn').click();
				}else{
					$('#cancelBtn').click();			
					alert_msg('没有修改任何信息');
				}
		});
	}
	
	/**** cancel 按钮 ****/
	$('#cancelBtn').click(function(){
			$('#dialog_form input[name=id]').val('');
			$('#dialog_form input[name=dis_id]').val('');
			$('#dialog_form input[name=username]').val('');
			$('#dialog_form input[name=name]').val('');
			$('span.notice').text('');
			$('#shade').remove();
			$('#dialog').hide();
			});
}


function goToDo(com,grid)
{
	switch(com){
		case '删 除':
			if($('.trSelected',grid).length == 1){
				var html = $('<div id="shade"></div>');
				html.css({
						'opacity':'0.5',
						height:winH,
						width:winW
						});
				$('body').append(html);
				var datas = get_selectInfo(grid);
				$('#confirm_msg').show().find('span.confirm_text').text('确定删除学生：'+datas['name']+' 在考试：'+datas['examination_name']+' 中的成绩 ？');
				$('#confirm_yes').unbind('click').click(function(){
						$('#shade').remove();
						$.post('managescore',{'student_id': datas['student_id'], 'examination_id': datas['examination_id']},function(data){
							alert_msg('删除成功~');
							$('#flex1').flexReload();//表格重载  
							});
						$('#confirm_msg').hide();
						});
				$('#confirm_cancel').click(function(){
						$('#confirm_msg').hide();
						$('#shade').remove();
						});
			} else if($('.trSelected',grid).length > 1){
				alert_msg('为了避免操作错误，一次只能删除一个学生。');
			}else{
				alert_msg('请选择学生');
			} 
			break;
		case '修 改':
			var itemsLen = $('.trSelected',grid).length;
			if(itemsLen==0){
				alert_msg('请选择要编辑的学生');
			}else if(itemsLen>1){
				alert_msg('一次只能编辑一行信息');
			}else if(itemsLen==1){
				var datas = get_selectInfo(grid);
				showDialog(datas);
			}
			break;
	}
}
$(".btns").hover(function(){
		$(this).css({"background":"url(../images/login_Btn_hover.gif)", "color" : "#fff" });
		}, function(){
		$(this).css({"background":"url(../images/login_Btn.gif)", "color" : "#000" });
		});

});

