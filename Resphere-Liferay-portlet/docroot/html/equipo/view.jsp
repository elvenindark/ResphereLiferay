<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="10">	
	<liferay-ui:search-container-results>
	<% 	List<Equipov> tempResults = (List<Equipov>)request.getAttribute("itemlisteq"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
	<liferay-ui:search-container-row className="com.resphere.server.model.Equipov" keyProperty="idevento" modelVar="equipo">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(equipo.getIdevento())%>'/>
	        </portlet:actionURL>
	        <liferay-ui:search-container-column-text name="Rol" property="roltecnico" />
			<liferay-ui:search-container-column-text name="Nombre" property="nombre" />
			<liferay-ui:search-container-column-text name="Sexo" property="tipopoblacion" />
			<liferay-ui:search-container-column-text name="Organizacion" property="organizacion" />
			<liferay-ui:search-container-column-text name="Telefono" property="telefono" />
			<liferay-ui:search-container-column-text name="Email" property="email" />
			
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>



