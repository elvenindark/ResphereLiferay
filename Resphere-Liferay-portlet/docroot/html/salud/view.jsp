<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Saludv> tempResults = (List<Saludv>)request.getAttribute("itemlistsa"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Saludv" keyProperty="idevento" modelVar="salud">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(salud.getIdevento())%>'/>
	        </portlet:actionURL>	
	        <liferay-ui:search-container-column-text name="Tipo" property="tiposalud" />
	        <liferay-ui:search-container-column-text name="Funciona" property="sifunciona" />
	        <liferay-ui:search-container-column-text name="Porcentaje" property="porcentaje" />
	        <liferay-ui:search-container-column-text name="Observaciones" property="observaciones" />        		
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>