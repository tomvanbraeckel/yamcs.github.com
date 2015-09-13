$().ready(function(){
	var nav = {
		top: $('#nav').offset().top,
		left: $('#nav').offset().left
	};
	$('#nav').css({
		position:'fixed',
		top: nav.top,
		left: nav.left
	});
	var latest = {
		top: $('#latest').offset().top,
		left: $('#latest').offset().left
	}
	$('#latest').css({
		position:'fixed',
		top: nav.top,
		left: latest.left
	});
});

