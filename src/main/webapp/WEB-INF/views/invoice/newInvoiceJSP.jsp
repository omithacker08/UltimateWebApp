<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

		<title> SmartAdmin </title>
		<meta name="description" content="">
		<meta name="author" content="">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
 		<meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		  <!-- js placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/static/js/jquery.js' />"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <script class="include" type="text/javascript" src="<c:url value='/static/js/jquery.dcjqaccordion.2.7.js' />"></script>
    <script src="<c:url value='/static/js/jquery.scrollTo.min.js' />"></script>
    <script src="<c:url value='/static/js/jquery.nicescroll.js" type="text/javascript' />"></script>
      <script type="text/javascript" src="<c:url value='/static/js/jquery.validate.min.js'/>"></script>
    <script src="<c:url value='/static/js/respond.min.js' />" ></script>
  
		<%@include file="../pagetemplate/commonCSSJSP.jsp" %>
	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/static/css/datepicker.css'/>" >
	</head>
	
	<!--

	TABLE OF CONTENTS.
	
	Use search to find needed section.
	
	===================================================================
	
	|  01. #CSS Links                |  all CSS links and file paths  |
	|  02. #FAVICONS                 |  Favicon links and file paths  |
	|  03. #GOOGLE FONT              |  Google font link              |
	|  04. #APP SCREEN / ICONS       |  app icons, screen backdrops   |
	|  05. #BODY                     |  body tag                      |
	|  06. #HEADER                   |  header tag                    |
	|  07. #PROJECTS                 |  project lists                 |
	|  08. #TOGGLE LAYOUT BUTTONS    |  layout buttons and actions    |
	|  09. #MOBILE                   |  mobile view dropdown          |
	|  10. #SEARCH                   |  search field                  |
	|  11. #NAVIGATION               |  left panel & navigation       |
	|  12. #RIGHT PANEL              |  right panel userlist          |
	|  13. #MAIN PANEL               |  main panel                    |
	|  14. #MAIN CONTENT             |  content holder                |
	|  15. #PAGE FOOTER              |  page footer                   |
	|  16. #SHORTCUT AREA            |  dropdown shortcuts area       |
	|  17. #PLUGINS                  |  all scripts and plugins       |
	
	===================================================================
	
	-->
	
	<!-- #BODY -->
	<!-- Possible Classes

		* 'smart-style-{SKIN#}'
		* 'smart-rtl'         - Switch theme mode to RTL
		* 'menu-on-top'       - Switch to top navigation (no DOM change required)
		* 'no-menu'			  - Hides the menu completely
		* 'hidden-menu'       - Hides the main menu but still accessable by hovering over left edge
		* 'fixed-header'      - Fixes the header
		* 'fixed-navigation'  - Fixes the main menu
		* 'fixed-ribbon'      - Fixes breadcrumb
		* 'fixed-page-footer' - Fixes footer
		* 'container'         - boxed layout mode (non-responsive: will not work with fixed-navigation & fixed-ribbon)
	
	// for material put this in body : desktop-detected pace-done smart-style-6
	-->
	<script type='text/javascript'>
	var rowNo =0;
	var xhttp = new XMLHttpRequest();
	function save(){
		var addItemBeanList =[];
		var updateItemBeanList =[];
		$('#invTable tr[data-row != "data-row"]').each(function() {
		var $tr =$(this);
		var itemBean = $tr.attr('item-bean');
		var jsonObj = JSON.parse(itemBean);
				addItemBeanList.push(jsonObj);							
		});	
		/* var token = $("meta[name='_csrf']").attr("content"); 
		var header = $("meta[name='_csrf_header']").attr("content");
		
		xhttp.open("POST", "http://localhost:8080/DreamProject/saveInv",  true);
		xhttp.setRequestHeader(header, token);
		xhttp.send(); */
		console.log(addItemBeanList);
		var param = {"invoiceVouchers": addItemBeanList};
		//console.log(JSON.stringify(addItemBeanList));
		var token = $("meta[name='_csrf']").attr("content"); 

		
				
		var header = $("meta[name='_csrf_header']").attr("content");
		var invoiceVouchers = JSON.stringify({"invoiceVouchers": addItemBeanList});
		/* xhttp.open("POST", "${pageContext.request.contextPath}/saveInvoice",  true);
		xhttp.setRequestHeader(header, token);
		xhttp.setRequestHeader("contentType", "application/json");
		xhttp.setRequestHeader("Accept", "application/json");
		xhttp.setRequestHeader("mimeType", "application/json");
		xhttp.send(invoiceVouchers); */
		   $.ajax({
			  headers: {
			        'X-CSRF-Token': token
			    },  
			type : "POST",
			url : "${pageContext.request.contextPath}/saveInvoice",
			data : invoiceVouchers,
			dataType : "json",			
			contentType : "application/json",
			mimeType: 'application/json',
			success : function(data) {
				console.log("SUCCESS: ", data);				
			},
			error : function(e) {
				console.log("ERROR: ", e);				
			},
			done : function(e) {
				console.log("DONE");
			}
		});  
	/* var formData  =	[{
			"name" : "Java Honk1",
			"location" : "NY",
			"phone" : "123456"	
		},{
			"name" : "Java Honk2",
			"location" : "NY2",
			"phone" : "123456789"		
		}];
		 $.ajax({
			 
			 headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    }, 
			type : "POST",
			url : "${pageContext.request.contextPath}/PostFormDataJSONArray",
			data : JSON.stringify({person:{
				"name" : "Java Honk1",
				"location" : "NY",
				"phone" : "123456"	
			}}),
			dataType : "json",			
			contentType : "application/json",
			mimeType: 'application/json',
			success : function(data) {
				console.log("SUCCESS: ", data);				
			},
			error : function(e) {
				console.log("ERROR: ", e);				
			},
			done : function(e) {
				console.log("DONE");
			}
		}); 
		 */
	
	}
	var deletedList =[];
	function deleteRow(field) {alert("12");
	
	var colId = field.closest("div").attr('id');
	var colIdArray = colId.split('_');
	var rowNo= colIdArray[0];
	var colName = colIdArray[1];
	var rowId="#"+rowNo;
	var itemBean = $(rowId).attr('item-bean');
	var jsonObj = JSON.parse(itemBean);
	deletedList.push(jsonObj);
	$(rowId).remove();
	}
	
	function change(field) {alert("12");
	var colId = field.closest("div").attr('id');
	var colIdArray = colId.split('_');
	var rowNo= colIdArray[0];
	var colName = colIdArray[1];
	var rowId="#"+rowNo;
	var itemBean = $(rowId).attr('item-bean');
	var jsonObj = JSON.parse(itemBean);
	alert(jsonObj[colName]);
	if(jsonObj.id != "" || jsonObj.id != 0){		
		$(rowId).data('flag','edit');				
	}
	jsonObj[colName] = field.val();
	alert(jsonObj[colName]);
	$(rowId).data('item-bean',jsonObj);
	//var list =[];
	//list.push(itemBean);
	}
	function editData(rowNo){
		var  rowId ="#"+rowNo; 
		var tr = $("#"+rowNo);
		var itemBn = tr.attr("item-bean");
		var itemBean = JSON.parse(itemBn);
		//var item-bean = $("#w3s").attr("href");
		$("#rowId").val(rowNo);
		$("input[name=desc]").val(itemBean.desc);
		$("input[name=rate]").val(itemBean.rate);
		$("input[name=qty]").val(itemBean.qty);
		$("input[name=currency]").val(itemBean.currency);
		$("input[name=exRate]").val(itemBean.exRate);
		$("input[name=rateXqty]").val(itemBean.rateXqty);
		$("input[name=amount]").val(itemBean.amount);
		$('#addBttn').hide();
		$('#editBttn').show();
		$('#myModal').modal('show');	
		
	}	
	function editRows(){
		         var rowNo = $("#rowId").val();
				var tr = $("#"+rowNo);
				var itemBn = tr.attr("item-bean");
				var itemBean = JSON.parse(itemBn);
				//var item-bean = $("#w3s").attr("href");
				itemBean.desc =$("input[name=desc]").val();
				itemBean.rate = $("input[name=rate]").val();
				itemBean.qty =$("input[name=qty]").val();
				itemBean.currency = $("input[name=currency]").val();
				itemBean.exRate = $("input[name=exRate]").val();
				itemBean.rateXqty = $("input[name=rateXqty]").val();
				itemBean.amount = $("input[name=amount]").val();
				$("#"+rowNo+"_description").text(itemBean.desc)
				$("#"+rowNo+"_rate").text(itemBean.rate);
				$("#"+rowNo+"_qty").text(itemBean.qty);
				$("#"+rowNo+"_currency").text(itemBean.currency);
				$("#"+rowNo+"_exRate").text(itemBean.exRate);
				$("#"+rowNo+"_rateXqty").text(itemBean.rateXqty);
				$("#"+rowNo+"_amount").text(itemBean.amount);
				tr.data('item-bean',itemBean);				
				$('#myModal').modal('hide');					
			}
	function addRows() {
		$('#editBttn').hide();
      rowNo++;
      var text = '{id:"'+rowNo+'",invId:"'+0+'",desc:"'+$('textarea#desc').val().trim()+'",rate:"'+$("input[name=rate]").val()+'",qty:"'+$("input[name=qty]").val()+'",currency:"'+$("input[name=currency]").val()+'",exRate:"'+$("input[name=exRate]").val()+'",rateXqty:"'+$("input[name=rateXqty]").val()+'",amount:"'+$("input[name=amount]").val()+'"}';
      var itemBean = JSON.stringify(eval("(" + text + ")"));
      //var param = {'id':rowNo,'invId':0,'desc':$('textarea#desc').val().trim(),'rate':$("input[name=rate]").val(),'qty':$("input[name=qty]").val(),'currency':$("input[name=currency]").val(),'exRate':$("input[name=exRate]").val(),'rateXqty':$("input[name=rateXqty]").val(),'amount':$("input[name=amount]").val()};
                  
      var cell01 = "<td id='"+rowNo+"_desc' column='description'><a href='#' onclick='editData("+rowNo+");'>"+$('textarea#desc').val() +"</td> ";
	  	var cell02 = "<td id='"+rowNo+"_rate' column ='rate'>"+$("input[name=rate]").val(); +"</td>";
	  	var cell03 = "<td id='"+rowNo+"_qty'   column ='qty'>"+$("input[name=qty]").val(); +"</td>";
	  	var cell04 = "<td id='"+rowNo+"_currency'  column ='currency'>"+$("input[name=currency]").val(); +"</td>";
	  	var cell05 = "<td id='"+rowNo+"_exRate'   column ='exRate'>"+$("input[name=exRate]").val(); +"</td>";
	  	var cell06 = "<td id='"+rowNo+"_rateXqty'   column ='rateXqty'>"+$("input[name=rateXqty]").val(); +"</td>";
	  	var cell07 = "<td id='"+rowNo+"_amount'  column ='amount'>"+$("input[name=amount]").val(); +"</td>";
	  	var deleteRow = "<button id='delButton' class='btn default' onclick='deleteRow($(this));'>delete</button>"
	  	var row = "<tr  data-row='data-bean' item-bean ="+itemBean+" id='"+rowNo+"'>"+cell01+cell02+cell03+cell04+cell05+cell06+cell07+"</tr>";
	      $("#invTable").append(row);
    }
        
</script>
	<body class="fixed-page-footer">

		<!-- HEADER -->
		<%@include file="../pagetemplate/topPanelJSP.jsp" %>
		<!-- END HEADER -->

		<!-- Left panel : Navigation area -->
		<!-- Note: This width of the aside area can be adjusted through LESS variables -->
		<%@include file="../pagetemplate/sidePanelJSP.jsp" %>

		<!-- MAIN PANEL -->
		<div id="main" role="main">

			<!-- RIBBON -->
			<div id="ribbon">

				<span class="ribbon-button-alignment"> 
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

				<!-- breadcrumb -->
				<ol class="breadcrumb">
					<li>Home</li><li>Tables</li><li>Data Tables</li>
				</ol>
				<!-- end breadcrumb -->

				<!-- You can also add more buttons to the
				ribbon for further usability

				Example below:

				<span class="ribbon-button-alignment pull-right">
				<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
				<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
				<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
				</span> -->

			</div>
			<!-- END RIBBON -->

			<!-- MAIN CONTENT -->
			<div id="content">
				<!-- widget grid -->
				<section id="widget-grid" class="">
				
				
				
					<div class="row">
				
						<!-- NEW COL START -->
						<article class="col-sm-12 col-md-12 col-lg-12">
				
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
								<!-- widget options:
								usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
				
								data-widget-colorbutton="false"
								data-widget-editbutton="false"
								data-widget-togglebutton="false"
								data-widget-deletebutton="false"
								data-widget-fullscreenbutton="false"
								data-widget-custombutton="false"
								data-widget-collapsed="true"
								data-widget-sortable="false"
				
								-->
								<header>
									<span class="widget-icon"> <i class="fa fa-edit"></i> </span>
									<h2>Invoice </h2>
				
								</header>
				
								<!-- widget div-->
								<div>																																	
									<!-- widget content -->
									<div class="widget-body">																									
				
											<fieldset>
												<legend>
												Invoice Form
												</legend>
										
											</fieldset>
				
				<div class="container">  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Add Data</button>
  <!-- Modal -->
  <div class="modal fade"  id="myModal" role="dialog">
    <div class="modal-dialog" style="min-width: 1000px; width: 900px;!important">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Invoice</h4>
        </div>
        <div class="modal-body">
          <div class="row">
          <div id="name" class="col-sm-12" style="background-color:lavender;" column="description">
          <label>Description</label>
          <textarea name="desc"  id = "desc"style="width:100%" value ="">
          </textarea></div>
          </div>
          <!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
          <div class="row">
          <div id="rate" class="col-sm-3" style="background-color:lavender;" column="rate">
          <label>Rate</label>
          <input type="text" name="rate" style="height:20px; width:70px;font-size:08pt;" >
          </div>
          
          <div id="qty" class="col-sm-3" style="background-color:lavender;" column="qty">
          <label>Qauntity</label>
          <input type="text" name="qty" style="height:20px; width:70px;font-size:08pt;">
          </div>
          <div id="currency" class="col-sm-3" style="background-color:lavender;" column="currency">
          <label>Currency</label>
          <input type="text" name="currency" style="height:20px; width:70px;font-size:08pt;" >
          </div>
          <div id="exRate" class="col-sm-3" style="background-color:lavender;" column="exRate">
          <label>EX-Rate</label>
          <input type="text" name="exRate" style="height:20px; width:70px;font-size:08pt;" >
          </div>
          </div>
          <div class="row">
          <div id="rateXqty" class="col-sm-4" style="background-color:lavender;" column="rateXqty">
          <label>Rate X Qauntity</label>
          <input type="text" name="rateXqty" style="height:20px; width:70px;font-size:08pt;" >
          </div>
          
          <div id="amount" class="col-sm-4" style="background-color:lavender;" column="amount">
          <label>Amount</label>
          <input type="text" name="amount" style="height:20px; width:70px;font-size:08pt;" >
          </div>
          
          </div>
          <input type="hidden" id="rowId" value=""></input>
        </div>
        <div class="modal-footer" style="padding: 8px;important;">
          <button id="addBttn" type="button" class="btn btn-default" onclick="addRows();">ADD Row</button>
          <button id="editBttn" type="button" class="btn btn-default" onclick="editRows();">Edit Row</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>      
    </div>
  </div>
  
</div>
				
				<div class="container" style="overflow-x:scroll; overflow-y:scroll;">							
										<table id="invTable" class="table table-striped">
											<thead>
												<tr data-row='data-row'>
													<th>Description</th>
													<th>Rate</th>
													<th>QTY</th>
													<th>CURRENCY</th>
													<th>Ex Rate</th>
													<th>Rate X Qty</th>
													<th>Amount</th>
												</tr>
											</thead>
											<tbody>
										</table>

									</div>
				
				
				
																						
											<div class="form-actions">
												<div class="row">
													<div class="col-md-12">
														<button class="btn btn-default" onclick="">
															Cancel
														</button>
														<button class="btn btn-primary" onclick="save();">
															<i class="fa fa-save"></i>
															Submit
														</button>
													</div>
												</div>
											</div>																		
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
				
						</article>
						<!-- END COL -->
				
				
					</div>
				
					<!-- end row -->
				
					<!-- row -->
					
					<!-- end row -->
				
					<!-- row -->
					
					<!-- end row -->		
				
				
				</section>
				<!-- end widget grid -->

			</div>
			<!-- END MAIN CONTENT -->

		</div>
		<!-- END MAIN PANEL -->

		<!-- PAGE FOOTER -->
		<div class="fixed-page-footer">
		</div>
		<!-- END PAGE FOOTER -->

		<!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
		Note: These tiles are completely responsive,
		you can add as many as you like
		-->
		<div id="shortcut">
			<ul>
				<li>
					<a href="inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
				</li>
				<li>
					<a href="calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
				</li>
				<li>
					<a href="gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
				</li>
				<li>
					<a href="invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
				</li>
				<li>
					<a href="gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
				</li>
				<li>
					<a href="profile.html" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
				</li>
			</ul>
		</div>
		<!-- END SHORTCUT AREA -->

		<!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="<c:url value='/static/js/plugin/pace/pace.min.js' />" ></script>

		
		<script>
			if (!window.jQuery) {
				document.write('<script src="/static/js/libs/jquery-2.1.1.min.js"><\/script>');
			}
		</script>

		<!-- <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js></script> -->
		<script   src="<c:url value='/static/js/jquery-ui.min.js' />"    integrity="sha256-lnH4vnCtlKU2LmD0ZW1dU7ohTTKrcKP50WA9fa350cE="   crossorigin="anonymous"></script>
		<script>
			if (!window.jQuery.ui) {
				document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
			}
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="<c:url value='/static/js/app.config.js' />"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="<c:url value='/static/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js' />"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="<c:url value='/static/js/bootstrap/bootstrap.min.js' />"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="<c:url value='/static/js/notification/SmartNotification.min.js' />"></script>

		<!-- JARVIS WIDGETS -->
		<script src="<c:url value='/static/js/smartwidgets/jarvis.widget.min.js' />" ></script>

		<!-- EASY PIE CHARTS -->
		<script src="<c:url value='/static/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js' />" ></script>

		<!-- SPARKLINES -->
		<script src="<c:url value='/static/js/plugin/sparkline/jquery.sparkline.min.js' />" ></script>

		<!-- JQUERY VALIDATE -->
		<script src="<c:url value='/static/js/plugin/jquery-validate/jquery.validate.min.js' />" ></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="<c:url value='/static/js/plugin/masked-input/jquery.maskedinput.min.js' />" ></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="<c:url value='/static/js/plugin/select2/select2.min.js' />" ></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="<c:url value='/static/js/plugin/bootstrap-slider/bootstrap-slider.min.js' />" ></script>

		<!-- browser msie issue fix -->
		<script src="<c:url value='/static/js/plugin/msie-fix/jquery.mb.browser.min.js' />" ></script>

		<!-- FastClick: For mobile devices -->
		<script src="<c:url value='/static/js/plugin/fastclick/fastclick.min.js' />" ></script>

		<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->

		<!-- Demo purpose only -->
		<script src="<c:url value='/static/js/demo.min.js' />" ></script>

		<!-- MAIN APP JS FILE -->
		<script src="<c:url value='/static/js/app.min.js' />" ></script>

		<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
		<!-- Voice command : plugin -->
		<script src="<c:url value='/static/js/speech/voicecommand.min.js' />" ></script>

		<!-- SmartChat UI : plugin -->
		<script src="<c:url value='/static/js/smart-chat-ui/smart.chat.ui.min.js' />" ></script>
		<script src="<c:url value='/static/js/smart-chat-ui/smart.chat.manager.min.js' />" ></script>

		<!-- PAGE RELATED PLUGIN(S) -->
		<script src="<c:url value='/static/js/plugin/maxlength/bootstrap-maxlength.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/bootstrap-timepicker/bootstrap-timepicker.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/clockpicker/clockpicker.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/bootstrap-tags/bootstrap-tagsinput.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/ion-slider/ion.rangeSlider.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/bootstrap-duallistbox/jquery.bootstrap-duallistbox.min.js' />" ></script>		
		<script src="<c:url value='/static/js/plugin/colorpicker/bootstrap-colorpicker.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/knob/jquery.knob.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/x-editable/moment.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/x-editable/jquery.mockjax.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/x-editable/x-editable.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/typeahead/typeahead.min.js' />" ></script>
		<script src="<c:url value='/static/js/plugin/typeahead/typeaheadjs.min.js' />" ></script>
		<script src="<c:url value='/static/js/bootstrap-datepicker.js' />" ></script>

		<script type="text/javascript">
		
		// DO NOT REMOVE : GLOBAL FUNCTIONS!

		var slider1 = document.getElementById('nouislider-1'),
			slider2 = document.getElementById('nouislider-2'),
			slider3 = document.getElementById('nouislider-3'),
			slider4 = document.getElementById('nouislider-4');
		
		$(document).ready(function() {
			
			pageSetUp();
			
			 // PAGE RELATED SCRIPTS
		
			 // Spinners
			$("#spinner").spinner();
			$("#spinner-decimal").spinner({
			    step: 0.01,
			    numberFormat: "n"
			});
		
			$("#spinner-currency").spinner({
			    min: 5,
			    max: 2500,
			    step: 25,
			    start: 1000,
			    numberFormat: "C"
			});
		
			 //Maxlength
			
		    $('input[maxlength]').maxlength({
		        warningClass: "label label-success",
		        limitReachedClass: "label label-important",
		    });
		
			 // START AND FINISH DATE
			$('#startdate').datepicker({
			    dateFormat: 'dd.mm.yy',
			    prevText: '<i class="fa fa-chevron-left"></i>',
			    nextText: '<i class="fa fa-chevron-right"></i>',
			    onSelect: function (selectedDate) {
			        $('#finishdate').datepicker('option', 'minDate', selectedDate);
			    }
			});
			$('#finishdate').datepicker({
			    dateFormat: 'dd.mm.yy',
			    prevText: '<i class="fa fa-chevron-left"></i>',
			    nextText: '<i class="fa fa-chevron-right"></i>',
			    onSelect: function (selectedDate) {
			        $('#startdate').datepicker('option', 'maxDate', selectedDate);
			    }
			});
		
			 // Date Range Picker
			$("#from").datepicker({
			    defaultDate: "+1w",
			    changeMonth: true,
			    numberOfMonths: 3,
			    prevText: '<i class="fa fa-chevron-left"></i>',
			    nextText: '<i class="fa fa-chevron-right"></i>',
			    onClose: function (selectedDate) {
			        $("#to").datepicker("option", "maxDate", selectedDate);
			    }
		
			});
			$("#to").datepicker({
			    defaultDate: "+1w",
			    changeMonth: true,
			    numberOfMonths: 3,
			    prevText: '<i class="fa fa-chevron-left"></i>',
			    nextText: '<i class="fa fa-chevron-right"></i>',
			    onClose: function (selectedDate) {
			        $("#from").datepicker("option", "minDate", selectedDate);
			    }
			});
		
			/*
			 * TIMEPICKER
			 */
		
			$('#timepicker').timepicker();

			/*
			 * CLOCKPICKER
			 */
			
			$('#clockpicker').clockpicker({
				placement: 'top',
			    donetext: 'Done'
			});
			
			/*
			 * JS SLIDER
			 */
	
		    
		    noUiSlider.create(slider1, {
		        range: {
					'min': 20,
					'max': 100
				},
				behaviour: 'tap',
		        start: 55,
		        connect: 'upper',
		    });


		    noUiSlider.create(slider2, {
		        range: {
					'min': 0,
					'max': 300
				},
		        start: [55, 130],
		        step: 60,
		        connect: true
		    });


			noUiSlider.create(slider3, {
		        range: {
					'min': 0,
					'max': 1000
				},
		        start: [264, 776],
		        step: 1,
		        connect: true
		    });

		    slider3.noUiSlider.on('update', function(values){
		        $(".nouislider-value").text(values[0] + " - " + values[1]);
		    });

		    slider3.noUiSlider.on('slide', function(values){
				//var values = $(this).val();
		        $(".nouislider-value").text(values[0] + " - " + values[1]);
			});

			noUiSlider.create(slider4, {
		        range: {
					'min': 0,
					'max': 100
				},
				behaviour: 'tap',
		        start: 50,
		        connect: 'upper'
		        
		    });

		    slider4.setAttribute('disabled', true);
		
		
			/*
			 * ION SLIDER
			 */
		
		    $("#range-slider-1").ionRangeSlider({
		        min: 0,
		        max: 5000,
		        from: 1000,
		        to: 4000,
		        type: 'double',
		        step: 1,
		        postfix: " &euro;",
		        prettify: false,
		        grid: true,
		        inputValuesSeparator: ';'
		    });
		
		    $("#range-slider-2").ionRangeSlider({
		    	min: 1000,
		        max: 100000,
		        from: 30000,
		        to: 90000,
		        type: 'double',
		        step: 500,
		        postfix: " &euro;",
		        prettify: false,
		        grid: true,
		        inputValuesSeparator: ';'
		    });
		
		    $("#range-slider-3").ionRangeSlider({
		        min: 0,
		        from: 2.3,
		        max: 10,
		        type: 'single',
		        step: 0.1,
		        postfix: " mm",
		        prettify: false,
		        grid: true,
		        inputValuesSeparator: ';'
		    });
		
		    $("#range-slider-4").ionRangeSlider({
		        min: -50,
		        max: 50,
		        from: 5,
		        to: 25,
		        type: 'double',
		        step: 1,
		        postfix: "�",
		        prettify: false,
		        grid: true,
		        inputValuesSeparator: ';'
		    });
		
		    $("#range-slider-5").ionRangeSlider({
		        min: 0,
		        from: 0,
		        max: 10,
		        type: 'single',
		        step: 0.1,
		        postfix: " mm",
		        prettify: false,
		        grid: true,
		        inputValuesSeparator: ';'
		    });
		
		
			/*
			 * BOOTSTRAP DUALLIST BOX
			 */
					
			var initializeDuallistbox = $('#initializeDuallistbox').bootstrapDualListbox({
	          nonSelectedListLabel: 'Non-selected',
	          selectedListLabel: 'Selected',
	          preserveSelectionOnMove: 'moved',
	          moveOnSelect: false,
	          nonSelectedFilter: 'ion ([7-9]|[1][0-2])'
	        });
			
		
			/*
			 * COLOR PICKER
			 */
		
		    $('#colorpicker-1').colorpicker()
		    $('#colorpicker-2').colorpicker()
		
		
		
			/*
			 * KNOB
			 */
		
		    $('.knob').knob({
                change: function (value) {
                    //console.log("change : " + value);
                },
                release: function (value) {
                    //console.log(this.$.attr('value'));
                    //console.log("release : " + value);
                },
                cancel: function () {
                    //console.log("cancel : ", this);
                }
            });
		
		
			/*
			 * X-Ediable
			 */

		
		    (function (e) {
		        "use strict";
		        var t = function (e) {
		            this.init("address", e, t.defaults)
		        };
		        e.fn.editableutils.inherit(t, e.fn.editabletypes.abstractinput);
		        e.extend(t.prototype, {
		            render: function () {
		                this.$input = this.$tpl.find("input")
		            },
		            value2html: function (t, n) {
		                if (!t) {
		                    e(n).empty();
		                    return
		                }
		                var r = e("<div>").text(t.city).html() + ", " + e("<div>").text(t.street).html() +
		                    " st., bld. " + e("<div>").text(t.building).html();
		                e(n).html(r)
		            },
		            html2value: function (e) {
		                return null
		            },
		            value2str: function (e) {
		                var t = "";
		                if (e)
		                    for (var n in e)
		                        t = t + n + ":" + e[n] + ";";
		                return t
		            },
		            str2value: function (e) {
		                return e
		            },
		            value2input: function (e) {
		                if (!e)
		                    return;
		                this.$input.filter('[name="city"]').val(e.city);
		                this.$input.filter('[name="street"]').val(e.street);
		                this.$input.filter('[name="building"]').val(e.building)
		            },
		            input2value: function () {
		                return {
		                    city: this.$input.filter('[name="city"]').val(),
		                    street: this.$input.filter('[name="street"]').val(),
		                    building: this.$input.filter('[name="building"]').val()
		                }
		            },
		            activate: function () {
		                this.$input.filter('[name="city"]').focus()
		            },
		            autosubmit: function () {
		                this.$input.keydown(function (t) {
		                    t.which === 13 && e(this).closest("form").submit()
		                })
		            }
		        });
		        t.defaults = e.extend({}, e.fn.editabletypes.abstractinput.defaults, {
		            tpl: '<div class="editable-address"><label><span>City: </span><input type="text" name="city" class="input-small"></label></div><div class="editable-address"><label><span>Street: </span><input type="text" name="street" class="input-small"></label></div><div class="editable-address"><label><span>Building: </span><input type="text" name="building" class="input-mini"></label></div>',
		            inputclass: ""
		        });
		        e.fn.editabletypes.address = t
		    })(window.jQuery);
		
		    //ajax mocks
		    $.mockjaxSettings.responseTime = 500;
		
		    $.mockjax({
		        url: '/post',
		        response: function (settings) {
		            log(settings, this);
		        }
		    });
		
		    $.mockjax({
		        url: '/error',
		        status: 400,
		        statusText: 'Bad Request',
		        response: function (settings) {
		            this.responseText = 'Please input correct value';
		            log(settings, this);
		        }
		    });
		
		    $.mockjax({
		        url: '/status',
		        status: 500,
		        response: function (settings) {
		            this.responseText = 'Internal Server Error';
		            log(settings, this);
		        }
		    });
		
		    $.mockjax({
		        url: '/groups',
		        response: function (settings) {
		            this.responseText = [{
		                value: 0,
		                text: 'Guest'
		            }, {
		                value: 1,
		                text: 'Service'
		            }, {
		                value: 2,
		                text: 'Customer'
		            }, {
		                value: 3,
		                text: 'Operator'
		            }, {
		                value: 4,
		                text: 'Support'
		            }, {
		                value: 5,
		                text: 'Admin'
		            }];
		            log(settings, this);
		        }
		    });
		
		    //TODO: add this div to page
		    function log(settings, response) {
		        var s = [],
		            str;
		        s.push(settings.type.toUpperCase() + ' url = "' + settings.url + '"');
		        for (var a in settings.data) {
		            if (settings.data[a] && typeof settings.data[a] === 'object') {
		                str = [];
		                for (var j in settings.data[a]) {
		                    str.push(j + ': "' + settings.data[a][j] + '"');
		                }
		                str = '{ ' + str.join(', ') + ' }';
		            } else {
		                str = '"' + settings.data[a] + '"';
		            }
		            s.push(a + ' = ' + str);
		        }
		        s.push('RESPONSE: status = ' + response.status);
		
		        if (response.responseText) {
		            if ($.isArray(response.responseText)) {
		                s.push('[');
		                $.each(response.responseText, function (i, v) {
		                    s.push('{value: ' + v.value + ', text: "' + v.text + '"}');
		                });
		                s.push(']');
		            } else {
		                s.push($.trim(response.responseText));
		            }
		        }
		        s.push('--------------------------------------\n');
		        $('#console').val(s.join('\n') + $('#console').val());
		    }
		
		    /*
		     * X-EDITABLES
		     */
		
		    $('#inline').on('change', function (e) {
		        if ($(this).prop('checked')) {
		            window.location.href = '?mode=inline#ajax/plugins.html';
		        } else {
		            window.location.href = '?#ajax/plugins.html';
		        }
		    });
		
		    if (window.location.href.indexOf("?mode=inline") > -1) {
		        $('#inline').prop('checked', true);
		        $.fn.editable.defaults.mode = 'inline';
		    } else {
		        $('#inline').prop('checked', false);
		        $.fn.editable.defaults.mode = 'popup';
		    }
		
		    //defaults
		    $.fn.editable.defaults.url = '/post';
		    //$.fn.editable.defaults.mode = 'inline'; use this to edit inline
		
		    //enable / disable
		    $('#enable').click(function () {
		        $('#user .editable').editable('toggleDisabled');
		    });
		
		    //editables
		    $('#username').editable({
		        url: '/post',
		        type: 'text',
		        pk: 1,
		        name: 'username',
		        title: 'Enter username'
		    });
		
		    $('#firstname').editable({
		        validate: function (value) {
		            if ($.trim(value) == '')
		                return 'This field is required';
		        }
		    });
		
		    $('#sex').editable({
		        prepend: "not selected",
		        source: [{
		            value: 1,
		            text: 'Male'
		        }, {
		            value: 2,
		            text: 'Female'
		        }],
		        display: function (value, sourceData) {
		            var colors = {
		                "": "gray",
		                1: "green",
		                2: "blue"
		            }, elem = $.grep(sourceData, function (o) {
		                    return o.value == value;
		                });
		
		            if (elem.length) {
		                $(this).text(elem[0].text).css("color", colors[value]);
		            } else {
		                $(this).empty();
		            }
		        }
		    });
		
		    $('#status').editable();
		
		    $('#group').editable({
		        showbuttons: false
		    });
		
		    $('#vacation').editable({
		        datepicker: {
		            todayBtn: 'linked'
		        }
		    });
		
		    $('#dob').editable();
		
		    $('#event').editable({
		        placement: 'right',
		        combodate: {
		            firstItem: 'name'
		        }
		    });
		
		    $('#meeting_start').editable({
		        format: 'yyyy-mm-dd hh:ii',
		        viewformat: 'dd/mm/yyyy hh:ii',
		        validate: function (v) {
		            if (v && v.getDate() == 10)
		                return 'Day cant be 10!';
		        },
		        datetimepicker: {
		            todayBtn: 'linked',
		            weekStart: 1
		        }
		    });
		
		    $('#comments').editable({
		        showbuttons: 'bottom'
		    });
		
		    $('#note').editable();
		    $('#pencil').click(function (e) {
		        e.stopPropagation();
		        e.preventDefault();
		        $('#note').editable('toggle');
		    });
		
		    $('#state').editable({
		        source: ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut",
		            "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
		            "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
		            "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
		            "New Mexico", "New York", "North Dakota", "North Carolina", "Ohio", "Oklahoma", "Oregon",
		            "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
		            "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
		        ]
		    });
		
		    $('#state2').editable({
		        value: 'California',
		        typeahead: {
		            name: 'state',
		            local: ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut",
		                "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
		                "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",
		                "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
		                "New Jersey", "New Mexico", "New York", "North Dakota", "North Carolina", "Ohio",
		                "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
		                "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia",
		                "Wisconsin", "Wyoming"
		            ]
		        }
		    });
		
		    $('#fruits').editable({
		        pk: 1,
		        limit: 3,
		        source: [{
		            value: 1,
		            text: 'banana'
		        }, {
		            value: 2,
		            text: 'peach'
		        }, {
		            value: 3,
		            text: 'apple'
		        }, {
		            value: 4,
		            text: 'watermelon'
		        }, {
		            value: 5,
		            text: 'orange'
		        }]
		    });
		
		    $('#tags').editable({
		        inputclass: 'input-large',
		        select2: {
		            tags: ['html', 'javascript', 'css', 'ajax'],
		            tokenSeparators: [",", " "]
		        }
		    });
		
		    var countries = [];
		    $.each({
		        "BD": "Bangladesh",
		        "BE": "Belgium",
		        "BF": "Burkina Faso",
		        "BG": "Bulgaria",
		        "BA": "Bosnia and Herzegovina",
		        "BB": "Barbados",
		        "WF": "Wallis and Futuna",
		        "BL": "Saint Bartelemey",
		        "BM": "Bermuda",
		        "BN": "Brunei Darussalam",
		        "BO": "Bolivia",
		        "BH": "Bahrain",
		        "BI": "Burundi",
		        "BJ": "Benin",
		        "BT": "Bhutan",
		        "JM": "Jamaica",
		        "BV": "Bouvet Island",
		        "BW": "Botswana",
		        "WS": "Samoa",
		        "BR": "Brazil",
		        "BS": "Bahamas",
		        "JE": "Jersey",
		        "BY": "Belarus",
		        "O1": "Other Country",
		        "LV": "Latvia",
		        "RW": "Rwanda",
		        "RS": "Serbia",
		        "TL": "Timor-Leste",
		        "RE": "Reunion",
		        "LU": "Luxembourg",
		        "TJ": "Tajikistan",
		        "RO": "Romania",
		        "PG": "Papua New Guinea",
		        "GW": "Guinea-Bissau",
		        "GU": "Guam",
		        "GT": "Guatemala",
		        "GS": "South Georgia and the South Sandwich Islands",
		        "GR": "Greece",
		        "GQ": "Equatorial Guinea",
		        "GP": "Guadeloupe",
		        "JP": "Japan",
		        "GY": "Guyana",
		        "GG": "Guernsey",
		        "GF": "French Guiana",
		        "GE": "Georgia",
		        "GD": "Grenada",
		        "GB": "United Kingdom",
		        "GA": "Gabon",
		        "SV": "El Salvador",
		        "GN": "Guinea",
		        "GM": "Gambia",
		        "GL": "Greenland",
		        "GI": "Gibraltar",
		        "GH": "Ghana",
		        "OM": "Oman",
		        "TN": "Tunisia",
		        "JO": "Jordan",
		        "HR": "Croatia",
		        "HT": "Haiti",
		        "HU": "Hungary",
		        "HK": "Hong Kong",
		        "HN": "Honduras",
		        "HM": "Heard Island and McDonald Islands",
		        "VE": "Venezuela",
		        "PR": "Puerto Rico",
		        "PS": "Palestinian Territory",
		        "PW": "Palau",
		        "PT": "Portugal",
		        "SJ": "Svalbard and Jan Mayen",
		        "PY": "Paraguay",
		        "IQ": "Iraq",
		        "PA": "Panama",
		        "PF": "French Polynesia",
		        "BZ": "Belize",
		        "PE": "Peru",
		        "PK": "Pakistan",
		        "PH": "Philippines",
		        "PN": "Pitcairn",
		        "TM": "Turkmenistan",
		        "PL": "Poland",
		        "PM": "Saint Pierre and Miquelon",
		        "ZM": "Zambia",
		        "EH": "Western Sahara",
		        "RU": "Russian Federation",
		        "EE": "Estonia",
		        "EG": "Egypt",
		        "TK": "Tokelau",
		        "ZA": "South Africa",
		        "EC": "Ecuador",
		        "IT": "Italy",
		        "VN": "Vietnam",
		        "SB": "Solomon Islands",
		        "EU": "Europe",
		        "ET": "Ethiopia",
		        "SO": "Somalia",
		        "ZW": "Zimbabwe",
		        "SA": "Saudi Arabia",
		        "ES": "Spain",
		        "ER": "Eritrea",
		        "ME": "Montenegro",
		        "MD": "Moldova, Republic of",
		        "MG": "Madagascar",
		        "MF": "Saint Martin",
		        "MA": "Morocco",
		        "MC": "Monaco",
		        "UZ": "Uzbekistan",
		        "MM": "Myanmar",
		        "ML": "Mali",
		        "MO": "Macao",
		        "MN": "Mongolia",
		        "MH": "Marshall Islands",
		        "MK": "Macedonia",
		        "MU": "Mauritius",
		        "MT": "Malta",
		        "MW": "Malawi",
		        "MV": "Maldives",
		        "MQ": "Martinique",
		        "MP": "Northern Mariana Islands",
		        "MS": "Montserrat",
		        "MR": "Mauritania",
		        "IM": "Isle of Man",
		        "UG": "Uganda",
		        "TZ": "Tanzania, United Republic of",
		        "MY": "Malaysia",
		        "MX": "Mexico",
		        "IL": "Israel",
		        "FR": "France",
		        "IO": "British Indian Ocean Territory",
		        "FX": "France, Metropolitan",
		        "SH": "Saint Helena",
		        "FI": "Finland",
		        "FJ": "Fiji",
		        "FK": "Falkland Islands (Malvinas)",
		        "FM": "Micronesia, Federated States of",
		        "FO": "Faroe Islands",
		        "NI": "Nicaragua",
		        "NL": "Netherlands",
		        "NO": "Norway",
		        "NA": "Namibia",
		        "VU": "Vanuatu",
		        "NC": "New Caledonia",
		        "NE": "Niger",
		        "NF": "Norfolk Island",
		        "NG": "Nigeria",
		        "NZ": "New Zealand",
		        "NP": "Nepal",
		        "NR": "Nauru",
		        "NU": "Niue",
		        "CK": "Cook Islands",
		        "CI": "Cote d'Ivoire",
		        "CH": "Switzerland",
		        "CO": "Colombia",
		        "CN": "China",
		        "CM": "Cameroon",
		        "CL": "Chile",
		        "CC": "Cocos (Keeling) Islands",
		        "CA": "Canada",
		        "CG": "Congo",
		        "CF": "Central African Republic",
		        "CD": "Congo, The Democratic Republic of the",
		        "CZ": "Czech Republic",
		        "CY": "Cyprus",
		        "CX": "Christmas Island",
		        "CR": "Costa Rica",
		        "CV": "Cape Verde",
		        "CU": "Cuba",
		        "SZ": "Swaziland",
		        "SY": "Syrian Arab Republic",
		        "KG": "Kyrgyzstan",
		        "KE": "Kenya",
		        "SR": "Suriname",
		        "KI": "Kiribati",
		        "KH": "Cambodia",
		        "KN": "Saint Kitts and Nevis",
		        "KM": "Comoros",
		        "ST": "Sao Tome and Principe",
		        "SK": "Slovakia",
		        "KR": "Korea, Republic of",
		        "SI": "Slovenia",
		        "KP": "Korea, Democratic People's Republic of",
		        "KW": "Kuwait",
		        "SN": "Senegal",
		        "SM": "San Marino",
		        "SL": "Sierra Leone",
		        "SC": "Seychelles",
		        "KZ": "Kazakhstan",
		        "KY": "Cayman Islands",
		        "SG": "Singapore",
		        "SE": "Sweden",
		        "SD": "Sudan",
		        "DO": "Dominican Republic",
		        "DM": "Dominica",
		        "DJ": "Djibouti",
		        "DK": "Denmark",
		        "VG": "Virgin Islands, British",
		        "DE": "Germany",
		        "YE": "Yemen",
		        "DZ": "Algeria",
		        "US": "United States",
		        "UY": "Uruguay",
		        "YT": "Mayotte",
		        "UM": "United States Minor Outlying Islands",
		        "LB": "Lebanon",
		        "LC": "Saint Lucia",
		        "LA": "Lao People's Democratic Republic",
		        "TV": "Tuvalu",
		        "TW": "Taiwan",
		        "TT": "Trinidad and Tobago",
		        "TR": "Turkey",
		        "LK": "Sri Lanka",
		        "LI": "Liechtenstein",
		        "A1": "Anonymous Proxy",
		        "TO": "Tonga",
		        "LT": "Lithuania",
		        "A2": "Satellite Provider",
		        "LR": "Liberia",
		        "LS": "Lesotho",
		        "TH": "Thailand",
		        "TF": "French Southern Territories",
		        "TG": "Togo",
		        "TD": "Chad",
		        "TC": "Turks and Caicos Islands",
		        "LY": "Libyan Arab Jamahiriya",
		        "VA": "Holy See (Vatican City State)",
		        "VC": "Saint Vincent and the Grenadines",
		        "AE": "United Arab Emirates",
		        "AD": "Andorra",
		        "AG": "Antigua and Barbuda",
		        "AF": "Afghanistan",
		        "AI": "Anguilla",
		        "VI": "Virgin Islands, U.S.",
		        "IS": "Iceland",
		        "IR": "Iran, Islamic Republic of",
		        "AM": "Armenia",
		        "AL": "Albania",
		        "AO": "Angola",
		        "AN": "Netherlands Antilles",
		        "AQ": "Antarctica",
		        "AP": "Asia/Pacific Region",
		        "AS": "American Samoa",
		        "AR": "Argentina",
		        "AU": "Australia",
		        "AT": "Austria",
		        "AW": "Aruba",
		        "IN": "India",
		        "AX": "Aland Islands",
		        "AZ": "Azerbaijan",
		        "IE": "Ireland",
		        "ID": "Indonesia",
		        "UA": "Ukraine",
		        "QA": "Qatar",
		        "MZ": "Mozambique"
		    }, function (k, v) {
		        countries.push({
		            id: k,
		            text: v
		        });
		    });
		
		    $('#country').editable({
		        source: countries,
		        select2: {
		            width: 200
		        }
		    });
		
		    $('#address').editable({
		        url: '/post',
		        value: {
		            city: "Moscow",
		            street: "Lenina",
		            building: "12"
		        },
		        validate: function (value) {
		            if (value.city == '')
		                return 'city is required!';
		        },
		        display: function (value) {
		            if (!value) {
		                $(this).empty();
		                return;
		            }
		            var html = '<b>' + $('<div>').text(value.city).html() + '</b>, ' + $('<div>').text(value.street)
		                .html() + ' st., bld. ' + $('<div>').text(value.building).html();
		            $(this).html(html);
		        }
		    });
		
		    $('#user .editable').on('hidden', function (e, reason) {
		        if (reason === 'save' || reason === 'nochange') {
		            var $next = $(this).closest('tr').next().find('.editable');
		            if ($('#autoopen').is(':checked')) {
		                setTimeout(function () {
		                    $next.editable('show');
		                }, 300);
		            } else {
		                $next.focus();
		            }
		        }
		    });	
		    
		    		
	
		})

		</script>

		<!-- Your GOOGLE ANALYTICS CODE Below -->
		<script type="text/javascript">
			var _gaq = _gaq || [];
				_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
				_gaq.push(['_trackPageview']);
			
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();

			
			$("div").find("[column] input").on('change', function() {
			   
			        // do stuff with things
			   
			});
			
			</script>

	</body>

</html>
<html>
