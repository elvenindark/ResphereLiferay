<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>


<liferay-ui:search-container emptyResultsMessage="No existen eventos monitoreados para este ámbito" delta="10">
	<liferay-ui:search-container-results>
	<% 	List<Monitoreorespuesta> tempResults = (List<Monitoreorespuesta>)request.getAttribute("monitoreos"); 
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
		<liferay-ui:search-container-row className="com.resphere.server.model.Monitoreorespuesta" keyProperty="idrespuesta" modelVar="monitoreo">
			<portlet:actionURL name="monitoreoDetails" var="actionURL">            
	            <portlet:param name="id" value='<%=String.valueOf(monitoreo.getIdrespuesta())%>'/>
	            <portlet:param name="action" value="edit"/>
	        </portlet:actionURL>	
	         <portlet:renderURL var="editMonitoreoAlimentacion">
	        	<portlet:param name="jspPage" value="edit"/>
	        	<portlet:param name="id" value='<%=String.valueOf(monitoreo.getIdrespuesta())%>'/>
	        </portlet:renderURL> 
	        <% PortletPreferences prefs = renderRequest.getPreferences();
				String id = (String)prefs.getValue("id", ""); 
	        	prefs.setValue("id", String.valueOf(monitoreo.getIdrespuesta()));
	        	prefs.store();%>    		
			<liferay-ui:search-container-column-text name="Id" property="idrespuesta" href="<%=actionURL.toString() %>"/>
			<liferay-ui:search-container-column-text name="Porcentaje" property="cumple" />
			<liferay-ui:search-container-column-text name="Observacion" property="observacion" />				
				
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>


<a href="monitoreo-agua">volver</a>
