<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Organizacion> tempResults = (List<Organizacion>)request.getAttribute("itemlisto"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Organizacion" keyProperty="idevento" modelVar="organizacion">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(organizacion.getIdevento())%>'/>
	        </portlet:actionURL>		
	        <liferay-ui:search-container-column-text name="Nombre" property="nombre" />
	        <liferay-ui:search-container-column-text name="Sector" property="sector" />
	        <liferay-ui:search-container-column-text name="Contacto" property="contacto" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Accion> tempResults = (List<Accion>)request.getAttribute("itemlistac"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Accion" keyProperty="idevento" modelVar="accion">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(accion.getIdevento())%>'/>
	        </portlet:actionURL>		
	        <liferay-ui:search-container-column-text name="Fecha" property="fecha" />
	        <liferay-ui:search-container-column-text name="Descripcion" property="descripcion" />
	        <liferay-ui:search-container-column-text name="Organizacion" property="organizacion" />
	        <liferay-ui:search-container-column-text name="Hogares" property="hogares" />
	        <liferay-ui:search-container-column-text name="Personas" property="Personas" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>