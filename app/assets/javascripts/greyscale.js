// jQuery to collapse the navbar on scroll
$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});

// Hides the notification flash
$(document).ready(function(){
	setTimeout(function(){
		$('#notice-wrapper').fadeOut("slow", function() {
			$(this).remove();
		})
	}, 4500);
});

$().alert('close');
