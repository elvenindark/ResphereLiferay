<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="10">	
	<liferay-ui:search-container-results>
	<% 	List<Poblacionv> tempResults = (List<Poblacionv>)request.getAttribute("itemlistp"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Poblacionv" keyProperty="idevento" modelVar="poblacion">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(poblacion.getIdevento())%>'/>
	        </portlet:actionURL>
			<liferay-ui:search-container-column-text name="Tipo afectacion" property="tipoafectacion" />
			<liferay-ui:search-container-column-text name="Hombres" property="hombres" />
			<liferay-ui:search-container-column-text name="Mujeres" property="mujeres" />
			<liferay-ui:search-container-column-text name="Niños" property="ninos" />
			<liferay-ui:search-container-column-text name="Niñas" property="ninas" />
			<liferay-ui:search-container-column-text name="Hogares" property="hogares" />
			<liferay-ui:search-container-column-text name="Personas" property="personas" />
					
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator paginate="false"/>
</liferay-ui:search-container>