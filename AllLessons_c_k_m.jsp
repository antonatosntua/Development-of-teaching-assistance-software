<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%
 
String chk;
String query = ""+session.getAttribute("query");
if (request.getParameter("query") != null)
{
query = ""+request.getParameter("query");
} 
// out.write(query);
query=query.replace("null","");

String que ="SELECT A.Rn, A.User_Id, A.User_Idd, A.Courses_Idd, A.Lesson_Id, A.Lesson_Idd, TO_CHAR (A.Fr_Lesson_Date, 'HH24.MI') L_F, A.Fr_Lesson_Dated, A.To_Lesson_Dated, TO_CHAR (A.To_Lesson_Date, 'HH24.MI') L_T, A.Fr_Lesson_Dated, A.To_Lesson_Dated, '( ' || A.Lesson_Id || ' ) ' || A.Lesson_Descr Lesson_Descr, A.Tot_Users, A.Plot_X_T, A.Plot_Y_T, A.Plot_X_Aa, A.Plot_Y_Aa, A.Plot_X_La, A.Plot_Y_La, A.Plot_X_Ax, A.Plot_Y_Ax, A.Start_Status S, A.End_Status E, f_find_start_end_answers (A.Lesson_Id) ANS FROM ALL_LESSONS_STATISTIC_n A WHERE 1 = 1   and user_id ="+session.getAttribute("UserId")+" "+query;
// out.write(que);
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
 


 

<script>
		function Answers(p_lesson) {

		var timh = p_lesson;
		  document.getElementById("Answers").disabled = true;
		  document.getElementById("Answers").enabled = false;
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			         
					alert('Eγινε η Καταχώρηση');
					//document.getElementById("Answers").enabled = true;
					//document.getElementById("Answers").disabled = false;
					document.getElementById("Start_Ans").disabled = true;
					document.getElementById("Start_Ans").enabled = false;
					
					document.getElementById("End_Ans").disabled = false;
					document.getElementById("End_Ans").enabled = true;
				//	document.getElementById("Answers").title = 'Έγινε έραρξη Μαθήματος';
		  }
		  xhttp.open("GET", "Answers.jsp?Lesson_Id="+timh);
		  xhttp.send();
		}



////////
		function Start_Lesson(p_lesson) {
		
		var timh = p_lesson;
		
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			
					document.getElementById("Start").disabled = true;
					document.getElementById("End").disabled = false;
					document.getElementById("Start_Ans").disabled = false;
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

<script>
		function Start_Lesson_Ans(p_lesson) {
		
		var timh = p_lesson;
		
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			
					document.getElementById("Start_Ans").disabled = true;
					document.getElementById("Start_Ans").title = 'Έγινε έραρξη Απαντήσεων';
					document.getElementById("Answers").disabled = false;
					document.getElementById("End_Ans").disabled = false;
					
		  }
		  xhttp.open("GET", "Start_Lesson_Ans.jsp?Lesson_Id="+timh);
		  xhttp.send();
		}

		function End_Lesson_Ans(p_lesson) {
		document.getElementById("Answers").disabled = true;
		var timh = p_lesson;
		
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			     //   document.getElementById("End_Ans").innerHTML = this.responseText;
					document.getElementById("End_Ans").disabled = true;
					document.getElementById("End_Ans").enabled = false;
					document.getElementById("End_Ans").title = 'Έγινε Λήξη Απαντήσεων';
					
					document.getElementById("Start_Ans").enabled = true;
					document.getElementById("Start_Ans").disabled = false;
		  }
		  xhttp.open("GET", "End_Lesson_Ans.jsp?Lesson_Id="+timh);
		  xhttp.send();
		}
</script>

<html>
<head>
	<link rel="stylesheet" href="css/css_multi.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<title></title>

<script src="https://cdn.plot.ly/plotly-latest.min.js">  </script>
<!--script src="./js_plotly/plotly-latest.min.js">  </script -->
	
<%@ include file="lock.jsp" %>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"   onLoad="Make_pie(<%=rsetMulti.getObject("Plot_X_Aa")%>,<%=rsetMulti.getObject("Plot_Y_Aa")%>,'myplot1',  'ΜέχριΤώρα Απαντήσες των μαθητών <br>( (<%=rsetMulti.getObject("Courses_IdD")%>/<%=rsetMulti.getObject("Lesson_Descr")%> Από: <%=rsetMulti.getObject("Fr_Lesson_DateD")%> Εως: <%=rsetMulti.getObject("To_Lesson_DateD")%>)');Make_pie(<%=rsetMulti.getObject("Plot_X_La")%>,<%=rsetMulti.getObject("Plot_Y_La")%>,'myplot2', 'Τελευταία Απάντηση Μαθητών <br>(<%=rsetMulti.getObject("Courses_IdD")%>/<%=rsetMulti.getObject("Lesson_Descr")%> Από: <%=rsetMulti.getObject("Fr_Lesson_DateD")%> Εως: <%=rsetMulti.getObject("To_Lesson_DateD")%>)');Make_pie(<%=rsetMulti.getObject("Plot_X_Ax")%>,<%=rsetMulti.getObject("Plot_Y_Ax")%>,'myplot3',' Αξιολόγηση  (<%=rsetMulti.getObject("Courses_IdD")%>/<%=rsetMulti.getObject("Lesson_Descr")%> Από: <%=rsetMulti.getObject("Fr_Lesson_DateD")%> Εως: <%=rsetMulti.getObject("To_Lesson_DateD")%>)');Make_markers(<%=rsetMulti.getObject("Plot_X_T")%>,<%=rsetMulti.getObject("Plot_Y_T")%>,'myplot','Κατά την Διάρκεια του Μαθήματος <br>(<%=rsetMulti.getObject("Courses_IdD")%>/<%=rsetMulti.getObject("Lesson_Descr")%> Από: <%=rsetMulti.getObject("Fr_Lesson_DateD")%> Εως: <%=rsetMulti.getObject("To_Lesson_DateD")%>)');">

 <%
 String S=""+rsetMulti.getObject("S");
 String E=""+rsetMulti.getObject("E");
 String ANS=""+rsetMulti.getObject("ANS");
 //out.write("S="+S+" " + "Ε=" + E +" " + "ANS=" + ANS );
%>
<div class="btn1"   >
<script type="text/javascript">
		//configure refresh interval (in seconds)
		//var countDownInterval=30;
		var countDownInterval=1000;
		//configure width of displayed text, in px (applicable only in NS4)
		var c_reloadwidth=200;
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
 

	  <a  title="Εναρξη Μαθήματος" ><input type="image" id="Start" name="Start"   width="50px"   height="50px"  src="images/start.jpg" <%=((S.equals("0"))?"disabled=disabled style=color:red TITLE='Εγινε Εναρξη Μαθήματος '":" title='Εναρξη Μαθήματος' style='color:#FF0000'") %>  onClick="  if (confirm('Εναρξη Μαθήματος;') == true) {Start_Lesson(<%=rsetMulti.getObject("Lesson_Id")%>);}" > </a>
	  <a   title="Έναρξη Απαντήσεων" >
	  <input type="image" id="Start_Ans" name="Start_Ans"   width="50px"   height="50px"  src="images/Answers_Start.png"   <%=(((E.equals("0"))|| (S.equals("1"))||(ANS.equals("01")) ||(E.equals("0"))  )?"disabled=disabled style=color:red TITLE='Εγινε Έναρξη Απαντήσεων '":" title='Έναρξη Απαντήσεων' style='color:#FF0000'") %> onClick="if (confirm('Έναρξη Απαντήσεων;') == true) {Start_Lesson_Ans(<%=rsetMulti.getObject("Lesson_Id")%>);}" >
	  </a>
  <a   ><input type="image" id="Answers" name="Answers"   width="50px"   height="50px"  src="images/Create_Answers.png" <%=(( (E.equals("0"))||(S.equals("1"))||(ANS.equals("00")) ||(ANS.equals("11")) )?"disabled=disabled style=color:red TITLE='Δεν Εγινε Έναρξη Απαντήσεων '":" title='Δημιουργία Απαντήσεων' style='color:#FF0000'") %> title='Δημιουργία Απαντήσεων' onClick="if (confirm('Δημιουργία Απαντήσεων;') == true) {Answers(<%=rsetMulti.getObject("Lesson_Id")%>);}" >
</a><a  title="Λήξη Απαντήσεων">
<input type="image" id="End_Ans" name="End_Ans"       width="50px"  height="50px"   src="images/Answers_Stop.png"   <%=(( (S.equals("1"))||(ANS.equals("00")) ||(ANS.equals("11")) )?"disabled=disabled style=color:red TITLE='Δεν Εγινε Έναρξη Απαντήσεων '":" title='Λήξη Απαντήσεων' style='color:#FF0000'") %>   onClick="if (confirm('Λήξη Απαντήσεων;') == true) {End_Lesson_Ans(<%=rsetMulti.getObject("Lesson_Id")%>);}" >
</a><a  title="Λήξη Μαθήματος">   
<input type="image" id="End" name="End"       width="50px"  height="50px"   src="images/stop.jpg"  <%=(( (S.equals("1"))||(E.equals("0"))||(ANS.equals("01"))  )?"disabled=disabled style=color:red TITLE='Εγινε Λήξη Μαθήματος '":" title='Λήξη Μαθήματος' style='color:#FF0000'") %>   onClick="if (confirm('Λήξη Μαθήματος;') == true) {End_Lesson(<%=rsetMulti.getObject("Lesson_Id")%>);}" > </a>
</div>
<% if (rsetMulti_hasData)
{ %>
<p>
  <% 
%>
</p>


<table class="records" width="80%" border="0" align="center">

<%
 int i=0; %>
<form name="frm870" method="post" action="" onSubmit="">


<div id="myplot" style="width:100%;max-width:700px"    title="Πάτησε ένα κλικ του ποντικού για να κλεισει το παραθηρο"  onClick="clearBox('myplot')">
    </div>	
<div id="myplot1" style="width:100%;max-width:700px"    title="Πάτησε ένα κλικ του ποντικού για να κλεισει το παραθηρο"  onClick="clearBox('myplot1')">
    </div>	
<div id="myplot2" style="width:100%;max-width:700px"    title="Πάτησε ένα κλικ του ποντικού για να κλεισει το παραθηρο"  onClick="clearBox('myplot2')">
    </div>	
<div id="myplot3" style="width:100%;max-width:700px"    title="Πάτησε ένα κλικ του ποντικού για να κλεισει το παραθηρο"  onClick="clearBox('myplot3')">
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
		function Make_pie(f_xArray,f_yArray,tm,f_title) {
		
         //   alert(f_title);
			//const layout = {title:f_title};

        const layout = {title: f_title, font: { family: 'Arial, bold',size:10,color: 'black'}};

			const data = [{labels:f_xArray, values:f_yArray, type:"pie"}];

			Plotly.newPlot(tm, data, layout);
	
	        } 
		function clearBox(elementID) {
             document.getElementById(elementID).innerHTML = "";
            }
			
	</script>
	
	<script>
	   function Make_bar(f_xArray,f_yArray,tm,f_title) {
		//const xArray = ["Italy", "France", "Spain", "USA", "Argentina"];
		//const yArray = [55, 49, 44, 24, 15];

		const data = [{
  		x:f_xArray,
  		y:f_yArray,
  		type:"bar",
  		orientation:"v",
 		 marker: {color:"rgba(0,0,255,0.6)"}
		}];

		const layout = {title:f_title};

		Plotly.newPlot(tm, data, layout);
		}
</script>

    <script>
 function Make_markers(f_xArray,f_yArray,tm,f_title) {
	
	const layout = {title:f_title ,font: { family: 'Arial, bold',size:9,color: 'black'}};
	const data = [

  {

    x: f_xArray,

    y: f_yArray,

    type: 'scatter'

  }

];


Plotly.newPlot(tm, data,layout);
	

		
}
</script>
	
	
	
</BODY>
</HTML>
