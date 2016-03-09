<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Accesov> tempResults = (List<Accesov>)request.getAttribute("itemlista"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Accesov" keyProperty="idevento" modelVar="acceso">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(acceso.getIdevento())%>'/>
	        </portlet:actionURL>			
			<liferay-ui:search-container-column-text name="Tipo Acceso" property="tipoacceso" />
			<liferay-ui:search-container-column-text name="Transporte" property="transporte" />		
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>