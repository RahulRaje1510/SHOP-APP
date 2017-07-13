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

    <title>Customer Bill</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

</head>

<body>
<%@include file="commonpage1.html" %>
<form class="form-horizontal">
  <div class="form-group">
  
    <label class="control-label col-sm-2" for="cname">Product Name:</label>
    <div class="col-sm-3">
      <input type="cname" class="form-control" id="cname" placeholder="Enter Product Name">
    </div>
    
    <div class="col-sm-3"> 
     <button type="button" class="btn btn-outline-primary">Show</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <button type="" class="btn btn-outline-primary">Show All Data</button>
    </div>
  </div>
 
   <div class="container">            
  <table class="table table-bordered" >
    <thead>
      <tr class="warning">
        <th><center>Product Name</center></th>
        <th class="col-xs-3"><center>Brand Name</center></th>
        <th class="col-xs-1">Product Quantity</th>
        <th class="col-xs-1">Product Price</th>
        <th class="col-xs-1">Expire Date</th>
        <th class="col-xs-1">Product Size</th>
      </tr>
    </thead>
    <tbody class="bg-success">
      <%for(int i=0;i<5;i++){ %>
<tr><td>Number</td>
<td><%=i+1 %></td>
<td>Number</td>
<td>Number</td>
<td>Number</td>
<td>Number</td>
</tr>
<%} %>
    </tbody>
  </table>
</div>            
</div>
    
  </form>
</body>
</html>