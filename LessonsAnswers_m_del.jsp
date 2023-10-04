<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*" errorPage="" %> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<%@ include file="lock.jsp"%>

<%

String globalcode=""+request.getSession(true).getAttribute("GLOBAL_CODE");

    String Id_Les_Ans =  new String(request.getParameter("Id_Les_Ans").getBytes("ISO8859_1"),"ISO8859_7");

if(request.getParameter("flag_d")!=null)
{
Connection ConnPrepared1 = null;
PreparedStatement Prepared1 = null;
int testarw = 0;
String apot_n="";
try{
Context initCtx835D = new InitialContext();
Context envCtx835D = (Context) initCtx835D.lookup("java:comp/env");
DataSource ds835D = (DataSource )envCtx835D.lookup("jdbc/edtpr");
ConnPrepared1 = ds835D.getConnection();
ConnPrepared1.setAutoCommit(false);


Prepared1 = ConnPrepared1.prepareStatement("DELETE EDTOOL.LESSONS_ANSWERS a  WHERE 1=1 " +" and a.Id_Les_Ans="+Id_Les_Ans+" ");
testarw = Prepared1.executeUpdate();
	apot_n="Η Διαγραφή πραγματοποιήθηκε...!!!";
      ConnPrepared1.commit();
      session.setAttribute("GLOBAL_CODE","");
      ConnPrepared1.close();
      session.setAttribute("query_result",apot_n);
      response.sendRedirect("AllLessons_m_m.jsp");

}
catch (SQLException ex)
{
	  apot_n="Η Διαγραφή ΔΕΝ πραγματοποιήθηκε (Σ Φ Α Λ Μ Α)!!! ORA-"+
	         ex.getErrorCode()+ex.getMessage().substring(ex.getMessage().indexOf(" - ")+1,ex.getMessage().length());
      ConnPrepared1.rollback();
      ConnPrepared1.close();
      session.setAttribute("query_result",apot_n);
      response.sendRedirect("LessonsAnswers_p.jsp?Id_Les_Ans="+Id_Les_Ans);

     }
finally {ConnPrepared1.close();}
}

else{ %>
<%
Connection ConnRecordset1 = null;
PreparedStatement StatementRecordset1 = null;
ResultSet Recordset1 = null;
try {
Context initCtx835DP = new InitialContext();
Context envCtx835DP = (Context) initCtx835DP.lookup("java:comp/env");
DataSource ds835DP = (DataSource )envCtx835DP.lookup("jdbc/edtpr");
ConnRecordset1 = ds835DP.getConnection();
 
StatementRecordset1 = ConnRecordset1.prepareStatement("select Id_Les_Ans,Lesson_Id,Lesson_IdD,User_Id,User_IdD,Answer_Id,Answer_IdD,Answer_Date,Answer_DateD from EDTOOL.VW_LESSONS_ANSWERS  a where 1=1  and rownum < 2 " +" and a.Id_Les_Ans="+Id_Les_Ans+" ");
Recordset1 = StatementRecordset1.executeQuery();
boolean Recordset1_isEmpty = !Recordset1.next();
boolean Recordset1_hasData = !Recordset1_isEmpty;
Object Recordset1_data;
int Recordset1_numRows = 0;
%>


