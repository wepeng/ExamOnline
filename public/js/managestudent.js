$(document).ready(function(){
	var winW=  document.documentElement.clientWidth;
	var winH = document.documentElement.clientHeight;
	$("#flex1").flexigrid
		(
			{
				url: 'getstudentjsondata',
					dataType: 'json',
					colModel : [
					{display: 'ID', name : 'id', width : 40, sortable : true, align: 'center'},
					{display: '学    号', name : 'username', width : 140, sortable : true, align: 'center'},
					{display: '姓    名', name : 'name', width : 140, sortable : true, align: 'center'},
					{display: '性    别', name : 'sex', width : 60, sortable : true, align: 'center'},
					{display: '班    级', name : 'class_name', width : 130, sortable : true, align: 'center'}
					],
					buttons : [
					{name:'选择班级', bclass: 'select_class', onpress : goToDo},
					{separator: true},
					{name: '编 辑', bclass: 'edit', onpress: goToDo},
					{separator: true},
					{name: '添 加', bclass: 'add', onpress : goToDo},
					{separator: true},
					{name: '删 除', bclass: 'delete', onpress : goToDo},
					{separator: true},
					{name:'重置为默认密码', bclass: 'resetpw', onpress : goToDo},
					{separator: true}
					],
					searchitems : [
					{display: '学 号', name : 'username'},
					{display: '姓 名', name : 'name', isdefault: true}
					],
					sortname: "id",
					sortorder: "asc",
					usepager: true,
					title: '学生管理',
					useRp: true,
					rp: 60,
					rpOptions :[30,50,60],
					pagestat:'显示第{from}条到{to}条，共{total}条数据。',
					procmsg:'正在处理，请稍后...',
					showTableToggleBtn: true,
					width:'auto',
					height: (winH-155),
					resizable:false,
					checkbox:true
			}
	);   
	
$('div.pSearch').click();
/* 显示提示信 息*/
function alert_msg(msg){			
	$('#alert_msg').text(msg).css('opacity','0.8').show(200,function(){
		var alert_timer = setTimeout( function(){$('#alert_msg').hide();	},1000);
	});
}

(function(){
 var _ftitle =  '学生管理 - 当前班级：'+$('#dialog_form select[name=class_id] option').eq(0).text();
 $('div.ftitle').html(_ftitle);
 })();


/* 获得选取的信息 */
function get_selectInfo(grid){
	var dataArray = new Array();
	dataArray['id'] = $('.trSelected td:nth-child(1)',grid).text();
	dataArray['username'] = $('.trSelected td:nth-child(2)',grid).text();
	dataArray['name'] = $('.trSelected td:nth-child(3)',grid).text();
	dataArray['sex'] = $('.trSelected td:nth-child(4)',grid).text();
	dataArray['class_name'] = $('.trSelected td:nth-child(5)',grid).text();
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
		$('#dialog_form input[name=dis_id]').val(datas['id']);
		$('#dialog_form input[name=username]').val(datas['username']);
		$('#dialog_form input[name=name]').val(datas['name']);
		var sex = '#dialog_form input[name=sex][value='+datas['sex']+']';
		$(sex).attr('checked','checked');
		var class_name = '#dialog_form option[text='+datas['class_name']+']';
		$(class_name).attr('selected','selected');
		/** 编辑的 ok 按钮 **/
		$('#okBtn').unbind('click').click(function(){
			var ifUsername = $('#dialog_form input[name=username]').val()==datas['username']?false:true;
			var ifName = $('#dialog_form input[name=name]').val()==datas['name']?false:true;
			var ifSex = $('#dialog_form input[name=sex]:checked').val()==datas['sex']?false:true;
			var ifClassname = $('#dialog_form select[name=class_id] option:selected').text()==datas['class_name']?false:true;
			//alert($('#dialog_form select[name=class_name]').val()+'   '+datas['class_name']);
			var ckusername = checkForm('username',$('#dialog_form input[name=username]').val());
			var ckname = checkForm('name',$('#dialog_form input[name=name]').val());
			if(ckusername ){
				if(ckname){
					if(ifUsername || ifName || ifSex || ifClassname){
					/** 修改了 **/
						$.post('addorupdatestudent',$('form#dialog_form').serialize(),function(data){
							if(data == 'yes') {
								msg = '修改成功!';
								$('#flex1').flexReload();//表格重载  
							}else {
								msg = '修改失败!';
							}
							alert_msg(msg);
						});
						$('#cancelBtn').click();
					}else{
						$('#cancelBtn').click();			
						//alert('not');
						alert_msg('没有修改任何信息');
					}
				}else{
					$('span.notice').text('姓名格式不对（只支持中英文）');
				}	
			}else{
				$('span.notice').text('学号格式不对（只能是数字 并且不大于11个）');
			}
			
		});
		
	}else{						/** 添加 **/
		/** 添加的 ok 按钮 **/
		$('#okBtn').unbind('click').click(function(){
			var ckusername = checkForm('username',$('#dialog_form input[name=username]').val());
			var ckname = checkForm('name',$('#dialog_form input[name=name]').val());
			//var cksex = $('#dialog_form input[name=sex]').val()==null?false:true;
			if(ckusername ){
				if(ckname){
						$.post('addorupdatestudent',$('form#dialog_form').serialize(),function(data){
							if(data == 'yes') {
								msg = '添加成功!';
								$('#flex1').flexReload();//表格重载  
							}else {
								msg = '添加失败!';
							}
							alert_msg(msg);
						
						});
						$('#cancelBtn').click();
				}else{
					$('span.notice').text('姓名格式不对（只支持中英文）');
				}	
			}else{
				$('span.notice').text('学号格式不对（只能是数字 并且小于11位）');
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
			$('#confirm_msg').show().find('span.confirm_text').text('确定删除'+$('.trSelected',grid).length+'个学生？');
			$('#confirm_yes').unbind('click').click(function(){
				$('#shade').remove();
				var delete_username = $('.trSelected td:nth-child(2)',grid).text();
				$.post('deleteperson',{ username : delete_username, type : 's'},function(data){
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
	case '添 加':
		showDialog();  
		break;	
	case '编 辑':
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
	case '重置为默认密码':
		var d= get_selectInfo(grid);
		var itemsLen = $('.trSelected',grid).length;
		if(itemsLen==0){
			alert_msg('请选择需要重置密码的学生');
		}else if(itemsLen>1){
			alert_msg('为了避免操作错误，一次只能重置一个学生密码。');
		}else if(itemsLen==1){
			if(d['id']){
				var html = $('<div id="shade"></div>');
				html.css({
						'opacity':'0.5',
						height:winH,
						width:winW
						});
				$('body').append(html);
				$('#confirm_msg').show().find('span.confirm_text').text('你确定重置为默认密码？');
				$('#confirm_yes').unbind('click').click(function(){
						var datas = { username:d['username'],type:'s' };
						$.post('resetpw',datas,function(data){
							alert(data);
							});
						$('#shade').remove();
						$('#confirm_msg').hide();
						});
				$('#confirm_cancel').click(function(){
						$('#confirm_msg').hide();
						$('#shade').remove();
						});
			}else{
				alert_msg('请选择学生');
			}
		}
		break;
	case '选择班级':
		$.getJSON('getcontrolclassjson',function(data){
				var class_info = new Array();
				class_info = data;
				if(class_info.length > 0) {
				var opt='';
				for(o=0;o<class_info.length;o++){
				opt += '<span class="btns" id=\"class_id_'+ class_info[o].id +'\">'+ class_info[o].class_name +'</span>';
				}
				$('#chose_class span.chose_class_btns').html(opt);
				var html = $('<div id="shade"></div>');
				html.css({
					'opacity':'0.5',
					height:winH,
					width:winW
					});
				$('body').append(html);
				$('#chose_class').show().find('span.btns').click(function(){
					var cid = $(this).attr('id').substr(9);
					$('#shade').remove();
					$('#chose_class').hide();
					$('div.ftitle').html('学生管理 - 当前班级：'+$(this).text());
					//reload
					jQuery('#flex1').flexOptions({newp:1, params:[{name:'class_id', value: cid},{name:'qtype',value:'class_id'}]});
					jQuery("#flex1").flexReload(); 
					});	
				} else {
					alert_msg('您目前没有可操作的班级.');
				}		
		});


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
