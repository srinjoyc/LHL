$("document").ready(function () {

	$('input[type="checkbox"]').click(function(){
        if($(this).attr("value")=="cocoa"){
            $("#cocoa1").toggle();
        }

        });

    	$('#sugar').hover(
    		function()
    		{
    		$('#change-img').attr('src','Sugar.jpg');
    		}
    	);

    	$('#coco').hover(
    		function()
    		{
    		$('#change-img').attr('src','cocoa.jpg');
    		}
    	);

    	$('#slider-sidebar-left').click(
    		function()
    		{
    		$('#step-number').hide();
    		}
    	);

    

}); /*end of jquery */