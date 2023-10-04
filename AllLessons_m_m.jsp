<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%
 
String reportName ="";

String chk;
String query = ""+session.getAttribute("query");
if (request.getParameter("query") != null)
{
query = ""+request.getParameter("query");
} 
query=query.replace("null","");

String que ="select a.Rn,a.User_Id,a.User_IdD,a.User_Role,a.User_RoleD,a.User_Status,a.User_StatusD,a.Genter_Id,a.Genter_IdD,a.Courses_Id,a.Courses_IdD,a.Chapter_Id,a.Chapter_IdD,a.Lesson_Id,a.Lesson_Descr,Fr_Lesson_DateD,To_Lesson_DateD,a.Answer_Id,a.Answer_IdD ,A.Start_Status S, A.End_Status E, f_find_start_end_answers (A.Lesson_Id) ANS from VW_ALL_LESSONS a where 1=1 and a.User_Id= " + session.getAttribute("UserId")+ query;
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
 <%
 String S=""+rsetMulti.getObject("S");
 String E=""+rsetMulti.getObject("E");
 String ANS=""+rsetMulti.getObject("ANS");
 //out.write("S="+S+" " + "Ε=" + E +" " + "ANS=" + ANS );
%>
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
    <th  colspan="14" ><div id="m_h"  >Μαθήματα(Μαθητή)
        <table>
<tr>
<td>
<div  class="btn1">
	   <a title="Επιστροφή"><input type="image" id="back" src="images/back.png"  onClick="history.go(-1);" ></a>
       <a title="Κριτήρια Αναζήτησης"><input type="image" id="find" src="images/find.png"  onClick="frm870.action='AllLessons_m_k.jsp';frm870.submit();" ></a>
	      <a title="Aπαντήσεις Μαθήματος του Μαθητή"><input type="image" id="kk" src="images/view.png"  onClick="frm870.action='LessonsAnswers_m_m.jsp';frm870.submit();" ></a>
	   <a title="Καταχώρηση Νέας Απάντησης Μαθήματος"><input type="image" id="add" src="images/add.png" <%=(( (S.equals("1"))||(ANS.equals("11"))||(ANS.equals("00"))   )?"disabled=disabled style=color:red TITLE='Εγινε Έναρξη Απαντήσεων '":" title='Έναρξη Απαντήσεων' style='color:#FF0000'") %>  onClick="frm870.action='LessonsAnswers_m_p.jsp';frm870.submit();" ></a>
                
        
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
            <th>Ρολος Χρήστη</th>
            <th>Κατάσταση Χρήστη</th>
            <th>Φύλο</th>
            <th>Κύκλος Μαθημάτων</th>
            <th>Κεφάλαια</th>
            <th>Α/Α Μαθήματος</th>
            <th>Μαθήματα</th>
            <th>¨Εναρξη Μαθήματος</th>
            <th >Λήξη Μαθήματος</th>
            <th >Απάντηση Μαθητή</th>
      </tr>
<%
 int i=0; %>
<form name="frm870" method="post" action="" onSubmit="">
<% while ((rsetMulti_hasData)&&(Repeat1__numRows-- != 0)) { %>
<tr  id="record"  title="Πάτησε το αριστερο πλήκτρο του ποντικιού για να επιλέξεις την εγγραφή">
<td>

          <input name="Rn" type="radio"             <%=(i==0) ?"checked=checked" :""%> value="<%=(((rsetMulti_data = rsetMulti.getObject("Lesson_Id"))==null || rsetMulti.wasNull())?"":rsetMulti_data)%>">
		 
		

</td>
 <td> <%=rsetMulti.getRow() %>
	</td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Rn"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("User_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("User_RoleD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("User_StatusD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Genter_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Courses_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Chapter_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Lesson_Id"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Lesson_Descr"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("Fr_Lesson_DateD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
            <td><%=(((rsetMulti_data = rsetMulti.getObject("To_Lesson_DateD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>
			<td><%=(((rsetMulti_data = rsetMulti.getObject("Answer_IdD"))==null || rsetMulti.wasNull())?"&nbsp":rsetMulti_data)%></td>

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
else {out.println("<div   align=\"center\"><font color=\"#CC3333\" size=\"8\" ><br>Δεν υπάρχουν εγγραφές</font><p><div><br>"+
                  "<a href=\"AllLessons_m_k.jsp\">&nbsp;&nbsp;"+
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
