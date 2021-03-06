<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Serviciov> tempResults = (List<Serviciov>)request.getAttribute("itemlists"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Serviciov" keyProperty="idevento" modelVar="servicio">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(servicio.getIdevento())%>'/>
	        </portlet:actionURL>			
			<liferay-ui:search-container-column-text name="Servicio" property="tiposervicio" />
			<liferay-ui:search-container-column-text name="Tipo dano" property="tipodano" />			
			<liferay-ui:search-container-column-text name="Aplica" property="siaplica" />
			<liferay-ui:search-container-column-text name="Funciona" property="sifunciona" />
			<liferay-ui:search-container-column-text name="Observacion" property="observacion" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>