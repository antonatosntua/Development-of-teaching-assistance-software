<%

// *** Recordset Stats, Move To Record, and Go To Record: declare stats variables



int rsetMulti_first = 1;

int rsetMulti_last  = 1;

int rsetMulti_total = -1;



if (rsetMulti_isEmpty) {

  rsetMulti_total = rsetMulti_first = rsetMulti_last = 0;

}



//set the number of rows displayed on this page

if (rsetMulti_numRows == 0) {

  rsetMulti_numRows = 1;

}

String MM_paramName = ""; 

// *** Move To Record and Go To Record: declare variables



//System.out.println("456");

ResultSet MM_rs = rsetMulti;

int       MM_rsCount = rsetMulti_total;

int       MM_size = rsetMulti_numRows;

String    MM_uniqueCol = "";

          MM_paramName = "";

int       MM_offset = 0;

boolean   MM_atTotal = false;

boolean   MM_paramIsDefined = (MM_paramName.length() != 0 && request.getParameter(MM_paramName) != null);



// *** Move To Record: handle 'index' or 'offset' parameter



if (!MM_paramIsDefined && MM_rsCount != 0) {



  //use index parameter if defined, otherwise use offset parameter

  String r = request.getParameter("index");

  if (r==null) r = request.getParameter("offset");

  if (r!=null) MM_offset = Integer.parseInt(r);



  // if we have a record count, check if we are past the end of the recordset

  if (MM_rsCount != -1) {

    if (MM_offset >= MM_rsCount || MM_offset == -1) {  // past end or move last

      if (MM_rsCount % MM_size != 0)    // last page not a full repeat region

        MM_offset = MM_rsCount - MM_rsCount % MM_size;

      else

        MM_offset = MM_rsCount - MM_size;

    }

  }

  

//System.out.println("789");

  //move the cursor to the selected record

  int i;

  for (i=0; rsetMulti_hasData && (i < MM_offset || MM_offset == -1); i++) {

    rsetMulti_hasData = MM_rs.next();

  }

  if (!rsetMulti_hasData) MM_offset = i;  // set MM_offset to the last possible record

}



// *** Move To Record: if we dont know the record count, check the display range

if (MM_rsCount == -1) {



  // walk to the end of the display range for this page

  int i;

  for (i=MM_offset; rsetMulti_hasData && (MM_size < 0 || i < MM_offset + MM_size); i++) {

    rsetMulti_hasData = MM_rs.next();

  }

  

//System.out.println("369");

  // if we walked off the end of the recordset, set MM_rsCount and MM_size

  if (!rsetMulti_hasData) {

    MM_rsCount = i;

    if (MM_size < 0 || MM_size > MM_rsCount) MM_size = MM_rsCount;

  }



  // if we walked off the end, set the offset based on page size

  if (!rsetMulti_hasData && !MM_paramIsDefined) {

    if (MM_offset > MM_rsCount - MM_size || MM_offset == -1) { //check if past end or last

      if (MM_rsCount % MM_size != 0)  //last page has less records than MM_size

        MM_offset = MM_rsCount - MM_rsCount % MM_size;

      else

        MM_offset = MM_rsCount - MM_size;

    }

  }



//System.out.println("asd");

  // reset the cursor to the beginning

  rsetMulti.close();

  rsetMulti = StatementrsetMulti.executeQuery();

  rsetMulti_hasData = rsetMulti.next();

  MM_rs = rsetMulti;



  // move the cursor to the selected record

  for (i=0; rsetMulti_hasData && i < MM_offset; i++) {

    rsetMulti_hasData = MM_rs.next();

  }

}



// *** Move To Record: update recordset stats

//System.out.println("rgrg");

// set the first and last displayed record

rsetMulti_first = MM_offset + 1;

rsetMulti_last  = MM_offset + MM_size;

if (MM_rsCount != -1) {

  rsetMulti_first = Math.min(rsetMulti_first, MM_rsCount);

  rsetMulti_last  = Math.min(rsetMulti_last, MM_rsCount);

}



// set the boolean used by hide region to check if we are on the last record

MM_atTotal  = (MM_rsCount != -1 && MM_offset + MM_size >= MM_rsCount);



// *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

//System.out.println("ebebe");

String MM_keepBoth,MM_keepURL="",MM_keepForm="",MM_keepNone="";

String[] MM_removeList = { "index", MM_paramName };



// create the MM_keepURL string

if (request.getQueryString() != null) {

  MM_keepURL = '&' + request.getQueryString();

  for (int i=0; i < MM_removeList.length && MM_removeList[i].length() != 0; i++) {

  int start = MM_keepURL.indexOf(MM_removeList[i]) - 1;

    if (start >= 0 && MM_keepURL.charAt(start) == '&' &&

        MM_keepURL.charAt(start + MM_removeList[i].length() + 1) == '=') {

      int stop = MM_keepURL.indexOf('&', start + 1);

      if (stop == -1) stop = MM_keepURL.length();

      MM_keepURL = MM_keepURL.substring(0,start) + MM_keepURL.substring(stop);

    }

  }

}

//System.out.println("egegeg");

// add the Form variables to the MM_keepForm string

if (request.getParameterNames().hasMoreElements()) {

  java.util.Enumeration items = request.getParameterNames();

  while (items.hasMoreElements()) {

    String nextItem = (String)items.nextElement();

    boolean found = false;

    for (int i=0; !found && i < MM_removeList.length; i++) {

      if (MM_removeList[i].equals(nextItem)) found = true;

    }

    if (!found && MM_keepURL.indexOf('&' + nextItem + '=') == -1) {

      MM_keepForm = MM_keepForm + '&' + nextItem + '=' + java.net.URLEncoder.encode(request.getParameter(nextItem));

    }

  }

}

//System.out.println("4t4t4t4t4t");

String tempStr = "";

for (int i=0; i < MM_keepURL.length(); i++) {

  if (MM_keepURL.charAt(i) == '<') tempStr = tempStr + "&lt;";

  else if (MM_keepURL.charAt(i) == '>') tempStr = tempStr + "&gt;";

  else if (MM_keepURL.charAt(i) == '"') tempStr = tempStr +  "&quot;";

  else tempStr = tempStr + MM_keepURL.charAt(i);

}

MM_keepURL = tempStr;



tempStr = "";

for (int i=0; i < MM_keepForm.length(); i++) {

  if (MM_keepForm.charAt(i) == '<') tempStr = tempStr + "&lt;";

  else if (MM_keepForm.charAt(i) == '>') tempStr = tempStr + "&gt;";

  else if (MM_keepForm.charAt(i) == '"') tempStr = tempStr +  "&quot;";

  else tempStr = tempStr + MM_keepForm.charAt(i);

}

MM_keepForm = tempStr;

//System.out.println("ololololol");

// create the Form + URL string and remove the intial '&' from each of the strings

MM_keepBoth = MM_keepURL + MM_keepForm;

if (MM_keepBoth.length() > 0) MM_keepBoth = MM_keepBoth.substring(1);

if (MM_keepURL.length() > 0)  MM_keepURL = MM_keepURL.substring(1);

if (MM_keepForm.length() > 0) MM_keepForm = MM_keepForm.substring(1);



// *** Move To Record: set the strings for the first, last, next, and previous links



String MM_moveFirst,MM_moveLast,MM_moveNext,MM_movePrev;

//System.out.println("5gggg6ggggg");

  String MM_keepMove = MM_keepBoth;  // keep both Form and URL parameters for moves

  String MM_moveParam = "index=";



  // if the page has a repeated region, remove 'offset' from the maintained parameters

  if (MM_size > 1) {

    MM_moveParam = "offset=";

    int start = MM_keepMove.indexOf(MM_moveParam);

    if (start != -1 && (start == 0 || MM_keepMove.charAt(start-1) == '&')) {

      int stop = MM_keepMove.indexOf('&', start);

      if (start == 0 && stop != -1) stop++;

      if (stop == -1) stop = MM_keepMove.length();

      if (start > 0) start--;

      MM_keepMove = MM_keepMove.substring(0,start) + MM_keepMove.substring(stop);

    }

  }

//System.out.println("g44444444444");

  // set the strings for the move to links

  //BY KOGIAS

  String url = request.getRequestURI();

  url = url.substring( url.lastIndexOf("/")+1, url.length() );

  StringBuffer urlStr = new StringBuffer( url ).append('?').append(MM_keepMove);

  //END BY KOGIAS

  if (MM_keepMove.length() > 0) urlStr.append('&');

  urlStr.append(MM_moveParam);

  MM_moveFirst = urlStr + "0";

  MM_moveLast  = urlStr + "-1";

  MM_moveNext  = urlStr + Integer.toString(MM_offset+MM_size);

  MM_movePrev  = urlStr + Integer.toString(Math.max(MM_offset-MM_size,0));

//System.out.println("r111111111111111");

%>

