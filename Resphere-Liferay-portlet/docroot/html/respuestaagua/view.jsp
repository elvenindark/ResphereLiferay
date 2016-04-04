<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>

<aui:fieldset label="Eventos registrados">		
</aui:fieldset>

<liferay-ui:search-container emptyResultsMessage="No existen eventos" delta="10">
	<liferay-ui:search-container-results>
	<% 	List<Eventosv> tempResults = (List<Eventosv>)request.getAttribute("itemlist"); 
		if(tempResults!=null){
			results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
			total = tempResults.size();
			pageContext.setAttribute("results", results);
			pageContext.setAttribute("total", total);
		}else{
			System.out.println("lista vacia sin ningun coment");
		}
	%>
	
	</liferay-ui:search-container-results>	
		<liferay-ui:search-container-row className="com.resphere.server.model.Eventosv" keyProperty="idevento" modelVar="eventov">
			<portlet:actionURL name="respuestaDetails" var="actionURL">            
	            <portlet:param name="id" value='<%=String.valueOf(eventov.getIdevento())%>'/>
	            <portlet:param name="evento" value='<%=String.valueOf(eventov.getEvento())%>'/>
	            <portlet:param name="lugar" value='<%=String.valueOf(eventov.getParroquia())%>'/>	            
	            <portlet:param name="action" value="edit"/>
	        </portlet:actionURL>	
	         <portlet:renderURL var="editRespuestaAgua">
	        	<portlet:param name="jspPage" value="edit"/>
	        	<portlet:param name="id" value='<%=String.valueOf(eventov.getIdevento())%>'/>
	        </portlet:renderURL> 
	        <% PortletPreferences prefs = renderRequest.getPreferences();
				String id = (String)prefs.getValue("id", ""); 
	        	prefs.setValue("id", String.valueOf(eventov.getIdevento()));
	        	prefs.store();%>    		
			<liferay-ui:search-container-column-text name="Evento" property="evento" href="<%=actionURL.toString() %>"/>
			<liferay-ui:search-container-column-text name="Latitud" property="latitud" />
			<liferay-ui:search-container-column-text name="Longitud" property="longitud" />
			<liferay-ui:search-container-column-text name="Provincia" property="provincia"/>
			<liferay-ui:search-container-column-text name="Canton" property="canton"/>
			<liferay-ui:search-container-column-text name="Parroquia" property="parroquia"/>	
				
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>

