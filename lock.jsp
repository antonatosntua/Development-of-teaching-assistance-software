<!-- script type="text/javascript" src="js/disableRC.js"></script -->
<%

//if(session.getAttribute("nasMitroo")==null)

if(session.getAttribute("MHTRWO")==null)
{
	//response.sendRedirect("notUser.jsp");
}

%>

<%
request.getSession(true).getAttribute("MHTRWO");
request.getSession(true).getAttribute("YPHR");
request.getSession(true).getAttribute("EPWNYMO");
request.getSession(true).getAttribute("GLOBAL_CODE");
request.getSession(true).getAttribute("YPOTH");
request.getSession(true).getAttribute("ATOMO");
request.getSession(true).getAttribute("prv");
request.getSession(true).getAttribute("curr");
%>
