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
 

 if (new Date(value) > new Date()) 
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
	    "Date must be Today in or with in last one week."
	); 
	
	$("#chart_form").validate();  
	
  $("#new_mood_datum").validate({
	     
	 	rules: {
	    "mood_datum[entry_at]": {
	      required: true,
	      FutureDate: true
	    }, 
	    "mood_datum[sleep]": {
	      required: true, 
	      range: [1, 24],    
	      number: true
	    },
	    "mood_datum[mood]": {
	      required: true 
	    }, 
	    "mood_datum[irritability]": {
	      required: true 
	    },  
	    "mood_datum[anxiety]": {
	      required: true 
	    }
    },
		errorPlacement: function(error, element) {  
			if(element.attr('name') == 'mood_datum[mood]' || element.attr('name') == 'mood_datum[irritability]' || element.attr('name') == 'mood_datum[anxiety]'){  
				error.appendTo( element.parent().next() );               
			} 
		},
	
   }); 

   $('#add-more-button').on('click', function(){
	     add_more_significat_field();
   });  
   $('.remove-add-more-field').on('click', function(){
	     remove_more_significat_field(this);
   });             
}); 

function add_more_significat_field(){  
	
	text = $('#significant_value').val();
  if(text != '' && text != null){
	$('#significant_value').val('');
  $('#add-significant_events-today li').size()
	val = $('#add-significant_events-today').data('row-id') 
	row_id =  val + 1
	str = '<li class="row" style="clear:both;" data-row-id="'+row_id+'"><div class="number large-1 columns small-1" style="text-align:center;">'+null+'</div><div class="large-10 columns small-11"><span class="input-value">'+text+'</span><input type="hidden" name="significant_events['+row_id+']" value='+text+'> </div><div class="large-1 columns small-4"><a href="javascript:void();" class="remove-add-more-field button tiny alert" onclick="$(this).parent().parent().remove(); ">Remove</a></div></li>' 
 
	  $('#add-significant_events-today').append(str)
	  $('#add-significant_events-today').data('row-id',row_id)  
	
		i = 1
	  $('#add-significant_events-today li').each(function() {   
	    $(this).find('.number').text(i)
      i = i + 1
    }); 
   }
   else
   {
	   $('#significant_value').addClass('error'); 
   }
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


