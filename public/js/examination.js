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

})