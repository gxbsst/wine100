// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.f5
//= require validate
//= require bootstrap.lightbox
// require_tree .


function remove_fields(link) {
	$(link).parent().find("input[type=hidden]").attr('value',"1");  
	$(link).parent().hide();
}
function add_fields(link, association, content, outer_class) {

	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
  // $(link).up().insert({
  //   before: content.replace(regexp, new_id)
  // });
var new_content = content.replace(regexp, new_id)
$(outer_class).append(new_content);

}

$(document).ready(function(){ 

	$('#wine100_wine_style').on('change', function() {
	  if(this.value == '甜葡萄酒' ) {
	  	$("#sweetness-outer").show();
	  }else{
	  	$("#sweetness-outer").hide();
	  }
	});

});
