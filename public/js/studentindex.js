$(function(){
	$('.corner').corner('10px');
	setColor();

	var colors = ['#ea9243','#e02c85','#1cb9d0'];
	$('#menu li').hover(function(){
		var ind = $(this).prevAll().length;
		$(this).css('background',colors[ind])
	},function(){
		$(this).css('background','#fff');
	});
	$('#menu li').click(function(){
		var id = $(this).attr('id');
		$.post( id,{ type : id},function(data){
			$('#main').html(data);//.slideDown();
			setColor();
		});
	});

	function setColor(){
		$('table tr:odd').addClass('odd');
		$('table td').live('mouseover',function(){
			$(this).siblings('td').andSelf().addClass('over');
		}).live('mouseout',function(){
			$('table tr td.over').removeClass('over');
		});
	}


	var dialog_w = (document.documentElement.clientWidth-300)/2;
	$('#changepwd').click(function(){
		$('#resetPwd').css({
			'left':dialog_w,
			'opacity':'0.9'
		}).show();
		$('#close').show();
	});
	
	$('.btn_sub').click(function(){
		var pwd = $.trim($('input[name=password]').val());
		var newp1 = $.trim($('input[name=newpassword]').val());
		var newp2 = $.trim($('input[name=newpassword2]').val());
		if(pwd!=''){
			//alert(pwd);
			if(newp1!=''){
				if(newp2!==''){
					if(newp1==newp2){
						$.post('resetpassword',{ password:pwd,newpassword:newp1},function(data){
							if(data=='yes'){
								$('#notice').text('密码修改成功。');
								setTimeout(function(){
										$('#close').click();
									},1000)
							}else if(data=='passworderror'){
								$('#notice').text('原密码错误，请重新输入。');
								$('#resetPwd form input:password').val('');
							}
						});
					}else{
						$('#notice').text('两个新密码不一致。');
					}
				}else{$('#notice').text('确认的新密码不能为空。');	}
			}else{$('#notice').text('新的密码不能为空。');	}
		}else{$('#notice').text('旧的密码不能为空。');	}
		
	});
	
	$('#close').css({
		left:(dialog_w+320)
	}).click(function(){
		$('#resetPwd form input:password').val('');
		$('#notice').text('');
		$('#resetPwd').hide();
		$(this).hide();
	});
})
