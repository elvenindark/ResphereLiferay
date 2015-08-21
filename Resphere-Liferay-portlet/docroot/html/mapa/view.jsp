<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%//List<Ubicacion> tempResults = (List<Ubicacion>)request.getAttribute("itemlist"); %>
<%List<Eventosv> tempResults1 = (List<Eventosv>)request.getAttribute("itemliste"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Eventos</title>
<script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>

var map;

function initialize() {
  var mapOptions = {
    zoom: 7,
    center: new google.maps.LatLng(-1.400000, -80.000000)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
   	
  <%-- var html = '<portlet:actionURL name = "eventoDetail" var = "ideventoURL">'+
	'<portlet:param name = "search" value = "<%=tempResults.get(0).getIdevento()%>"></portlet:param>' +
	'</portlet:actionURL>'+
	'<a href="<%=ideventoURL.toString()%>"> Ver info </a>'+
	'<%int j = 0;%>'+'<b>' + 
	' Evento' + '</b> <br/>'; --%>
 /*  var infowindow = new google.maps.InfoWindow({ 
		content: html	    
	  }); */

  <%for(int i = 0; i < tempResults1.size(); i++){
  	  %>	var marker<%=i%> = new google.maps.Marker({
          		position: new google.maps.LatLng(<%=tempResults1.get(i).getLatitud()%>,<%=tempResults1.get(i).getLongitud()%>),
	          	map: map	       
	      	});
  
  	var html = '<portlet:actionURL name = "eventoDetail" var = "ideventoURL">'+
	'<portlet:param name = "search" value = "<%=tempResults1.get(i).getIdevento()%>"></portlet:param>' +
	'</portlet:actionURL>'+
	'<a href="<%=ideventoURL.toString()%>"> ' + '<%=tempResults1.get(i).getParroquia()%>' + ' </a>'+
	'<b>' + '<%=tempResults1.get(i).getEvento()%>' + '</b> <br/>';
	var infowindow = new google.maps.InfoWindow({ 
		content: html,	
		closeBoxMargin: "10px 2px 2px 2px",
        closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
	  });
  	 google.maps.event.addListener(marker<%=i%>, 'click', function() {
  		 
  	    infowindow.open(map,marker<%=i%>);
  	    infowindow.setcontent(html);  	  	
  	  });
	      <%	      
    }%>      
}
google.maps.event.addDomListener(window, 'load', initialize); 
</script>
</head>
<body>
 <div id="map-canvas" style="height:450px; width:750px"></div>
</body>
</html>