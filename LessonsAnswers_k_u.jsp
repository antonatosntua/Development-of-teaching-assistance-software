<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%@ page import="java.util.*" %>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<%
%>
<%

String query="";
String newParameterStr="";
String stm_U="";
 String newParameterStr_h="";
String globalcode=""+request.getSession(true).getAttribute("GLOBAL_CODE");


    String Id_Les_Ans =  new String(request.getParameter("Id_Les_Ans").getBytes("ISO8859_1"),"ISO8859_7");
if(request.getParameter("flag_k")!=null)
{


  String Lesson_Id=  new String(request.getParameter("Lesson_Id").getBytes("ISO8859_1"),"ISO8859_7");
  String User_Id=  new String(request.getParameter("User_Id").getBytes("ISO8859_1"),"ISO8859_7");
  String Answer_Id=  new String(request.getParameter("Answer_Id").getBytes("ISO8859_1"),"ISO8859_7");
  String Answer_DateD=  new String(request.getParameter("Answer_DateD").getBytes("ISO8859_1"),"ISO8859_7");

Connection Conn_U = null;
PreparedStatement pstm_U = null;
Context initCtx835U = new InitialContext();
Context envCtx835U = (Context) initCtx835U.lookup("java:comp/env");
DataSource ds835U = (DataSource )envCtx835U.lookup("jdbc/edtpr");
Conn_U = ds835U.getConnection();
 
Conn_U.setAutoCommit(false);

stm_U ="update LESSONS_ANSWERS set Lesson_Id='"+Lesson_Id+"',User_Id='"+User_Id+"',Answer_Id='"+Answer_Id+"',Answer_Date=to_date('"+Answer_DateD+"','DD/MM/YYYY')  WHERE 1=1 "+" and Id_Les_Ans="+Id_Les_Ans+" ";
pstm_U = Conn_U.prepareStatement(stm_U);

String apot_n="";
try{
      int testarw = pstm_U.executeUpdate();
	  apot_n="Η Διόρθωση πραγματοποιήθηκε...!";
      Conn_U.commit();
      Conn_U.close();
	  session.setAttribute("GLOBAL_CODE","");
      session.setAttribute("query_result",apot_n);
if( request.getParameter("Id_Les_Ans")!=""){
 Id_Les_Ans = ""+request.getParameter("Id_Les_Ans");

response.sendRedirect("LessonsAnswers_k_p.jsp?Id_Les_Ans="+Id_Les_Ans);}
else {response.sendRedirect("LessonsAnswers_k_m.jsp");}

}
   catch (SQLException eX){
	  System.out.println("(APPL_NO_1="+globalcode+")"+ ")"+ stm_U);
		System.out.println("(APPL_NO_1="+globalcode+")"+ "- ORA_ERROR_MESSAGE= "+eX.getMessage());
		out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+ "(APPL_NO_1 ="+globalcode+") "+ eX.getMessage()+
		          "<div align='center' style='color:#0033FF'>  </div></div>");
	  Conn_U.rollback();
      Conn_U.close();  %>
	  <%
	
	 
	  }
finally {Conn_U.close();}} %>
<%
ResultSet Recordset1 = null;
PreparedStatement StatementRecordset1 = null;
Connection ConnRecordset1 =null;
try{
Context initCtx835Q = new InitialContext();
Context envCtx835Q = (Context) initCtx835Q.lookup("java:comp/env");
DataSource ds835Q = (DataSource )envCtx835Q.lookup("jdbc/edtpr");
ConnRecordset1 = ds835Q.getConnection();
 
stm_U="select Id_Les_Ans,Lesson_Id,Lesson_IdD,User_Id,User_IdD,Answer_Id,Answer_IdD,Answer_Date,Answer_DateD from EDTOOL.VW_LESSONS_ANSWERS  a where 1=1  and rownum < 2"+  " "+" and Id_Les_Ans="+Id_Les_Ans+" ";
StatementRecordset1 = ConnRecordset1.prepareStatement(stm_U);
Recordset1 = StatementRecordset1.executeQuery();
boolean Recordset1_isEmpty = !Recordset1.next();
boolean Recordset1_hasData = !Recordset1_isEmpty;
Object Recordset1_data;
int Recordset1_numRows = 0;
%>

<%
while (Recordset1_hasData) {
%>
              <%
  Recordset1_hasData = Recordset1.next();
}
Recordset1.close();
Recordset1 = StatementRecordset1.executeQuery();
Recordset1_hasData = Recordset1.next();
Recordset1_isEmpty = !Recordset1_hasData;
%>

<%
String stm_RstLst = "";
Connection ConnRstLst = null;
PreparedStatement StatementRstLst = null;
ResultSet RstLst = null;
try{
Context initCtxLst = new InitialContext();
Context envCtxLst = (Context) initCtxLst.lookup("java:comp/env"); 
DataSource dsLst = (DataSource )envCtxLst.lookup("jdbc/edtpr"); 
ConnRstLst = dsLst.getConnection();
ConnRstLst.setAutoCommit(false);
boolean RstLst_isEmpty ;
boolean RstLst_hasData ;
Object RstLst_data;
int Repeat__index = 0;
int Repeat__numRows = -1;
%>


	<title></title>
	<link rel="stylesheet" href="css/main.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="callajax.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="Valflds.js"></SCRIPT>
</head>
<body 
 bgcolor="#F4F4DD"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="lock.jsp"%>
<div id="D_Top"> </div>
<form name="f835" method="post" action="">
<table class="t1"  align="center"> 
<tr>

<td  colspan="4" >
<div class="btn1">
<a title="Καθαρισμός"><input   id="ftb1"   type="image" src="images/clear.png"   onClick="f835.reset(); return false;"></a>
<a title="Διόρθωση"><input   id="ftb2"    type="image" src="images/save.png"   onClick="loop=0;
 if ((Val_null(document.f835.Id_Les_Ans,'Α/Α') == false)||(Val_num(document.f835.Id_Les_Ans,'Α/Α') == false)) 
{document.f835.Id_Les_Ans.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.Lesson_Id,'Μάθημα') == false)||(Val_num(document.f835.Lesson_Id,'Μάθημα') == false)) 
{document.f835.Lesson_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.User_Id,'Στοιχεία Μαθητή') == false)||(Val_num(document.f835.User_Id,'Στοιχεία Μαθητή') == false)) 
{document.f835.User_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.f835.Answer_Id,'Απάντηση') == false)) 
 {document.f835.Answer_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.Answer_Date,'Ημ/νια Απάντησης') == false)||(Val_Dt(document.f835.Answer_Date,'Ημ/νια Απάντησης','DD/MM/YYYY') == false)) 
 {document.f835.Answer_Date.focus();loop=1; return false;} else {chk='';

}}}}}
if(loop==0){  f835.submit();}
" ></a>
</div>
</tr>
 <tr bgcolor="#82A7E3">
           <td    colspan="1"><div id="hdr" >Διόρθωση (Απαντήσεις Μαθημάτων)</div></td>
        </tr><TR><TD>
<table align="center"  style="width:auto"><TR>
<TD><fieldset>
<legend><b></b></legend>
<table>
<tr>
<th style="color:#0033FF">Α/Α: *</th>
<td ><input name="Id_Les_Ans" id="Id_Les_Ans"
type="text" size="22" maxlength="22" 
value="<%=((Recordset1.getObject("Id_Les_Ans")!=null)?Recordset1.getObject("Id_Les_Ans"):"")%>"

 readonly 
                 onKeyPress="return (event.keyCode == 13?false:true);"
                 TITLE="ΔΩΣΕ Id_Les_Ans:"
 class="nm" 
                 onBlur="  if ((Val_num(this,'Α/Α') == false))  {this.focus();} else {chk='';}"
>
</td>
</tr>
<tr>
<th style="color:#0033FF">Μάθημα: *</th>
<td >        <% stm_RstLst="select  lesson_id, lesson_descr ||' '||chapter_idd     dsp_perig from vw_lessons  where 1=1 order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="Lesson_Id" size="1" 
                 TITLE="ΔΩΣΕ Lesson_Id:"
>
            <option   value="">         </option>
            <%  String vlLesson_Id;
		        String vlCLesson_Id;
			    String vlLLesson_Id;%>
            <% while ((RstLst_hasData)&&(Repeat__numRows-- != 0)) { %>
 
            <%   vlLesson_Id =""+Recordset1.getObject("Lesson_Id");
		        vlCLesson_Id =""+RstLst.getObject("LESSON_ID");
			    vlLLesson_Id =""+RstLst.getObject("DSP_PERIG");%>
		         <%=((vlLesson_Id.equals(vlCLesson_Id))?"<option  selected value="+'"'+vlCLesson_Id+'"'+"</option>" + vlLLesson_Id:
                "<option   value="+'"'+vlCLesson_Id+'"'+"</option>" + vlLLesson_Id)%>
 
            <%  Repeat__index++; RstLst_hasData = RstLst.next();}%>
        </select> 
</td>
</tr>
<tr>
<th style="color:#0033FF">Στοιχεία Μαθητή: *</th>
<td >        <% stm_RstLst="select user_id, '('||user_name||') '|| first_name||' '|| last_name   dsp_perig from vw_users where 1 = 1 order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="User_Id" size="1" 
                 TITLE="ΔΩΣΕ User_Id:"
>
            <option   value="">         </option>
            <%  String vlUser_Id;
		        String vlCUser_Id;
			    String vlLUser_Id;%>
            <% while ((RstLst_hasData)&&(Repeat__numRows-- != 0)) { %>
 
            <%   vlUser_Id =""+Recordset1.getObject("User_Id");
		        vlCUser_Id =""+RstLst.getObject("USER_ID");
			    vlLUser_Id =""+RstLst.getObject("DSP_PERIG");%>
		         <%=((vlUser_Id.equals(vlCUser_Id))?"<option  selected value="+'"'+vlCUser_Id+'"'+"</option>" + vlLUser_Id:
                "<option   value="+'"'+vlCUser_Id+'"'+"</option>" + vlLUser_Id)%>
 
            <%  Repeat__index++; RstLst_hasData = RstLst.next();}%>
        </select> 
</td>
</tr>
<tr>
<th>Απάντηση:</th>
<td >        <% stm_RstLst="select id, descr_answer  dsp_perig from answers where 1 = 1 order by DSP_PERIG ";
         StatementRstLst = ConnRstLst.prepareStatement(stm_RstLst);
         RstLst = StatementRstLst.executeQuery();
         RstLst_isEmpty = !RstLst.next();
         RstLst_hasData = !RstLst_isEmpty;
         Repeat__index = 0;
         Repeat__numRows = -1;
        %>
        <select name="Answer_Id" size="1" 
                 TITLE="ΔΩΣΕ Answer_Id:"
>
            <option   value="">         </option>
            <%  String vlAnswer_Id;
		        String vlCAnswer_Id;
			    String vlLAnswer_Id;%>
            <% while ((RstLst_hasData)&&(Repeat__numRows-- != 0)) { %>
 
            <%   vlAnswer_Id =""+Recordset1.getObject("Answer_Id");
		        vlCAnswer_Id =""+RstLst.getObject("ID");
			    vlLAnswer_Id =""+RstLst.getObject("DSP_PERIG");%>
		         <%=((vlAnswer_Id.equals(vlCAnswer_Id))?"<option  selected value="+'"'+vlCAnswer_Id+'"'+"</option>" + vlLAnswer_Id:
                "<option   value="+'"'+vlCAnswer_Id+'"'+"</option>" + vlLAnswer_Id)%>
 
            <%  Repeat__index++; RstLst_hasData = RstLst.next();}%>
        </select> 
</td>
</tr>
<tr>
<th style="color:#0033FF">Ημ/νια Απάντησης: *</th>
<td >                   <INPUT TYPE="text" class="Dt" NAME="Answer_DateD" value="<%=((Recordset1.getObject("Answer_DateD")!=null)?Recordset1.getObject("Answer_DateD"):"")%>"
SIZE=16
onBlur=" if ((Val_Dt(this,'Ημ/νια Απάντησης','DD/MM/YYYY') == false))  {this.focus();}">
</td>
</tr>
</table></fieldset></TD>
</TR></table><tr>

<td  colspan="4" >
<div class="btn1">
<a title="Καθαρισμός" ><input   id="ftb1"   type="image" src="images/clear.png"  onClick="f835.reset(); return false;"></a>
<a  title="Διόρθωση" ><input   id="ftb2"    type="image" src="images/save.png" onClick="loop=0;
 if ((Val_null(document.f835.Id_Les_Ans,'Α/Α') == false)||(Val_num(document.f835.Id_Les_Ans,'Α/Α') == false)) 
{document.f835.Id_Les_Ans.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.Lesson_Id,'Μάθημα') == false)||(Val_num(document.f835.Lesson_Id,'Μάθημα') == false)) 
{document.f835.Lesson_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.User_Id,'Στοιχεία Μαθητή') == false)||(Val_num(document.f835.User_Id,'Στοιχεία Μαθητή') == false)) 
{document.f835.User_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_num(document.f835.Answer_Id,'Απάντηση') == false)) 
 {document.f835.Answer_Id.focus();loop=1; return false;} else {chk='';
 if ((Val_null(document.f835.Answer_Date,'Ημ/νια Απάντησης') == false)||(Val_Dt(document.f835.Answer_Date,'Ημ/νια Απάντησης','DD/MM/YYYY') == false)) 
 {document.f835.Answer_Date.focus();loop=1; return false;} else {chk='';

}}}}}
if(loop==0){  f835.submit();}
" ></a>
</div>
<div align="left" style="color:#0033FF">(*) Υποχρεωτική η συμπλήρωση των πεδίων
     <input type="hidden" name="flag_k" value="1">
</div>
</tr>
</table >
<%
 }
catch(SQLException eLst) { 
System.out.println("(APPL_NO_4="+")"+ ")"+ stm_RstLst);
						            System.out.println("(APPL_NO_eLst="+")"+
		 				                  "- ORA_ERROR_MESSAGE= "+eLst.getMessage());
												out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+
		 												  "(APPL_NO_eLst ="+") "+ eLst.getMessage()+
		          						  				  "<div align='center' style='color:#0033FF'> ΕΠΙΚΟΙΝΩΝΕΙΣΤΕ ΜΕ ΤΗΝ "+
				                            			  " Δ/ΣΗ ΠΛΗΡΟΦΟΡΙΚΗΣ τηλ. 1099400-1043204 </div></div>"); %>
					   <%//@ include file="footer_catch.jsp"%>
					   <%
				
					   }
finally {ConnRstLst.close();
}
%>

<%
 }
catch(SQLException e) { 
                       System.out.println("(APPL_NO_4="+")"+ ")"+ stm_U);
						            System.out.println("(APPL_NO_4="+")"+
		 				                  "- ORA_ERROR_MESSAGE= "+e.getMessage());
												out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+
		 												  "(APPL_NO_4 ="+") "+ e.getMessage()+
		          						  				  "<div align='center' style='color:#0033FF'>  "+
				                            			  " </div></div>"); 
		
					   }
finally {ConnRecordset1.close();
}
%>
</form>
</div>
</div>
<div >
</div>
</body>
 <link rel="stylesheet" type="text/css" href="js/jquery/Dates_js/jquery.datetimepicker.css"/> 
 <script src="js/jquery/Dates_js/jquery.js"></script>
      <script src="js/jquery/Dates_js/jquery.datetimepicker.js"></script>
      <script src="js/jquery/Dates_js/Dates.js"></script>


</html>
