<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


    <title>Customer Bill</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/css/bootstrap-datepicker.min.css" />

	
	
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<style type="text/css">
div.form-control {
    line-height: 50%;
}
</style>
<script type="text/javascript">
document.getElementById("date").innerHTML = Date();
</script>

</head>

<body>
<%@include file="commonpage1.html" %>
<form class="form-horizontal">

  <div class="form-group">
    <label class="control-label col-sm-3">Customer Name:</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="cname" placeholder="Enter Customer Name">
    </div>
     <label class="control-label col-sm-2">Invoice Number:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control" id="Ino" placeholder="Enter Invoice Number">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-3">Mobile Number:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control" id="mobno" placeholder="Enter Mobile Number" required>
    </div>
            <label class="control-label col-sm-2">Date:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control col-sm-1" id="datepicker1">
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
  <div class="form-group">
    <label class="control-label col-sm-3" >E-Mail ID:</label>
    <div class="col-sm-3"> 
      <input type="email" class="form-control" id="mid" placeholder="Enter E-Mail ID">
    </div>
 <div class="form-group">
    <label class="control-label col-sm-2">Address:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control" id="addr" placeholder="Enter Customer Address">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-3" >Product Name:</label>
    <div class="col-sm-3"> 
      <input type="text" class="form-control" id="pname" name="pname"placeholder="Enter Product Name" required>
    </div>
 <div class="form-group">
    <label class="control-label col-sm-2" >Quantity:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control" id="qty" name="qty" placeholder="Enter Product Quantity" required>          
    </div>
  </div> 
  <div class="container">         
  <table class="table table-bordered" id="mytable"> 
  <div>  
  <inptu type="Button" class=" btn btn-info btn-lg col-sm-1 pull-right"  onclick="calc()">Add </button>  
   </div>     
    <thead>
      <tr class="warning">
        <th class="col-xs-2">Quantity</th>
        <th class="col-xs-6">Product Name</th>
         <th>Unit Price</th>
        <th>Total Amount</th>
      </tr>
    <  </thead>
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
        String pname_p = request.getParameter("pname"); 
        Connection conn=null;
        var cost=null;
    			Class.forName("com.mysql.jdbc.Driver");
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","swarajya"); 
    			 String query="select Pcost_i from stock where Pname_i= pname_p";
    		       Statement stmt=conn.createStatement();
    		       ResultSet rs=stmt.executeQuery(query);
    		       while(rs.next())
    		       {
    		  
    		       cost=rs.getInt(Pcost_i);
    		       }
    			
    		   	cell1.innerHTML = qty.value;
    		    cell2.innerHTML = pname.value;
    		    cell3.innerHTML = cost;
    		    cell4.innerHTML = totalv;
    		    var totalv=cost*qty.value;
        calctotal+=totalv;
        document.getElementById("amt").value = calctotal;
    }
    </script>

  <div class="form-group">
    <label class="control-label col-sm-9" for="amt">Total Amount:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control" id="amt" placeholder="Total Amount">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-5" for="cc">Coupon Code:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control" id="cc" placeholder="Enter Coupon Code">
    </div>
     <label class="control-label col-sm-2" for="ca">Customer Amount:</label>
    <div class="col-sm-2"> 
      <input type="text" class="form-control" id="ca" placeholder="Customer Pay Amount">
    </div>
  </div>
  <div class="form-group">
   
    <a href="terms.jsp"  class="control-label col-sm-6">Terms & Conditions</a>
     <a href="#" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-print"></span> Print
        </a>
  </div>
  </form>
</body>
</html>