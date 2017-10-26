jQuery(window).on("load", function() {
	"use strict";
	/* -----------------------------------------
	FlexSlider Init
	----------------------------------------- */
	jQuery("#homeslider").flexslider({
		controlNav: false
	});

	jQuery(".testimonial-sld").flexslider({
		controlNav: false,
		directionNav: false
	});

});

jQuery(document).ready(function($) {
	"use strict";

	/* -----------------------------------------
	Main Navigation Init
	----------------------------------------- */
	$('ul#navigation').superfish({
		delay:       300,
		animation:   {opacity:'show'},
		speed:       'fast',
		dropShadows: false
	});

	/* -----------------------------------------
	Responsive Menus Init with jPanelMenu
	----------------------------------------- */
	var jPM = $.jPanelMenu({
		menu: '#navigation',
		trigger: '.menu-trigger',
		excludedPanelContent: "style, script, #wpadminbar"
	});

	var jRes = jRespond([
		{
			label: 'mobile',
			enter: 0,
			exit: 767
		}
	]);

	jRes.addFunc({
		breakpoint: 'mobile',
		enter: function() {
			jPM.on();
		},
		exit: function() {
			jPM.off();
		}
	});

	/* -----------------------------------------
	Fancybox (Image Lightbox) Init
	----------------------------------------- */
	$(".fancybox").fancybox({
		fitToView	: true
	});

	/* -----------------------------------------
	 Map Init
	 ----------------------------------------- */
	if ( $('#map').length ) {
		map_init();
	}

});


function map_init() {
	'use strict';
	var myLatlng = new google.maps.LatLng(33.59,-80);
	var mapOptions = {
		zoom: 8,
		center: myLatlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById('map'), mapOptions);

	var contentString = '<div id="content">Change it to whatever your want! <strong>HTML</strong> too!</div>';

	var infowindow = new google.maps.InfoWindow({
		content: contentString
	});

	var marker = new google.maps.Marker({
		position: myLatlng,
		map: map,
		title: 'Hello'
	});
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map,marker);
	});
}