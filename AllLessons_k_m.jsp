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

String que ="select a.Rn,a.User_Id,a.User_IdD,a.Courses_IdD,a.Lesson_Id,a.Lesson_Descr,a.Lesson_IdD,Fr_Lesson_DateD,To_Lesson_DateD,a.Tot_Users, HD_STAT_AX HD_STAT,HD_STAT_DATA_AX  HD_STAT_DATA ,a.COLSPAN_CN_AX COLSPAN_CN, plot_x_AX plot_x, plot_y_AX plot_y  from  ALL_LESSONS_STATISTIC_n a where 1=1  and user_id ="+session.getAttribute("UserId")+" "+query;
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
 
<script language="JavaScript">
 
function highlight(which,color){
if (document.all||document.getElementById)
which.style.backgroundColor=color
}


</script>


<html>
<head>
	<link rel="stylesheet" href="css/css_multi.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<title></title>
<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
<script src="https://cdn.plot.ly/plotly-latest.min.js">  </script>

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

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 
</p>
<% if (rsetMulti_hasData)
{ %>
<p>
  <%
%>
</p>

<div id="multi_record"  align="center">
<table class="records" width="80%" border="0" align="center">
<tr>
    <th  colspan="<%=(((rsetMulti_data = rsetMulti.getObject("COLSPAN_CN"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%>" ><div id="m_h"  >Μαθήματα(Καθηγητή)
        <table>
<tr>
<td>
<div  class="btn1">
	   <a title="Επιστροφή"><input type="image" id="back" src="images/back.png"  onClick="history.go(-1);" ></a>
       <a title="Κριτήρια Αναζήτησης"><input type="image" id="find" src="images/find.png"  onClick="frm870.action='AllLessons_k_k.jsp';frm870.submit();" ></a>
	   
		</div>
</td>
</tr>
</table>

</div></th>
  </tr>
        <tr bgcolor="#E9E9E9">
<th>Επιλογές</th>
<th>Α/Α Εγγρ.</th>
            <th>Α/Α</th>
            <th>Στοιχεία Χρήστη</th>
            <th>Α/Α Μαθήματος</th>
            <th>¨Εναρξη Μαθήματος</th>
            <th>Λήξη Μαθήματος</th>
            <th>Σύνολο Μαθητών</th>
              <%=(((rsetMulti_data = rsetMulti.getObject("HD_STAT"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%>
      </tr>
<%
 int i=0; %>
<form name="frm870" method="post" action="" onSubmit="">
<div id="myplot" style="width:100%;max-width:700px"    title="Πάτησε ένα κλικ του ποντικού για να κλεισει το παραθηρο"  onClick="clearBox('myplot')">
	             </div>	
				 
<% while ((rsetMulti_hasData)&&(Repeat1__numRows-- != 0)) { %>
<tr  id="record"  title="Πάτησε το αριστερο πλήκτρο του ποντικιού για να επιλέξεις την εγγραφή">
<td>

          <input name="Rn" type="radio"     <%=(i==0) ?"checked=checked" :""%> value="<%=(((rsetMulti_data = rsetMulti.getObject("Rn"))==null || rsetMulti.wasNull())?"":rsetMulti_data)%>">

</td>
 <td> <%=rsetMulti.getRow() %>
	</td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Rn"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("User_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Lesson_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Fr_Lesson_DateD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("To_Lesson_DateD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Tot_Users"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
                <%=(((rsetMulti_data = rsetMulti.getObject("HD_STAT_DATA"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%>
				<td>
				
				<input  id="b<%=i%>"  type="button"  title="plot" value="plot" onClick="Val_Cur_Date(<%=rsetMulti.getObject("plot_x")%>,<%=rsetMulti.getObject("plot_y")%>,'myplot','<%=rsetMulti.getObject("Courses_IdD")%>/<%=rsetMulti.getObject("Lesson_Descr")%> Από:<%=rsetMulti.getObject("Fr_Lesson_DateD")%> Εως:<%=rsetMulti.getObject("To_Lesson_DateD")%>');" onDblClick="clearBox('myplot')">			 </td>
				
		        	
</TR>

  <%
  i++;
  Repeat1__index++;
  rsetMulti_hasData = rsetMulti.next();
}
%>
<input name="selectedaithma" type="hidden" value="-1">
</form>
</table>

<table border="0" width="50%" align="center">
  <tr>
    <td width="23%" align="center"><% if (MM_offset !=0) { %>
        <a  id="mF" style="color:#66f;cursor:hand;"  onClick="mF.href='<%=new String(MM_moveFirst.getBytes("ISO8859_1"),"ISO8859_7")%>';"><img src="images/First.gif" border=0></a>
        <% }  %>
    </td>
    <td width="31%" align="center"><% if (MM_offset !=0) { %>
        <a id="mP" style="color:#66f;cursor:hand;"  onClick="mP.href='<%=new String(MM_movePrev.getBytes("ISO8859_1"),"ISO8859_7")%>';"><img src="images/Previous.gif" border=0></a>
        <% } %>
    </td>
    <td width="23%" align="center"><% if (!MM_atTotal) { %>
        <a id="mN" style="color:#66f;cursor:hand;"  onClick="mN.href='<%=new String(MM_moveNext.getBytes("ISO8859_1"),"ISO8859_7")%>';"><img src="images/Next.gif" border=0></a>
        <% }  %>
    </td>
    <td width="23%" align="center"><% if (!MM_atTotal) { %>
        <a id ="mL"  style="color:#66f;cursor:hand;"  onClick="mL.href='<%=new String(MM_moveLast.getBytes("ISO8859_1"),"ISO8859_7")%>';"><img src="images/Last.gif" border=0></a>
        <% }  %>
    </td>
  </tr>
<tr>
  <th  colspan="12" ><div align="center" id="m_tot_records" >Βρέθηκαν Συνολικά: <%=rowCount %> εγγραφές </div>  </th>
  </tr>
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
		
           // alert(f_title);
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
