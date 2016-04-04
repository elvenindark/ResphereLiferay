<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>

<aui:fieldset label="Eventos registrados">		
</aui:fieldset>

<liferay-ui:search-container emptyResultsMessage="No existen eventos" delta="10">	
	<liferay-ui:search-container-results>
	<% 	List<Eventov> tempResults = (List<Eventov>)request.getAttribute("itemlist"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Eventov" keyProperty="idevento" modelVar="evento">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(evento.getIdevento())%>'/>
	        </portlet:actionURL>
	        <liferay-ui:search-container-column-text name="Evento" property="evento" href="<%= leaveApplicationURL.toString()%>"/>
			<liferay-ui:search-container-column-text name="Parroquia" property="parroquia" href="<%= leaveApplicationURL.toString()%>"/>
			<liferay-ui:search-container-column-text name="Canton" property="canton" href="<%= leaveApplicationURL.toString()%>" />
			<liferay-ui:search-container-column-text name="Provincia" property="provincia" href="<%= leaveApplicationURL.toString()%>"/>						
			<liferay-ui:search-container-column-text name="Latitud" property="latitud" />
			<liferay-ui:search-container-column-text name="Longitud" property="longitud" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator paginate="<%=true%>" />	
</liferay-ui:search-container>





