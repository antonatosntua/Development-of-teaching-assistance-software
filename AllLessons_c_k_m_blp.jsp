<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%
 
String reportName ="";
session.setAttribute("reportName",".jasper"); 
String chk;
String query = ""+session.getAttribute("query");
if (request.getParameter("query") != null)
{
query = ""+request.getParameter("query");
} 
// out.write(query);
query=query.replace("null","");

String que ="select a.Rn,a.User_Id,a.User_IdD,a.Courses_IdD,a.Lesson_Id,a.Lesson_Descr,a.Lesson_IdD,Fr_Lesson_DateD,To_Lesson_DateD,a.Tot_Users,a.HD_STAT, a.HD_STAT_DATA,a.COLSPAN_CN,a.plot_x,a.plot_y ,START_STATUS S,END_STATUS  E from VW_ALL_LESSONS a where 1=1 and  start_status = 0 and end_status = 1  and user_id ="+session.getAttribute("UserId")+" "+query;
 //out.write(que);
Connection ConnrsetMulti =null;
PreparedStatement StatementrsetMulti= null;
ResultSet rsetMulti= null;
Statement stmt = null;
ResultSet resultSet= null;
int rowCount = 0;
try{
Context initCtx870M = new InitialContext();
Context envCtx870M = (Context) initCtx870M.lookup("java:comp/env");
DataSource ds870M = (DataSource )envCtx870M.lookup("jdbc/edtpr");
ConnrsetMulti = ds870M.getConnection();
 
stmt = ConnrsetMulti.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
resultSet = stmt.executeQuery(que);
resultSet.last();
rowCount = resultSet.getRow();
StatementrsetMulti= ConnrsetMulti.prepareStatement(que);
rsetMulti= StatementrsetMulti.executeQuery();
boolean rsetMulti_isEmpty = !rsetMulti.next();
boolean rsetMulti_hasData = !rsetMulti_isEmpty;
Object rsetMulti_data;
int rsetMulti_numRows = 0;
%>
<%
int Repeat1__numRows = 100;
int Repeat1__index = 0;
rsetMulti_numRows += Repeat1__numRows;
%>
<%@ include file="paging.jsp" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<script type="text/javascript">
//configure refresh interval (in seconds)
var countDownInterval=30;
//configure width of displayed text, in px (applicable only in NS4)
var c_reloadwidth=200;
</script>
<script  type="text/javascript">

var countDownTime=countDownInterval+1;

function ref(){
countDownTime=countDownInterval+1;
}

function countDown(){
countDownTime--;
//if (countDownTime%12) {Chk_Enhm('find_not_see.jsp');}
if (countDownTime <=0){
countDownTime=countDownInterval;
clearTimeout(counter)
window.location.reload()
return
}
if (document.all) //if IE 4+
document.all.countDownText.innerText = countDownTime+" ";
else if (document.getElementById) //else if NS6+
document.getElementById("countDownText").innerHTML=countDownTime+" "
else if (document.layers){ //CHANGE TEXT BELOW TO YOUR OWN
document.c_reload.document.c_reload2.document.write('Επόμενη   <a style="color:red href="javascript:window.location.reload()">Ανανέωση Σελίδας </a>  σε <b style="color:red"   id="countDownText">'+countDownTime+' </b> δευτερόλεπτα')
document.c_reload.document.c_reload2.document.close()
}
counter=setTimeout("countDown()", 1000);

}

function startit(){
if (document.all||document.getElementById) //CHANGE TEXT BELOW TO YOUR OWN
document.write('Επόμενη   <a href="javascript:window.location.reload()" style="color:red" >Ανανέωση Σελίδας</a>  σε <b style="color:red" id="countDownText">'+countDownTime+' </b> δευτερόλεπτα')
countDown()
}

if (document.all||document.getElementById)
startit()
else
window.onload=startit

</script> 	
 
 
<script language="JavaScript">
 
function highlight(which,color){
if (document.all||document.getElementById)
which.style.backgroundColor=color
}


</script>
<script>
function Start_Lesson(p_lesson) {

var timh = p_lesson;

  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    
            document.getElementById("Start").disabled = true;
			document.getElementById("Start").title = 'Έγινε έραρξη Μαθήματος';
			
			
        	
  }
  xhttp.open("GET", "Start_Lesson.jsp?Lesson_Id="+timh);
  xhttp.send();
}

function End_Lesson(p_lesson) {

var timh = p_lesson;

  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("End").innerHTML = this.responseText;
	
            document.getElementById("End").disabled = true;
			document.getElementById("End").title = 'Έληξε το Μαθήμα';
  }
  xhttp.open("GET", "End_Lesson.jsp?Lesson_Id="+timh);
  xhttp.send();
}
</script>

<html>
<head>
	<link rel="stylesheet" href="css/css_multi.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<title></title>
<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
<!--script src="https://cdn.plot.ly/plotly-latest.min.js">  </script -->
<script src="./js_plotly/plotly-latest.min.js">  </script>


<style>
		.popup {
			position: fixed;
			z-index: 1;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgba(0, 0, 0, 0.4);
			display: none;
		}
		.popup-content {
			background-color: white;
			margin: 10% auto;
			padding: 20px;
			border: 1px solid #888888;
			width: 30%;
			font-weight: bolder;
		}
		.popup-content button {
			display: block;
			margin: 0 auto;
		}
		.show {
			display: block;
		}
		h1 {
			color: green;
		}
	</style>
	
<%@ include file="lock.jsp" %>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"   onLoad="Val_Cur_Date(<%=rsetMulti.getObject("plot_x")%>,<%=rsetMulti.getObject("plot_y")%>,'myplot','<%=rsetMulti.getObject("Courses_IdD")%>/<%=rsetMulti.getObject("Lesson_Descr")%> Από:<%=rsetMulti.getObject("Fr_Lesson_DateD")%> Εως:<%=rsetMulti.getObject("To_Lesson_DateD")%>');">
 <%
 String S=""+rsetMulti.getObject("S");
 String E=""+rsetMulti.getObject("E");
%>
<div >
<a   ><input type="image" id="Start" name="Start"   width="50px"   height="50px"  src="images/start.jpg" <%=((S.equals("0"))?"disabled=disabled style=color:red TITLE='Εγινε Εναρξη Μαθήματος '":" title='Εναρξη Μαθήματος' style='color:#FF0000'") %>  onClick="Start_Lesson(<%=rsetMulti.getObject("Lesson_Id")%>);" > </a>
<a  title="Λήξη Μαθήματος">   <input type="image" id="End" name="End"       width="50px"  height="50px"   src="images/stop.jpg"  <%=((E.equals("0"))?"disabled=disabled style=color:red TITLE='Εγινε Λήξη Μαθήματος '":" title='Λήξη Μαθήματος' style='color:#FF0000'") %>   onClick="End_Lesson(<%=rsetMulti.getObject("Lesson_Id")%>);" > </a>

</div>

<% if (rsetMulti_hasData)
{ %>
<p>
  <% 
%>
</p>

<div id="multi_record"  align="center">
<table class="records" width="80%" border="0" align="center">

<%
 int i=0; %>
<form name="frm870" method="post" action="" onSubmit="">


<div id="myplot" style="width:100%;max-width:700px"    title="Πάτησε ένα κλικ του ποντικού για να κλεισει το παραθηρο"  onClick="clearBox('myplot')">
	             </div>	
				 
<% while ((rsetMulti_hasData)&&(Repeat1__numRows-- != 0)) { %>


  <%
  i++;
  Repeat1__index++;
  rsetMulti_hasData = rsetMulti.next();
}
%>
<input name="selectedaithma" type="hidden" value="-1">
</form>
</table>


</div>

<div align="center" id="m_ekt_exag">
<%
}
else {out.println("<div   align=\"center\"><font color=\"#CC3333\" size=\"8\" ><br>Δεν υπάρχουν εγγραφές</font><p><div><br><a href=\"AllLessons_k_k.jsp\">&nbsp;&nbsp;"+
				  "<img src=\"images/find.png\" name=\"\" width=\"30\" height=\"30\" alt=\" Νέα Κκριτήρια \"></a></div></div><br><br><br><br>");%>
<%}
%>
  </div>
<%
 }
catch(SQLException e) {String mhnyma_oloklhro = e.toString();
                              out.println("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+e +"</div>");
				
							  %>
							  <%//@ include file="footer_catch.jsp"%>
							  <%
							  }
finally {ConnrsetMulti.close();}
%>

	
      <script> 
		function Val_Cur_Date(f_xArray,f_yArray,tm,f_title) {
		
         //   alert(f_title);
			const layout = {title:f_title};

			const data = [{labels:f_xArray, values:f_yArray, type:"pie"}];

			Plotly.newPlot(tm, data, layout);
	
	        } 
			function clearBox(elementID)
{
    document.getElementById(elementID).innerHTML = "";
}

			</script>
</BODY>
</HTML>
