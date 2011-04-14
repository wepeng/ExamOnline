//管理成绩的table
$("#flex1").flexigrid
	({
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
		{name: '修改', bclass: 'grid_edit', onpress : test},
		{separator: true},
		{name: '搜索', bclass: 'grid_search', onpress : test},
		{separator: true}
		],
	searchitems : [
		{display: '学号', name : 'username', isdefault: true},
		{display: '姓名', name : 'name'},
		{display: '班级', name : 'class_name'}
		],
	sortname: "student_id",
	sortorder: "asc",
	usepager: true,
	singleSelect: false,
	checkbox : true,// 是否要多选框  
	//rowId : 'id',// 多选框绑定行的id  
	title: '<big>成绩管理</big>',
	useRp: true,
	rp: 15,
	rpOptions : [5,10,15, 20, 30, 40, 100],// 可选择设定的每页结果数 
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
		if (com=='修改'){
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
			$('#student_id').val(data[0]);
			$('#examination_id').val(data[4]);
			$('#username').html(data[1]);
			$('#name').html(data[2]);
			$('#examination_name').html(data[5]);
			$('#parts_score').val(data[7]);
			$('#total_score').val(data[8]);
		}
		else if (com=='搜索'){ 
			$('.pSearch').click();
		}
	};