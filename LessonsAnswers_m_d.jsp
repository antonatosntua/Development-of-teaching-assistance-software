<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%@ page import="java.util.*" %>

<html>
<%@ include file="LessonsAnswers_m_del.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<script language="JavaScript">

function conf() {
//return (window.confirm('�� ���������� �� ��������;'))
//form.submit();
if(!window.confirm('�� ���������� �� ��������;')){
history.go(-1);
}
else {
frm835.submit();
}
  }
</script>
<head>
<link href="css/main.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
</head>
<body >
<form name="f835" method="post" action="">
<input type="hidden" name="flag_d" value="D">
<table  class="t1"  align="center"> 
 <tr bgcolor="#82A7E3">
          <td    colspan="1">
<div class="btn1">
<a title="�������� ��������"><input type="image"  id="remove" src="images/remove.png"  onClick="conf()" ></a>
</div>
<div id="hdr">�������� ��������� (���������� ���������)</div></td>
        </tr><TR><TD>
<table align="center"  style="width:auto"><TR>

<TD><fieldset>
<legend><b></b></legend>
<table>
<tr>
<th >�/�:</th>
<td >	<input  class="nm"  readonly="readonly" name="Id_Les_Ans" id="Id_Les_Ans" type="text" size="22" maxlength="22"
VALUE="<%=((Recordset1.getObject("Id_Les_Ans")!=null)?Recordset1.getObject("Id_Les_Ans"):"")%>"><input name ="Id_Les_Ans" type="hidden" value="<%=((Recordset1.getObject("Id_Les_Ans")!=null)?Recordset1.getObject("Id_Les_Ans"):"")%>"  >
</td>
</tr>
<tr>
<th >������:</th>
<td ><input readonly="readonly" style="width:350px;heigth:22px" name ="Lesson_IdD"  value="<%=((Recordset1.getObject("Lesson_IdD")!=null)?Recordset1.getObject("Lesson_IdD"):"")%>"  >

</td>
</tr>
<tr>
<th >�������� ������:</th>
<td ><input readonly="readonly" style="width:350px;heigth:22px" name ="User_IdD"  value="<%=((Recordset1.getObject("User_IdD")!=null)?Recordset1.getObject("User_IdD"):"")%>"  >

</td>
</tr>
<tr>
<th >��������:</th>
<td ><input readonly="readonly" style="width:350px;heigth:22px" name ="Answer_IdD"  value="<%=((Recordset1.getObject("Answer_IdD")!=null)?Recordset1.getObject("Answer_IdD"):"")%>"  >

</td>
</tr>
<tr>
<th >��/��� ���������:</th>
<td >	<input  readonly="readonly" name="Answer_DateD" id="Answer_DateD" type="text" size="16" maxlength="16"
VALUE="<%=((Recordset1.getObject("Answer_DateD")!=null)?Recordset1.getObject("Answer_DateD"):"")%>"></td>
</tr>
</table></fieldset></TD>
</TR></table>

<tr>

<td colspan="4" bgcolor="#82A7E3">
<div align="center"><span class="style6">
</span></div>
</td>
</tr>
</table >

</form>
</div>
</div>
<div >
<%
 }
catch(SQLException e) { 
                       String eR = e.toString();
                       out.println("<div align='center' style='color:#FF0000'>�������� ��������� :"+eR +"<p > </div>");%>
					   <%
			
					   }
finally {ConnRecordset1.close();
}
%>
</div>
</body>

<%}
%>
</html>

