<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%@ page import="java.util.*" %>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
	<title></title>
	<link rel="stylesheet" href="css/main.css" type="text/css">
<%

    String Lesson_Id =     new String(request.getParameter("Rn").getBytes("ISO8859_1"),"ISO8859_7");
    String Lesson_Descr =  new String(request.getParameter("Lesson_Descr").getBytes("ISO8859_1"),"ISO8859_7");
	String User_Id =       new String(request.getParameter("User_Id").getBytes("ISO8859_1"),"ISO8859_7");
   
   
   
    String id=" " +" and a.Lesson_Id="+Lesson_Id +" "+  " and a.User_Id= " + User_Id;
    session.setAttribute("Curr_Lesson_id",Lesson_Id);
	session.setAttribute("Curr_Lesson_Descr",Lesson_Descr);
    
 
Connection ConnRecordset1 = null;
PreparedStatement StatementRecordset1 = null;
ResultSet Recordset1 = null;
try {
Context initCtx835P = new InitialContext();
Context envCtx835P = (Context) initCtx835P.lookup("java:comp/env");
DataSource ds835P = (DataSource )envCtx835P.lookup("jdbc/edtpr");
ConnRecordset1 = ds835P.getConnection();
 String que = "select '' dsp_obj, a.Id_Les_Ans,a.Lesson_Id,a.Lesson_IdD,a.User_Id,a.User_IdD,a.Answer_Id,a.Answer_IdD,a.Answer_Date,a.Answer_DateD from EDTOOL.VW_LESSONS_ANSWERS a where 1=1 " +id;
 out.write(Lesson_Descr);
 out.write(que);
StatementRecordset1 = ConnRecordset1.prepareStatement(que);
Recordset1 = StatementRecordset1.executeQuery();
boolean Recordset1_isEmpty = !Recordset1.next();
boolean Recordset1_hasData = !Recordset1_isEmpty;
Object Recordset1_data;
int Recordset1_numRows = 0;
%>

<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="Valflds.js"></SCRIPT>
</head>
<body bgcolor="#F4F4DD"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  onLoad="hhhhhh.location.reload()">
<%@ include file="lock.jsp"%>
<%
 if (!Recordset1_isEmpty)
{
session.setAttribute("dsp_ia",Recordset1.getObject("dsp_obj")+"");
%>

<div id="D_Top"> </div>
<p align="center"><font color="#CC3333">
<%=(session.getAttribute("mess_tr_result")!=null?session.getAttribute("mess_tr_result"):"")%>
<%=(session.getAttribute("query_result")!=null?session.getAttribute("query_result"):"")%>
</font></p>
<% session.setAttribute("query_result","");%>
<div id="txtHint" style="color:blue;position:relative;cursor:hand;"> </div>
<form name="f835" method="post" action="">
<table  class="t1"  align="center"> 
<tr><td>
<div  class="btn1">
	   <a title="Επιστροφή"><input type="image" id="back" src="images/back.png"  onClick="history.go(-1);" ></a>
      
        <a title="Διόρθωση Εγγραφής"><input  type="image" id="update"  src="images/update.png"  onClick="f835.action='LessonsAnswers_k_u.jsp';f835.submit();" ></a>
        <a title="Διαγραφή Εγγραφής"><input   type="image" id="remove" src="images/remove.png"  onClick="f835.action='LessonsAnswers_k_d.jsp';f835.submit();" ></a>
		</div>
</td></tr>
 <tr bgcolor="#82A7E3">
           <td    colspan="1"><div id="hdr"  >Προβολή Στοιχείων (Απαντήσεις Μαθημάτων)</div></td>
        </tr><TR><TD>
<table align="center"  style="width:auto"><TR>
<TD><fieldset>
<legend><b></b></legend>
<table>
<tr>
<th style="color:#0033FF">Α/Α: *</th>
<td >	<input  class="nm"  readonly="readonly" name="Id_Les_Ans" id="Id_Les_Ans" type="text" size="22" maxlength="22"
VALUE="<%=((Recordset1.getObject("Id_Les_Ans")!=null)?Recordset1.getObject("Id_Les_Ans"):"")%>"><input name ="Id_Les_Ans" type="hidden" value="<%=((Recordset1.getObject("Id_Les_Ans")!=null)?Recordset1.getObject("Id_Les_Ans"):"")%>"  >
</td>
</tr>
<tr>
<th style="color:#0033FF">Μάθημα: *</th>
<td ><input readonly="readonly" style="width:350px;heigth:22px" name ="Lesson_IdD"  value="<%=((Recordset1.getObject("Lesson_IdD")!=null)?Recordset1.getObject("Lesson_IdD"):"")%>"  >

</td>
</tr>
<tr>
<th style="color:#0033FF">Στοιχεία Μαθητή: *</th>
<td ><input readonly="readonly" style="width:350px;heigth:22px" name ="User_IdD"  value="<%=((Recordset1.getObject("User_IdD")!=null)?Recordset1.getObject("User_IdD"):"")%>"  >

</td>
</tr>
<tr>
<th>Απάντηση:</th>
<td ><input readonly="readonly" style="width:350px;heigth:22px" name ="Answer_IdD"  value="<%=((Recordset1.getObject("Answer_IdD")!=null)?Recordset1.getObject("Answer_IdD"):"")%>"  >

</td>
</tr>
<tr>
<th style="color:#0033FF">Ημ/νια Απάντησης: *</th>
<td >	<input  readonly="readonly" name="Answer_DateD" id="Answer_DateD" type="text" size="16" maxlength="16"
VALUE="<%=((Recordset1.getObject("Answer_DateD")!=null)?Recordset1.getObject("Answer_DateD"):"")%>"></td>
</tr>
</table></fieldset></TD>
</TR></table><tr>

<td  colspan="4" >
<div  class="btn1">
	   <a title="Επιστροφή"><input type="image"    id="back" src="images/back.png"  onClick="history.go(-1);" ></a>
       
        <a title="Διόρθωση Εγγραφής"><input type="image" id="update"  src="images/update.png"  onClick="f835.action='LessonsAnswers_k_u.jsp';f835.submit();" ></a>
        <a title="Διαγραφή Εγγραφής"><input type="image"  id="remove" src="images/remove.png"  onClick="f835.action='LessonsAnswers_k_d.jsp';f835.submit();" ></a>
		</div>
</td>
</tr>
</table >
</form>
</div>
</div>
<div id="fixedbottom">
<%

}
else {out.println("<div   align=\"center\"><font color=\"#CC3333\" size=\"8\" ><br>Δεν υπάρχουν εγγραφές</font><p><div><br><a href=\"LessonsAnswers_k_i.jsp\">"+
                  "<img src=\"images/add.png\" name=\"\" width=\"30\" height=\"30\" alt=\" Νέα Εγγραφή \"></a><a href=\"LessonsAnswers_k_k.jsp\">&nbsp;&nbsp;"+
				  "<img src=\"images/find.png\" name=\"\" width=\"30\" height=\"30\" alt=\" Νέα Κκριτήρια \"></a></div></div><br><br><br><br>");}
%>
<%
 }
catch(SQLException e) {
                       String mhnyma_oloklhro = e.toString();
                       out.println("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+e +"</div>");}
finally {ConnRecordset1.close();
}
%>
</div>
</body>

</html>
