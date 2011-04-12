// JavaScript Document

$(function(){	
	/** 文字效果 **/
	$('#contens label').live('click',function(){
		$(this).css({
			'color':'#0080FF',
			'font-weight':'bold'
		}).siblings().css({
			'color':'#676767',
			'font-weight':'normal'
		});
	});
	$('#contens input:text').live('keyup',function(){
		var val = $(this).val();
		if(val!='' && val!=' '){
			if($(this).hasClass('select')){
				$(this).css('background','#eee')
			}else{
				$(this).css({ 'border-bottom':'1px solid #0080FF' });
			}
		}else{
			if($(this).hasClass('select')){
				$(this).css('background','#cecbcb')
			}else{
				$(this).css({ 'border-bottom':'1px solid #a80000' });
			}
		}	
	});
	$('#contens textarea').live('keyup',function(e){
		var r = $(this).attr('scrollHeight');
		r = r<220? 220 : r;
		$(this).css({ height:r});
		var val = $(this).val();
		var w= val.match(/[a-zA-Z]*'?[a-zA-Z]/g).length;
		if(val.match(/\d+/g)){
			w +=val.match(/\d+/g).length;
		}
		$('#wordTips').html('输入单词数： <span> '+w+'</span>')
	});	
	$('span.select_an').live('mouseover',function(){
		$(this).draggable({ revert: true });
		$('input.select').droppable({
			drop: function(event, ui) {
				$(this).val($.trim(ui.draggable.text())).css('background','#eee');			
			}
		})
	});
		
	
	/** time **/
	var time = 6005;
	function addZero(m){ return (m<10?('0'+m):m) }
	function timeShow(){
		var h = addZero(parseInt(time/3600));
		var m = addZero(parseInt(time%3600/60));
		var s = addZero(time%3600%60);
		$('#timeShow').text(h+':'+m+':'+s);
		time -= 1;
		if(time == -1){
			clearInterval(timer);
		}else if(time<600){
			$('#timeShow').css('color','#e14040')
		}
	}
	timer = setInterval(timeShow,1000);
	if ( $.browser.msie && $.browser.version==6.0 ){
		$(window).scroll(function(){
			var s = $(window).scrollTop();
			$('#timeShow').css({top:s});
			$('#scrollBar').css({ top:(windowH-120+s) })
		});
	}; 							//ie6 没有fixed 问题
	
	/** ajax **/
	var pageNow = 2; //当前显示页面
	temp1 = $('<div></div>');
	temp2 = $('<div></div>');
	temp1.load('ajax/part1.html').appendTo($('#contens form'));
	temp2.load('ajax/part2.html').appendTo($('#contens form'));
	var windowH = document.documentElement.clientHeight;
	$(window).scroll(function(){
		var conH = $('#main').height()+40;
		var st = $('#timeShow').offset().top;
		//alert(st+windowH-conH);
		if(st+windowH == conH){
			/** 读取页面 **/
			var html = $('<div></div>');
			var page = 'ajax/part'+(1+pageNow)+'.html';
			if(html.load(page)){
				html.load(page).appendTo($('#contens form'));
				pageNow +=1;
			}
			/** 提交答案 **/
			$.post('post.php',$('form').serialize());
		}
	});
	
})