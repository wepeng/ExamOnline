$(document).ready(function(){
	var winW=  document.documentElement.clientWidth;
	var winH = document.documentElement.clientHeight;
	$("#flex1").flexigrid
		(
			{
				url: 'examlist',
					dataType: 'json',
					colModel : [
				{display: 'ID', name : 'id', width : 50, sortable : true, align: 'center', hide: false},
				{display: '考 试 名', name : 'name', width : 250, sortable : true, align: 'left'},
				{display: '班  级', name : 'class_name', width : 100, sortable : true, align: 'center'},
				{display: '开 始 时 间', name : 'startTime', width : 150, sortable : true, align: 'center'},
				{display: '结 束 时 间', name : 'endTime', width : 150, sortable : true, align: 'center'},
				{display: '所用试卷类别', name : 'category_name', width : 100, sortable : true, align: 'center'}
				],
				buttons : [
					{name:'编 辑', bclass: 'edit', onpress: goToDo},
					{separator: true},
					{name:'添 加', bclass: 'add', onpress : goToDo},
					{separator: true},
					{name:'删 除', bclass: 'delete', onpress : goToDo},
					{separator: true}
					],
					searchitems : [
					{display: '考试名', name : 'name'},
					{display: '班 级', name : 'class_name', isdefault: true}
					],
					sortname: "id",
					sortorder: "asc",
					usepager: true,
					title: '<big>考试管理<big>',
					useRp: true,
					rp: 50,
					rpOptions :[10,30,50,100],
					pagestat:'显示第{from}条到{to}条，共{total}条数据。',
					procmsg:'正在处理，请稍后...',
					showTableToggleBtn: true,
					width:'auto',
					height: (winH-155),
					resizable:false
			}
	);   
	
$('div.pSearch').click();
/* 显示提示信息*/
function alert_msg(msg){			
	$('#alert_msg').text(msg).css('opacity','0.9').show(200,function(){
		var alert_timer = setTimeout( function(){$('#alert_msg').hide();	},2000);
	});
}




/* 获得选取的信息 */
function get_selectInfo(grid){
	var dataArray = new Array();
	dataArray['id'] = $('.trSelected td:nth-child(1)',grid).text();
	dataArray['name'] = $('.trSelected td:nth-child(2)',grid).text();
	dataArray['class_name'] = $('.trSelected td:nth-child(3)',grid).text();
	dataArray['startTime'] = $('.trSelected td:nth-child(4)',grid).text();
	dataArray['endTime'] = $('.trSelected td:nth-child(5)',grid).text();
	dataArray['category_name'] = $('.trSelected td:nth-child(6)',grid).text();
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
		$('#dialog_form input[name=id]').val(datas['id']);
		$('#dialog_form input[name=name]').val(datas['name']);
		$('#dialog_form input[name=startTime]').val(datas['startTime']);
		$('#dialog_form input[name=endTime]').val(datas['endTime']);
		
		/** 编辑的 ok 按钮 **/
		$('#okBtn').unbind('click').click(function(){
				$.post('manageexam',$('form#dialog_form').serialize(),function(data){
					if(data == 'yes') {
						msg = '修改成功!';
						$('#flex1').flexReload();//表格重载  
					}else {
						msg = '修改失败!';
						alert(data);
					}
					alert_msg(msg);
				});
				$('#cancelBtn').click();	
		});	
	}
	
	/**** cancel 按钮 ****/
	$('#cancelBtn').click(function(){
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
			$('#confirm_msg').show().find('span.confirm_text').text('确定删除考试：'+datas['name'] + ' ？');
			$('#confirm_yes').unbind('click').click(function(){
				$('#shade').remove();
				var examination_id = $('.trSelected td:nth-child(1)',grid).text();
				$.post('manageexam',{ 'examination_id' : examination_id},function(data){
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
			alert_msg('为了避免操作错误，一次只能删除一个考试...');
		}else{
			alert_msg('请选择要删除的一场考试...');
		} 
		break;
	case '添 加':
		location.href="setexam";  
		break;	
	case '编 辑':
		var itemsLen = $('.trSelected',grid).length;
		if(itemsLen==0){
			alert_msg('请选择要编辑的考试...');
		}else if(itemsLen>1){
			alert_msg('一次只能编辑一行信息...');
		}else if(itemsLen==1){
			var datas = get_selectInfo(grid);
			showDialog(datas);
		}
		break;
	}
}

$('.btns').live('mouseover',function(){
		$(this).css({
			'background':'url(../images/login_Btn_hover.gif)',
			color:'#fff'
			});
		}).live('mouseout',function(){
			$(this).css({
				'background':'url(../images/login_Btn.gif)',
				color:'#000'
				});
			})

});

