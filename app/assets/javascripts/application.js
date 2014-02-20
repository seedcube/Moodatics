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
//= require foundation  
//= require turbolinks 
//= require highcharts   
//= require chart  
//= require jquery.validate.min.js


$(document).foundation();    

function date_renge(value, element){   
  next = Date.parse(DateOneWeekNext(value))  
 past = Date.parse(DateOneWeekBack(value)) 
 

 if (new Date().getTime() > 7) 
 {
	  return true
 }
 else if(new Date().getTime() < 7)
 {
	 return false  
 }
 else
 {
	 return true  
 }
 
}  
function MMDDYYYY(str) {
        var ndateArr = str.toString().split(' ');
        var Months = 'Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec';
        return (parseInt(Months.indexOf(ndateArr[1])/4)+1)+'/'+ndateArr[2]+'/'+ndateArr[3];
    }
function DateOneWeekBack(str){ 
        str = str.split(/\D+/);
        str = new Date(str[2],str[0]-1,(parseInt(str[1])-7));
        return MMDDYYYY(str);
} 
function DateOneWeekNext(str){ 
        str = str.split(/\D+/);
        str = new Date(str[2],str[0]-1,(parseInt(str[1])+7));
        return MMDDYYYY(str);
}

$( document ).ready(function() { 
	  
 // alert(3)    
	
	$.validator.addMethod("FutureDate",
	    function (value, element) { return date_renge(value, element) },
	    "Date must be in the one week old or next one week."
	);
	
  $("#new_mood_datum").validate({
	     
	 	rules: {
	    "mood_datum[entry_at]": {
	      required: true,
	      FutureDate: true
	    }, 
	    "mood_datum[sleep]": {
	      required: true,
	      number: true
	    },
	  }
	
   }); 

   $('#add-more-button').on('click', function(){
	     add_more_significat_field();
   });  
   $('.remove-add-more-field').on('click', function(){
	     remove_more_significat_field(this);
   });             
}); 

function add_more_significat_field(){  
  $('#add-significant_events-today li').size()
	val = $('#keep-row-id').data('row-id') 
	row_id =  val + 1
	str = '<li class="row" style="clear:both;" data-row-id="'+row_id+'"><div class="number large-1 columns small-1" style="text-align:center;">'+null+'</div><div class="large-10 columns small-11"><input type="text" name="significant_events['+row_id+']"> </div><div class="large-1 columns small-4"><a href="javascript:void();" class="remove-add-more-field button tiny alert" onclick="$(this).parent().parent().remove(); ">Remove</a></div></li>' 
 
	  $('#add-significant_events-today').append(str)
	  $('#keep-row-id').data('row-id',row_id)  
	
		i = 1
	  $('#add-significant_events-today li').each(function() {   
	    $(this).find('.number').text(i)
      i = i + 1
    });
}   
function remove_more_significat_field(ele){ 
	 // alert(3)  
	  $(ele).parent().parent().remove();   
	  i = 1
	  $('#add-significant_events-today li').each(function() {   
	    $(this).find('.number').text(i)
      i = i + 1
    });
	  
}


