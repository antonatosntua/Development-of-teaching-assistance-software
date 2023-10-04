<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="javax.sql.*, java.sql.*,javax.naming.*,oracle.jdbc.pool.*" errorPage="" %>
<%
String stm_U ="";
String query="";
String newParameterStr="";
String newParameterStr_h="";

if(request.getParameter("flag_i")!=null)
{



    String Id_Les_Ans =  new String(request.getParameter("Id_Les_Ans").getBytes("ISO8859_1"),"ISO8859_7");

  String Lesson_Id=  new String(request.getParameter("Lesson_Id").getBytes("ISO8859_1"),"ISO8859_7");
  String User_Id=  new String(request.getParameter("User_Id").getBytes("ISO8859_1"),"ISO8859_7");
  String Answer_Id=  new String(request.getParameter("Answer_Id").getBytes("ISO8859_1"),"ISO8859_7");
  

String apot_n="";
int sequence = 0;
String stm_I="";
String  seq_tr = ""; 
String  mess_tr = "";
Connection Conn_I = null;
PreparedStatement pstm_I = null;
ResultSet seqRset = null;
try{
    Context initCtx835I = new InitialContext();
    Context envCtx835I = (Context) initCtx835I.lookup("java:comp/env");
    DataSource ds835I = (DataSource )envCtx835I.lookup("jdbc/edtpr");
    Conn_I = ds835I.getConnection();
      
    Conn_I.setAutoCommit(false);
    
    stm_I = "select EDTOOL.fp_SQ_FOR_ALL_IDS Id_Les_Ans from dual";
    pstm_I = Conn_I.prepareStatement(stm_I);
    seqRset =pstm_I.executeQuery();
    seqRset.next();
     
    Id_Les_Ans=""+ seqRset.getObject("Id_Les_Ans");

    stm_I = "INSERT INTO LESSONS_ANSWERS(Id_Les_Ans,Lesson_Id,User_Id,Answer_Id,Answer_Date,PERIOD_ASWER_ID) values ('"+Id_Les_Ans+"','"+Lesson_Id+"','"+User_Id+"','"+Answer_Id+"',sysdate,F_FIND_PERIOD_ASWER_ID ("+Lesson_Id+"))";
    pstm_I = Conn_I.prepareStatement(stm_I);
    try{
        int testarw = pstm_I.executeUpdate();
        Conn_I.commit();
        apot_n="Η Καταχώρηση πραγματοποιήθηκε...!";
        session.setAttribute("seq_tr_result",seq_tr);
        //session.setAttribute("mess_tr_result",mess_tr);
        session.setAttribute("query_result",apot_n);
       response.sendRedirect("LessonsAnswers_m_m_p.jsp?Id_Les_Ans="+Id_Les_Ans);


}
     catch(SQLException e1){
          //System.err.println("error="+e.getErrorCode()+"message="+e.getMessage());
          int err = e1.getErrorCode();
          if (err != 1){
              System.out.println("(APPL_NO_1="+sequence+")"+ ")"+ stm_I);
		           System.out.println("(APPL_NO_1="+sequence+")"+ "- ORA_ERROR_MESSAGE= "+e1.getMessage());
		           out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+ "(APPL_NO_1 ="+sequence+") "+ e1.getMessage()+
		               "<div align='center' style='color:#0033FF'>  </div></div>");}
          else {
	               try {stm_I = "select  Id_Les_Ans  seq , NULL mess  from LESSONS_ANSWERS where 1=1 "+query;
       			        pstm_I = Conn_I.prepareStatement(stm_I);
	   				          seqRset =pstm_I.executeQuery();
  					          seqRset.next();
		 	                seq_tr = ""+ seqRset.getObject("seq");
  					          mess_tr = ""+ seqRset.getObject("mess");
			              	
  					          if(seq_tr!=""){
					               apot_n="Η Εγγραφή Υπήρχε.....!!";
     				           Conn_I.commit();
					               session.setAttribute("seq_tr_result",seq_tr);
	 				               session.setAttribute("mess_tr_result",mess_tr);
     				           session.setAttribute("query_result",apot_n);
                       response.sendRedirect("LessonsAnswers_p.jsp?Id_Les_Ans="+Id_Les_Ans);

}
  					          if(seq_tr==""){
					               System.out.println("(APPL_NO_2 ="+sequence+")"+ ")"+ stm_I);
		                     System.out.println("(APPL_NO_2 ="+sequence+")"+ "ΔΕΝ ΕΦΕΡΕ ΕΓΓΡΑΦΕΣ ΤΟ  SELECT");
		                     out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+ "(APPL_NO_2 ="+sequence+") "+
		                               "<div align='center' style='color:#0033FF'> </div></div>");
     				           apot_n="Η Καταχώρηση ΔΕΝ πραγματοποιήθηκε (Σ Φ Α Λ Μ Α)!!!";
     				           Conn_I.rollback();}}
			           catch(SQLException e3) {System.out.println("(APPL_NO_3 ="+sequence+")"+ ")"+ stm_I);
								   	   System.out.println("(APPL_NO_3 ="+sequence+")"+ "- ORA_ERROR_MESSAGE= "+e3.getMessage());
									     out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+ "(APPL_NO_3 ="+sequence+") "+ e3.getMessage()+
		       						 "<div align='center' style='color:#0033FF'> </div></div>");
		                   Conn_I.rollback();}
                finally {Conn_I.close();}}}
 	  finally {Conn_I.close();}}
catch(SQLException e4) {System.out.println("(APPL_NO_4 ="+sequence+")"+ ")"+ stm_I);
						System.out.println("(APPL_NO_4 ="+sequence+")"+ "- ORA_ERROR_MESSAGE= "+e4.getMessage());
						   out.write("<div align='center' style='color:#FF0000'>ΠΡΟΒΛΗΜΑ ΕΦΑΡΜΟΓΗΣ :"+ "(APPL_NO_4 ="+sequence+") "+ e4.getMessage()+
		       				  	     "<div align='center' style='color:#0033FF'> </div></div>");
						Conn_I.rollback();
											   %>
					   <%//@ include file="footer_catch.jsp"%>
					   <%
				
					   }
finally {Conn_I.close();}
}
 else{

}%>
