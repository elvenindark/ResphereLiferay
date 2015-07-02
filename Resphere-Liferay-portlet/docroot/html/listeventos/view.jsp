<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>

<liferay-ui:search-container emptyResultsMessage="No existen eventos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Ubicacion> tempResults = (List<Ubicacion>)request.getAttribute("itemlist"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Ubicacion" keyProperty="idubicacion" modelVar="ubicacion">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(ubicacion.getIdevento())%>'/>
	        </portlet:actionURL>
			<liferay-ui:search-container-column-text name="latitud" property="latitud" href="<%= leaveApplicationURL.toString()%>" />
			<liferay-ui:search-container-column-text name="longitud" property="longitud" />
			<liferay-ui:search-container-column-text name="identificador" property="idubicacion" />
			<!--<liferay-ui:search-container-column-jsp path="/html/listeventos/actions.jsp" align="right" />-->
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<!-- href="<%/*= leaveApplicationURL.toString()*/%>"  -->
<!-- Usuario : <b> ${userName}</b>
<portlet:actionURL name="addName" var="addNameUrl"></portlet:actionURL>
<br>
<form action="${addNameUrl}" method="post">  
	<input name="<portlet:namespace/>userName" type="text" /><br>  
	<input type="submit" />  
</form> -->  



