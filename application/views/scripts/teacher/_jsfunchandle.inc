<script type="text/javascript" language="javascript" >
		//显示表格效果
		$(function(){  
			$('tr:odd').css('background', 'RGB(227,222,193)');
				$("#tb tr").hover(function(){  
					$(this).addClass("td1");
				},function(){  
					$(this).removeClass("td1");  
				});
		});

//处理选项type：
function handle(username, type, table) //table = 's' or 't'
{
	switch(type) 
	{
	case 2: //重设密码
		var ask = "你确定将"+username+"重新设置为默认密码？---默认密码为123";
		var r = confirm(ask);
		if(r == true)
		{
			$.post('resetpw', {'username': username , 'type': table}, 
				function(data) 
				{
					alert(data);
				});	
		}
		break;
	case 3://删除
		if(confirm("你确定将"+username+"删除？"))
		{
			$.post('deleteperson', {'username': username , 'type': table}, 
				function(data) 
				{
					alert(data);
					location.reload(); //可以再改进此处，隐藏改行
				});	
		}
		break;
	}

}
</script>
