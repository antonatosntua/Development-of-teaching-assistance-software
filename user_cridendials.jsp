<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*" errorPage="" %>
<%@ include file="Connections/edtpr.jsp" %>
<%@ page import="java.util.*" %>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
	<title></title>
	<link rel="stylesheet" href="css/main.css" type="text/css">
<%

    String Id_Xrhsths =  new String(request.getParameter("Id_Xrhsths").getBytes("ISO8859_1"),"ISO8859_7");

    String Password =  new String(request.getParameter("Password").getBytes("ISO8859_1"),"ISO8859_7");

    

    String id=" " +" and a.Id_Xrhsths='"+Id_Xrhsths+"' "+" and a.Password='"+Password+"' "+" ";
   
 
Connection ConnRecordset1 = null;
PreparedStatement StatementRecordset1 = null;
ResultSet Recordset1 = null;
try {
Driver DriverRecordset1 = (Driver)Class.forName(MM_DRIVER).newInstance();
ConnRecordset1 = DriverManager.getConnection(MM_STRING,MM_USERNAME,MM_PASSWORD);
 
StatementRecordset1 = ConnRecordset1.prepareStatement("select '' dsp_obj, a.User_Id, a.USER_NAME User_Name, a.user_Password Password, a.FIRST_NAME ||' '|| a.LAST_NAME  User_First_Last_Name, User_Role , User_Roled   from vw_users a   where 1=1 and a.User_Status = '1'  " +" and a.USER_NAME='"+Id_Xrhsths+"' "+" and a.user_Password='"+Password+"' "+" ");
Recordset1 = StatementRecordset1.executeQuery();
boolean Recordset1_isEmpty = !Recordset1.next();
boolean Recordset1_hasData = !Recordset1_isEmpty;
Object Recordset1_data;
int Recordset1_numRows = 0;
%>

<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="Valflds.js"></SCRIPT>
</head>
<body bgcolor="#F4F4DD"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<%@ include file="lock.jsp"%>
<%
 if (!Recordset1_isEmpty)
{
session.setAttribute("UserId",Recordset1.getObject("User_Id")+"");
session.setAttribute("UserName",Recordset1.getObject("User_Name")+"");
session.setAttribute("UserFirstLastName",Recordset1.getObject("User_First_Last_Name")+"");
session.setAttribute("RoleUser",Recordset1.getObject("User_Role"));
session.setAttribute("RoleName","Εφαρμογη Διαχείρισης Μαθημάτων:"+Recordset1.getObject("User_Roled"));
//session.setAttribute("Where_Role"," and a.ID_SIMBASIS in (select id_simbasis_from_asset  from ALL_SIMBASIS where User_Type = '"+Recordset1.getObject("User_Type")+
// 
//                                                                 "'  and a.XRONOS_ANAGGELIAS_BLABHS between HMNIA_ENARXIS and  HMNIA_LIXIS)"  ); 	
session.setAttribute("whereParam"," and user_id = "+session.getAttribute("UserId"));  
response.sendRedirect("tab_menu.jsp"); 

%>

<div id="D_Top"> </div>
<p align="center"><font color="#CC3333">
<%=(session.getAttribute("mess_tr_result")!=null?session.getAttribute("mess_tr_result"):"")%>
<%=(session.getAttribute("query_result")!=null?session.getAttribute("query_result"):"")%>
</font></p>
<% session.setAttribute("query_result","");%>
<div id="txtHint" style="color:blue;position:relative;cursor:hand;"> </div>
<form name="frm687" method="post" action="">

</form>
</div>
</div>
<div id="fixedbottom">
<%

}
else {response.sendRedirect("notUser.jsp");}
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
