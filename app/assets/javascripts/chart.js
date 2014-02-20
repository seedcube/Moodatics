
$(function () {
   var sleep_value = []  
        if($('#container').length)
        {
	 
        }
        else
        {
	         return false
        } 
        var date_value = $('#container').data('date').split(","); 
        try {
            sleep_value = $('#container').data('sleep').split(","); 
       }catch(err)
       {
	          sleep_value[0] = $('#container').data('sleep');
       }
            categories = date_value,
            data = []      
                i = 0       
                $.each(sleep_value, function( index, value ) {   
	                   ob = {}
								     ob['y'] = parseInt(value)
								     if(value >= 10){
								        ob['color'] = '#FF0000' 
						         }else if(value < 10 && value >= 6){
							          ob['color'] = '#33FF00' 
						         }else if(value < 6){
							          ob['color'] = '#3333FF' 
						         }
								     data[i] = ob;  
								     i = i + 1
								});
                 
     
        var chart = $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title: {
						    text: 'Sleep Chart'
						},
           
            xAxis: {
                categories: categories
               
            },
           	yAxis: {
						            type: 'column',
						            tickInterval: 3,
						            min: 1,
						            max: 24,  
						           	title: {
												    text: 'Hrs Slept'
												},
						        },
            
             series: [{
	                data: data,
	                color: 'white'
	            }
	          ],
            legend: false,
            tooltip: false
           
        })
        .highcharts(); // return chart
    });

