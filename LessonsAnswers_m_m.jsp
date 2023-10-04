<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%
String  Lesson_Id=  new String(request.getParameter("Rn").getBytes("ISO8859_1"),"ISO8859_7");
String reportName ="";
//session.setAttribute("reportName",".jasper"); 
String chk;
//String query = ""+session.getAttribute("query");
//if (request.getParameter("query") != null)
//{
//query = ""+request.getParameter("query");
//} 
// out.write(query);
//query=query.replace("null","");

String que ="select a.Id_Les_Ans,a.Lesson_Id,a.Lesson_IdD,a.User_Id,a.User_IdD,a.Answer_Id,a.Answer_IdD,Answer_DateD from VW_LESSONS_ANSWERS a where 1=1  and a.lesson_id="+ Lesson_Id +" and a.user_id = "+session.getAttribute("UserId")+ " order by Answer_Date desc"; //+" "+query;
 // out.write(que);
Connection ConnrsetMulti =null;
PreparedStatement StatementrsetMulti= null;
ResultSet rsetMulti= null;
Statement stmt = null;
ResultSet resultSet= null;
int rowCount = 0;
try{
Context initCtx835M = new InitialContext();
Context envCtx835M = (Context) initCtx835M.lookup("java:comp/env");
DataSource ds835M = (DataSource )envCtx835M.lookup("jdbc/edtpr");
ConnrsetMulti = ds835M.getConnection();
 
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
    <th  colspan="7" ><div id="m_h"  >Απαντήσεις Μαθημάτων (Μαθητή)
        <table>
<tr>
<td>
<div  class="btn1">
	    <a title="Επιστροφή"><input type="image" id="back" src="images/back.png"  onClick="history.go(-1);" ></a>
        <a title="Κριτήρια Αναζήτησης"><input type="image" id="find" src="images/find.png"  onClick="f835.action='AllLessons_m_k.jsp';f835.submit();" ></a>  
        <a title="Διόρθωση Εγγραφής"><input type="image" id="update"  src="images/update.png"  onClick="f835.action='LessonsAnswers_m_u.jsp';f835.submit();" ></a>
        <a title="Διαγραφή Εγγραφής"><input type="image"  id="remove" src="images/remove.png"  onClick="f835.action='LessonsAnswers_m_d.jsp';f835.submit();" ></a>
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
            <th>Μάθημα</th>
            <th>Στοιχεία Μαθητή</th>
            <th>Απάντηση</th>
            <th >Ημ/νια Απάντησης</th>

      </tr>
<%
 int i=0; %>
<form name="f835" method="post" action="" onSubmit="">
<% while ((rsetMulti_hasData)&&(Repeat1__numRows-- != 0)) { %>
<tr  id="record"  title="Πάτησε το αριστερο πλήκτρο του ποντικιού για να επιλέξεις την εγγραφή">
<td>

          <input name="Id_Les_Ans" type="radio"     <%=(i==0) ?"checked=checked" :""%> value="<%=(((rsetMulti_data = rsetMulti.getObject("Id_Les_Ans"))==null || rsetMulti.wasNull())?"":rsetMulti_data)%>">

</td>
 <td> <%=rsetMulti.getRow() %>
	</td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Id_Les_Ans"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Lesson_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("User_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Answer_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Answer_DateD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>

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
else {out.println("<div   align=\"center\"><font color=\"#CC3333\" size=\"8\" ><br>Δεν υπάρχουν εγγραφές</font><p><div><br><a href=\"LessonsAnswers_m_k.jsp\">&nbsp;&nbsp;"+
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
</BODY>
</HTML>
