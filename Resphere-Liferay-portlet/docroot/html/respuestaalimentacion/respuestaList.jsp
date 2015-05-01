<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<liferay-ui:search-container emptyResultsMessage="No existen eventos" delta="10">
	<liferay-ui:search-container-results>
	<% 	List<Eventosv> tempResults = (List<Eventosv>)request.getAttribute("itemlist"); 
		if(tempResults!=null){
			results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
			total = tempResults.size();
			pageContext.setAttribute("results", results);
			pageContext.setAttribute("total", total);
		}else{
			System.out.println("lista vacia");
		}
	%>
	
	</liferay-ui:search-container-results>	
		<liferay-ui:search-container-row className="com.resphere.server.model.Eventosv" keyProperty="idevento" modelVar="eventov">
			<portlet:actionURL name="showRespuestaAlimentacionDetail" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(eventov.getIdevento())%>'/>
	            <portlet:param name="pageName" value="respuestaAlimentacionDetail-jsp"/>
	        </portlet:actionURL>	        
	        <% PortletPreferences prefs = renderRequest.getPreferences();
				String id = (String)prefs.getValue("id", ""); 
	        	prefs.setValue("id", String.valueOf(eventov.getIdevento()));
	        	prefs.store();%>    		
			<liferay-ui:search-container-column-text name="Evento" property="evento" href="<%=leaveApplicationURL.toString()%>"/>
			<liferay-ui:search-container-column-text name="Latitud" property="latitud" />
			<liferay-ui:search-container-column-text name="Longitud" property="longitud" />
			<liferay-ui:search-container-column-text name="Provincia" property="provincia"/>
			<liferay-ui:search-container-column-text name="Canton" property="canton"/>
			<liferay-ui:search-container-column-text name="Parroquia" property="parroquia"/>	
				
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>

