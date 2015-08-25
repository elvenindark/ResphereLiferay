<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Mediovida> tempResults = (List<Mediovida>)request.getAttribute("itemlistm"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Mediovida" keyProperty="idevento" modelVar="medio">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(medio.getIdevento())%>'/>
	        </portlet:actionURL>
			<liferay-ui:search-container-column-text name="Tipo dano" property="idtipodano" />
			<liferay-ui:search-container-column-text name="Medio de vida" property="idtipomediovida" />
			<liferay-ui:search-container-column-text name="Hombres" property="hombres" />
			<liferay-ui:search-container-column-text name="Observacion" property="observacion" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>