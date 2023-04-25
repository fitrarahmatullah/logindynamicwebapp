<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
/* Popup container - can be anything you want */
.popup {
  position: relative;
  display: inline-block;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* The actual popup */
.popup .popuptext {
  visibility: hidden;
  width: 160px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 8px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}

/* Toggle this class - hide and show the popup */
.popup .show {
  visibility: visible;
  -webkit-animation: fadeIn 1s;
  animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
  from {opacity: 0;} 
  to {opacity: 1;}
}

@keyframes fadeIn {
  from {opacity: 0;}
  to {opacity:1 ;}
}
</style>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<br><br>
<%
Object value = request.getAttribute("value");
%>
Welcome 
<div class="popup" onclick="myFunction()"> &lt;?:userID&gt;
  <span class="popuptext" id="myPopup"><%=value%></span>
</div>

<br>
<br>

<%@page import="java.util.ArrayList" %>
<%@page import="Bean.DataMap" %>
<%@page import="java.text.DecimalFormat" %>
<table>
<thead>
	<tr style="background-color:blue;color:white;">
		<th>Department</th>
		<th>StudentId</th>
		<th>Marks</th>
		<th>Pass %</th>
	</tr>
</thead>
<tbody>
	<%
		 ArrayList<DataMap> list = (ArrayList) request.getAttribute("data");
	var pass1 =0;
	var pass2 =0;
	double pass3 =0;
	for (var j = 0; j < (list.size()); j++){
			if(j < 4){
				if(list.get(j).getMarks() >40){
					pass1++;
				}
			}else if(j==4){
				if(list.get(j).getMarks() >40){
					pass2++;
				}
			}else{
				if(list.get(j).getMarks() >40){
					pass3++;
				}
			}
		}
	pass1 = pass1*100/4;
	pass2 = pass2*100/1;
	pass3 = pass3*100/3;
	DecimalFormat priceFormatter = new DecimalFormat("#0.00");
	%>
	<%
		for (var i = 0; i < (list.size()); i++){
	%>
	<tr>
		
		<%if(i==0){ %>
			<td rowspan=4><%=list.get(i).getDepartment()%></td>
		<%}else if(i==4){ %>
			<td><%=list.get(i).getDepartment()%></td>
		<%}else if(i==5){ %>
			<td rowspan=3><%=list.get(i).getDepartment()%></td>
		<%} %>
		<td  style="color:blue;"><div class="popup" onclick="myFunction2()"> <%=list.get(i).getStudentId()%>
  		<span class="popuptext" id="myPopup2"><%=list.get(i).getStudentName()%></span>
		</div></td>
		<td><%=list.get(i).getMarks()%></td>
		
		<%if(i==0){%>
			<td rowspan=4><%=pass1%></td>
		<%}else if(i==4){ %>
			<td><%=pass2%></td>
		<%}else if(i==5){ %>
			<td rowspan=3><%= priceFormatter.format(pass3)%></td>
		<%} %>
	</tr>
	
	<% 
				} 
	%> 
</tbody>
</tr>




</table>

<script>
// When the user clicks on div, open the popup
function myFunction() {
  var popup = document.getElementById("myPopup");
  popup.classList.toggle("show");
}
function myFunction2() {
	  var popup = document.getElementById("myPopup2");
	  popup.classList.toggle("show");
}
</script>


</body>
</html>