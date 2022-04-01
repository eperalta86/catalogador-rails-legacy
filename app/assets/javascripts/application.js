// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function() {
  $('.imagen-pequena').magnificPopup({

  	type:'image',
  	mainClass: 'mfp-with-zoom', // this class is for CSS animation below

  	zoom: {
	    enabled: true,

	    duration: 300, 
	    easing: 'ease-in-out', 

	    opener: function(openerElement) {
	    	return openerElement.is('img') ? openerElement : openerElement.find('img');
	    }
  }

  });
});