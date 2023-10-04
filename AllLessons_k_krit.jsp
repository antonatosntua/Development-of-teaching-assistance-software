<%
String query="";
String newParameterStr="";
 String newParameterStr_h="";
 String chkPhwn="";

if(request.getParameter("flag_k")!=null)
{
if(request.getParameter("Rn")!="")
{
 newParameterStr=  new String(request.getParameter("Rn").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Rn = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("User_Id")!="")
{
 newParameterStr=  new String(request.getParameter("User_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  User_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
////\
if(request.getParameter("Gen_Courses_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Gen_Courses_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Gen_Course_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("Gen_Chapter_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Gen_Chapter_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Gen_Chapter_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("Gen_Lesson_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Gen_Lesson_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Gen_Lesson_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }

////  
if(request.getParameter("Courses_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Courses_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Course_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("Chapter_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Chapter_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Chapter_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("Lesson_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Lesson_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Lesson_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
        if(request.getParameter("Fr_Lesson_Date")!="")
  {
   newParameterStr=  new String(request.getParameter("Fr_Lesson_Date").getBytes("ISO8859_1"),"ISO8859_7"); 
   newParameterStr_h=  new String(request.getParameter("Fr_Lesson_Date_h").getBytes("ISO8859_1"),"ISO8859_7"); 
   if(newParameterStr.length() <= 10)
  query += "  and Fr_Lesson_Date >=  to_date( '"+newParameterStr+"','dd/mm/yyyy')";
   if(newParameterStr.length() > 10)
  query += " "+newParameterStr_h ;
  }
        if(request.getParameter("To_Lesson_Date")!="")
  {
   newParameterStr=  new String(request.getParameter("To_Lesson_Date").getBytes("ISO8859_1"),"ISO8859_7"); 
   newParameterStr_h=  new String(request.getParameter("To_Lesson_Date_h").getBytes("ISO8859_1"),"ISO8859_7"); 
   if(newParameterStr.length() <= 10)
  query += "  and To_Lesson_Date <=  to_date( '"+newParameterStr+"','dd/mm/yyyy')";
   if(newParameterStr.length() > 10)
  query += " "+newParameterStr_h ;
  }
if(request.getParameter("Tot_Users")!="")
{
 newParameterStr=  new String(request.getParameter("Tot_Users").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Tot_Users = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
%>
<%
//jasper
//session.setAttribute("whereParam",query);
//session.setAttribute("query",query);
session.setAttribute("whereParam",query);
session.setAttribute("query",query);
if( request.getParameter("Rn")!=""){
String Rn = ""+request.getParameter("Rn");

response.sendRedirect("AllLessons_k_p.jsp?Rn="+Rn);}
else {response.sendRedirect("AllLessons_k_m.jsp");}
}
%>
