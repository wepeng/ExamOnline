$(document).ready(function(){
	var winW=  document.documentElement.clientWidth;
	var winH = document.documentElement.clientHeight;
	$("#flex1").flexigrid
		(
			{
				url: 'paperlist',
					dataType: 'json',
					colModel : [
				{display: 'ID', name : 'id', width : 50, sortable : true, align: 'center', hide: false},
				{display: '试 卷 名', name : 'title', width : 200, sortable : true, align: 'left'},
				{display: '试 卷 说  明', name : 'introduction', width : 200, sortable : true, align: 'left'},
				{display: '试听页面', name : 'listening_test', width : 200, sortable : true, align: 'left', hide: true},
				{display: '试卷时长(分钟)', name : 'time', width : 100, sortable : true, align: 'left'}
				],
					buttons : [
					{name: '编 辑', bclass: 'edit', onpress: goToDo},
					{separator: true},
					{name: '添 加', bclass: 'add', onpress : goToDo},
					{separator: true},
					{name: '删 除', bclass: 'delete', onpress : goToDo},
					{separator: true},
					],
					searchitems : [
					{display: '试卷名', name : 'title',isdefault: true}
					],
					sortname: "id",
					sortorder: "asc",
					usepager: true,
					title: '<big>试卷管理<big>',
					useRp: true,
					rp: 50,
					rpOptions :[10,20,30,50,100],
					pagestat:'显示第{from}条到{to}条，共{total}条数据。',
					procmsg:'正在处理，请稍后...',
					showTableToggleBtn: true,
					width:'auto',
					height: (winH-155),
					resizable:false,
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
	dataArray['id'] = $('.trSelected td:nth-child(1)',grid).text();
	dataArray['title'] = $('.trSelected td:nth-child(2)',grid).text();
	dataArray['introduction'] = $('.trSelected td:nth-child(3)',grid).text();
	dataArray['time'] = $('.trSelected td:nth-child(5)',grid).text();
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
		$('#dialog_form input[name=title]').val(datas['title']);
		$('#dialog_form input[name=introduction]').val(datas['introduction']);
		$('#dialog_form input[name=time]').val(datas['time']);
		/** 编辑的 ok 按钮 **/
		$('#okBtn').unbind('click').click(function(){
				$.post('managepaper',$('form#dialog_form').serialize(),function(data){
					if(data == 'yes') {
						msg = '修改成功!';
						$('#flex1').flexReload();//表格重载  
					}else {
						msg = '修改失败!';
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
			$('#confirm_msg').show().find('span.confirm_text').text('确定删除试卷：'+datas['title']+' ？');
			$('#confirm_yes').unbind('click').click(function(){
				$('#shade').remove();
				$.post('managepaper',{ 'paper_id' : datas['id']},function(data){
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
			alert_msg('为了避免操作错误，一次只能删除一个试卷...');
		}else{
			alert_msg('请选择试卷...');
		} 
		break;
	case '添 加':
		location.href="addexam";   
		break;	
	case '编 辑':
		var itemsLen = $('.trSelected',grid).length;
		if(itemsLen==0){
			alert_msg('请选择要编辑的试卷...');
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


