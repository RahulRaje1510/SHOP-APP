<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/css/bootstrap-datepicker.min.css" />

	

    <title>Purchase</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

</head>

<body>
<%@include file="commonpage1.html" %>
<form class="form-horizontal" action=purchaseServlet  method="post">
  <div class="form-group">
    <label class="control-label col-sm-2" >Buyer Name:</label>
    <div class="col-sm-3">
      <input type="cname" class="form-control" id="cname" name="cname" placeholder="Enter Buyer Name">
    </div>
     <label class="control-label col-sm-2">Bill Number:</label>
    <div class="col-sm-3"> 
      <input type="Ino" class="form-control" id="Ino" name="Ino" placeholder="Enter Bill Number">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" >Mobile Number:</label>
    <div class="col-sm-3"> 
      <input type="mobno" class="form-control" id="mobno" name="mobno" placeholder="Enter Mobile Number">
    </div>
    <label class="control-label col-sm-2">Date:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control col-sm-1" id="datepicker1" name="datepicker1">
</div>
    </div>
    <script>
    $(document).ready(function() {
    	  var date = new Date();
    	  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
    	  var end = new Date(date.getFullYear(), date.getMonth(), date.getDate());

    	  $('#datepicker1').datepicker({
    	format: "mm/dd/yyyy",
    	todayHighlight: true,
    	startDate: today,
    	endDate: end,
    	autoclose: true
    	  });
    	  $('#datepicker2').datepicker({
    	format: "mm/dd/yyyy",
    	todayHighlight: true,
    	startDate: today,
    	endDate: end,
    	autoclose: true
    	  });

    	  $('#datepicker1,#datepicker2').datepicker('setDate', today);
    	});
    </script>
  </div>
  </div>
   <div class="form-group">
    <label class="control-label col-sm-2" >Product Name:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control" id="pname" name="pname" placeholder="Enter Product Name">
    </div>
    <label class="control-label col-sm-2" >Product Cost:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control" id="pcost" name="pcost" placeholder="Enter Product Cost">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" >Product Quantity:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control" id="qty" name="qty" placeholder="Enter Product Quantity">
    </div>
	 <div class="col-xs-6">
        <button type="button" class="btn btn-primary btn-lg pull-right" onclick="calc()">Add </button>
    </div> 
  </div>
  <div class="container">            
  <table class="table table-bordered " id="mytable">
    <thead>
      <tr class="warning">
        <th class="col-xs-4">Product_Name</th>
        <th class="col-xs-1">Product_Cost</th>
        <th class="col-xs-1">Units</th>
        <th class="col-xs-1">Total</th>
      </tr>
    </thead>
    <tbody  class="bg-success">
     
    </tbody>
  </table><br><br>
</div>            
<script>
var calctotal=0;
function calc() {
    var table = document.getElementById("mytable");
    var row = table.insertRow(1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    
    cell1.innerHTML = pname.value;
    cell2.innerHTML = pcost.value;
    cell3.innerHTML = qty.value;
    var totalv=pcost.value*qty.value;
    cell4.innerHTML = totalv;
    calctotal+=totalv;
    document.getElementById("amt").value = calctotal;
}
</script>

  
    <label class="control-label col-sm-9">Total Amount:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control" id="amt" name="amt" placeholder="Total Amount">
    </div>
  	<div class="row">
  <div class="col-sm-12">
    <div class="text-center">
      <button class="btn btn-primary" id="submit"> Submit</button>
    </div>
  </div>
</div>
   
  </form>
</body>
</html>