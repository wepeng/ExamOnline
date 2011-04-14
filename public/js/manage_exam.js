//管理考试的table
$("#flex1").flexigrid
	({
	url: 'examlist',
	dataType: 'json',
	colModel : [
				{display: 'ID', name : 'id', width : 50, sortable : true, align: 'center', hide: false},
				{display: '考试名', name : 'name', width : 200, sortable : true, align: 'left'},
				{display: '班级', name : 'class_name', width : 100, sortable : true, align: 'left'},
				{display: '开始时间', name : 'startTime', width : 150, sortable : true, align: 'left'},
				{display: '结束时间', name : 'endTime', width : 150, sortable : true, align: 'left'},
				{display: '类别', name : 'category_name', width : 100, sortable : true, align: 'left'}
				],
	buttons : [
		{name: '添加', bclass: 'grid_add', onpress : test},
		{ // 设置分割线  
							separator : true  },
		{name: '删除', bclass: 'grid_delete', onpress : test},
		{separator: true},
		{name: '修改', bclass: 'grid_edit', onpress : test},
		{separator: true},
		{name: '搜索', bclass: 'grid_search', onpress : test},
		{separator: true}
		],
	searchitems : [
		{display: 'ID', name : 'id'},
		{display: '考试名', name : 'name', isdefault: true},
		{display: '班级', name : 'class_name'}
		],
	sortname: "id",
	sortorder: "asc",
	usepager: true,
	singleSelect: false,
	checkbox : true,// 是否要多选框  
	//rowId : 'id',// 多选框绑定行的id  
	title: '<big>考试管理</big>',
	useRp: true,
	rp: 15,
	rpOptions : [10, 15, 20, 30, 40, 100],// 可选择设定的每页结果数 
	showTableToggleBtn: true,
	nomsg: "没有找到你要搜索的内容...",
	errormsg : '连接错误!',
	pagestat : '显示第 {from} 条到 {to} 条,共 {total} 条数据',// 显示当前页和总页面的样式  
	procmsg : '正在处理,请稍候 ...',// 正在处理的提示信息
	width : 'auto', // 宽度值，auto表示根据每列的宽度自动计算   
	height: 'auto'
	}); 
	
	function test(com,grid)
	{
		if (com=='删除'){
			selected_count = $('.trSelected', grid).length;  
			if (selected_count == 0) {  
				alert('请选择要删除的记录!');  
				return;  
			}  
			names = '';  
			$('.trSelected td:nth-child(3) div', grid).each(function(i) {  
					if (i)  
						names += ',';  
					names += $(this).text();  
				});  
			ids = '';  
			$('.trSelected td:nth-child(2) div', grid).each(function(i) {  
					if (i)  
						ids += ',';  
					ids += $(this).text();  
			})  
			if (confirm("确定删除:" + names + "\nID:"+ ids +" ?")) { 
				$.post('manageexam', {'delByIds':ids}, function(data){
				});
				$('#flex1').flexReload();   
			} 
		}
		else if (com=='添加'){ 
			alert('Add New Item');
		}
		else if (com=='修改'){
			selected_count = $('.trSelected', grid).length;  
			if (selected_count == 0) {  
				alert('请选择一条记录!');  
				return;  
			}  
			if (selected_count > 1) {  
				alert('抱歉只能同时修改一条记录!');  
				return;  
			}
			var data = new Array();  
			$('.trSelected td', grid).each(function(i) {  
											data[i] = $(this).children('div').text();  
									});
			
			alert('Edit Item : '+ data[0] +', '+  data[1]+ '.');
		}
		else if (com=='搜索'){ 
			$('.pSearch').click();
		}
	};