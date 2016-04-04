<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="10">	
	<liferay-ui:search-container-results>
	<% 	List<Mediovidav> tempResults = (List<Mediovidav>)request.getAttribute("itemlistm"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Mediovidav" keyProperty="idevento" modelVar="medio">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(medio.getIdevento())%>'/>
	        </portlet:actionURL>			
			<liferay-ui:search-container-column-text name="Medio de vida" property="tipomediovida" />
			<liferay-ui:search-container-column-text name="Tipo dano" property="tipodano" />
			<liferay-ui:search-container-column-text name="Hombres" property="hombres" />
			<liferay-ui:search-container-column-text name="Mujeres" property="mujeres" />
			<liferay-ui:search-container-column-text name="Aplica" property="siaplica" />
			<liferay-ui:search-container-column-text name="Observacion" property="observacion" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>