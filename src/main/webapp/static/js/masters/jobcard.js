var Jobcard = {};


Jobcard.validation = function(){
	$.validator.setDefaults({
		/*submitHandler: function() { 
        	//http://javahonk.com/spring-mvc-post-form-submit-ajax-jquery/
        	//https://code.tutsplus.com/tutorials/24-best-practices-for-ajax-implementations--net-9180
        	 var producer = $('#producer').val();
            var model = $('#model').val();
            var price = $('#price').val();
            var json = { "producer" : producer, "model" : model, "price": price};
             
         $.ajax({
              url: $("#newSmartphoneForm").attr( "action"),
              data: JSON.stringify(json),
              type: "POST",
               
              beforeSend: function(xhr) {
                  xhr.setRequestHeader("Accept", "application/json");
                  xhr.setRequestHeader("Content-Type", "application/json");
              },
              success: function(smartphone) {
                  var respContent = "";
                   
                  respContent += "<span class='success'>Smartphone was created: [";
                  respContent += smartphone.producer + " : ";
                  respContent += smartphone.model + " : " ;
                  respContent += smartphone.price + "]</span>";
                   
                  $("#sPhoneFromResponse").html(respContent);         
              }
          });
        	
        	alert("submitted!"); }*/
    });
	
	$(function(){
		
		 $("#broker").on("input",function(){

	         var val = $('#broker').val().trim();
	         val = val.replace(/\s+/g, '');
	         
	         var url = window.location.href

	         var arr = url.split("/");

	    	 var finalUrl = arr[0] + "//" + arr[2]+"/"+ arr[3]+"/dropdown";
	         
	    	 
	    	 var nameProp = 'currencyId';
	    	 var valueProp = 'code';
	    	 var filter = 'where code like :firstParam';

	         if(val != "" && val.length == 2) { //for checkin
		
		
		var options = {

				  url: function(phrase) {
				    return finalUrl+"/Currency/get.action";
				  },

				  getValue: "value",

				    template: {
				        type: "description",
				        fields: {
				            description: "key"
				        }
				    },
				  //{"key":"1","value":"INR"},{"key":"2","value":"INR"},{"key":"3","value":"INR"}
				  ajaxSettings: {
				    dataType: "json",
				    method: "GET",
				    data: "nameProp="+nameProp+"&valueProp="+valueProp+"&filter="+filter+"&firstParam="+val
				  },

//				  preparePostData: function(data) {
//				    data.phrase = "nameProp="+nameProp+"&valueProp="+valueProp+"&filter="+filter+"&firstParam="+$("#broker").val();
//				    return data;
//				  },

				  requestDelay: 400
				};

				$("#broker").easyAutocomplete(options);
				 $("#broker").focus();
	         }

		    }); 
	});

	$(function(){

	    $("#salesPerson").on("input",function(){

	         var val = $(this).val().trim();
	         val = val.replace(/\s+/g, '');

	         if(val != "" && val.length % 3 == 0) { //for checking 3 characters
	               //your logic here
	        	 
	        	 var url = window.location.href

	             var arr = url.split("/");

	        	 var finalUrl = arr[0] + "//" + arr[2]+"/"+ arr[3]+"/dropdown";
	             
	        	 
	        	 var nameProp = 'currencyId';
	        	 var valueProp = 'code';
	        	 var filter = 'where code like :firstParam';
	        	 
	             $.ajax({
	            	 type: "GET",
	            	 url:finalUrl+"/Currency/get.action",
	            	 data: "nameProp="+nameProp+"&valueProp="+valueProp+"&filter="+filter+"&firstParam="+val,
	            	 dataType: "json",
	            	 success: function (data) {
	            		 $.each(data,function(i,obj)
	            				 {
	            			 //alert(obj.value+":"+obj.key);
	            			 var div_data="<option value="+obj.key+">"+obj.value+"</option>";
	            			 //alert(div_data);
	            			 $(div_data).appendTo('#currency'); 
	            				 });  
	            	 }
	             });
	             
//	             var text2 = $("#salesPerson").tautocomplete({
//	                 width: "500px",
//	                 columns: ['key', 'value'],
//	                 ajax: {
//	                	 type: "GET",
//		            	 url:finalUrl+"/Currency/get.action",
//		            	 data: "nameProp="+nameProp+"&valueProp="+valueProp+"&filter="+filter+"&firstParam="+val,
//		            	 dataType: "json",
//	                     success: function (data) {
//	                         
//	                         var filterData = [];
//
//	                         var searchData = eval("/" + val + "/gi");
//
//	                         $.each(data, function (i, v) {
//	                                 filterData.push(v);
//	                         });
//	                         return filterData;
//	                     }
//	                 },
//	                 onchange: function () {
//	                     $("#ta-txt").html(text2.text());
//	                     $("#ta-id").html(text2.id());
//	                 }
//	             });
	             
//	             $("#salesPerson").typeahead({
//	              
//	            	 remote: {
//	            		    url: finalUrl+"/Currency/get.action",
//	            		    replace: function(url, uriEncodedQuery) {
//	            		      val = $('#First_Name').val();
//	            		      if (!val) return url;
//	            		      //correction here
//	            		      return url + "nameProp="+nameProp+"&valueProp="+valueProp+"&filter="+filter+"&firstParam="+val + encodeURIComponent(val)
//	            		    }
//	            	 	},
//	            		    limit: 10
//	            		    
////	                 ajax: {
////	                     url: finalUrl+"/Currency/get.action",
////	                     data:"nameProp="+nameProp+"&valueProp="+valueProp+"&filter="+filter+"&firstParam="+val,
////	                     timeout: 500,
////	                     triggerLength: 3,
////	                     method: "GET",
////	                     dataType: "JSON",
////	                     success: function (data) {
////	                    	console.log(data);
////	                 		data = $.parseJSON(data);
////	         	            return process(data);
////	                     }              
////	                 }
//	             });
	             
	             
	        	
	        	$("#portmasterByPortLoadingId").val($("#selectedPortLoadingId").val());
	        	$("#portmasterByPortDischargeId").val($("#selectedPortDischargeId").val());
	        	$("#portOfOriginId").val($("#selectedPortOriginId").val());
	         }

	    });      
	});
	
    $().ready(function() {
    	
        // validate the comment form when it is submitted
    	//$("#jobCardForm").validate();
    	 var url = window.location.href

         var arr = url.split("/");

    	 var finalUrl = arr[0] + "//" + arr[2]+"/"+ arr[3]+"/dropdown";
    	 
    	 var nameProp = 'currencyId';
    	 var valueProp = 'code';
    	 var filter = 'where code like :firstParam';
    	 
    	 var val = $(this).val().trim();
         val = val.replace(/\s+/g, '');
         
    	$("#currency").select2({
            //placeholder: 'Select Currency',
            ajax: {
            	 url:finalUrl+"/Currency/get.action",
            	// data: "nameProp="+nameProp+"&valueProp="+valueProp+"&filter="+filter+"&firstParam="+ $(this).val().trim(),
            	 data: function (params) {
            	      var query = {
            	        search: params.term,
            	        page: params.page,
            	        nameProp : nameProp,
            	        valueProp ,valueProp,
            	        filter : filter
            	      }

            	      // Query paramters will be ?search=[term]&page=[page]
            	      return query;
            	    },
            	 dataType: "json",
	              delay: 250,
	              processResults: function (data) {
	            	  var div_data = "";
	            	  $.each(data, function () {
	            	    	  div_data=div_data +"<option value="+this.key+">"+this.value+"</option>";
	            				 });  
	            	  return {
	                      results: data
	                    };
	            	    //options.add(new Option("Please select", "[-]"));
	            	    
//	            		 $.each(data,function(i,obj)
//	            				 {
//	            			 //alert(obj.value+":"+obj.key);
//	            			 var div_data="<option value="+obj.key+">"+obj.value+"</option>";
//	            			 //alert(div_data);
//	            			 $(div_data).appendTo('#currency'); 
//	            				 });  
	            	 
	              },
	              cache: true
	            }
          	});
    	$("#consignee").select2();
    	$("#currency").select2();
    	$("#port").select2();
    	$("#portOfLoading").select2();
    	$("#portOfDischarge").select2();
    	$("#portmasterByPortDischargeId").select2();
    	$("#portmasterByPortLoadingId").select2();
//    	 var url = window.location.href
//
//         var arr = url.split("/");
//
//    	 var finalUrl = arr[0] + "//" + arr[2]+"/"+ arr[3]+"/";
//         
//         $.ajax({
//        	 type: "GET",
//        	 url:finalUrl+"getAllCurrencies",
//        	 dataType: "json",
//        	 success: function (data) {
//        		 $.each(data.aaData,function(i,obj)
//        				 {
//        			 //alert(obj.value+":"+obj.key);
//        			 var div_data="<option value="+obj.key+">"+obj.value+"</option>";
//        			 //alert(div_data);
//        			 $(div_data).appendTo('#currency'); 
//        				 });  
//        	 }
//         });
//    	
//    	$("#portmasterByPortLoadingId").val($("#selectedPortLoadingId").val());
//    	$("#portmasterByPortDischargeId").val($("#selectedPortDischargeId").val());
//    	$("#portOfOriginId").val($("#selectedPortOriginId").val());
    	//$("#active").val($('input[name="active"]').val());

        // validate signup form on keyup and submit
        $("#jobCardForm").validate({
            rules: {
                activityName: {
                    required: true,
                    minlength: 2
                },
                agentCode: {
                    required: true,
                    minlength: 2
                },
                port: "required",
                telephone: {
                    required: true,
                    minlength: 7
                },
                email: {
                    required: true,
                    email: true
                }
               // active: "required"
            },
            messages: {
            	agentName: "Please enter your agentName",
            	agentCode: "Please enter your agentCode",
            	port: {
                    required: "Please enter a port",
                    minlength: "Your port must consist of at least 2 characters"
                },
                telephone: {
                    required: "Please provide a telephone",
                    minlength: "Your telephone must be at least 7 characters long"
                },
                email: "Please enter a valid email address",
                active: "Please make it active to use it further"
            }
        });
        $('.bookingDate').datepicker({
            autoclose: true
        });
        $('.expectedShipmentDate').datepicker({
            autoclose: true
        });
        toastr.options = {
                "closeButton": true,
                "debug": false,
                "progressBar": false,
                "positionClass": "toast-top-right",
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
              }
        if($("#message").val() != ""){
        	var $toast = toastr.success($("#message").val(), "Success");
        }

        /*// propose username by combining first- and lastname
        $("#username").focus(function() {
            var firstname = $("#firstname").val();
            var lastname = $("#lastname").val();
            if(firstname && lastname && !this.value) {
                this.value = firstname + "." + lastname;
            }
        });

        //code to hide topic selection, disable for demo
        var newsletter = $("#newsletter");
        // newsletter topics are optional, hide at first
        var inital = newsletter.is(":checked");
        var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
        var topicInputs = topics.find("input").attr("disabled", !inital);
        // show when newsletter is checked
        newsletter.click(function() {
            topics[this.checked ? "removeClass" : "addClass"]("gray");
            topicInputs.attr("disabled", !this.checked);
        });*/
    });
}();