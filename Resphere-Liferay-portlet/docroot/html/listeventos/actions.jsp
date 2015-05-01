<%@include file="/html/listeventos/init.jsp" %>

<% 	ResultRow row = (ResultRow) request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);
	Ubicacion ubicacion = (Ubicacion) row.getObject();
	long groupId = themeDisplay.getLayout().getGroupId();
	String name = Ubicacion.class.getName();
	String primKey = ubicacion.getIdubicacion();
%>
<!-- se le han quitado los permissionChecker -->
<liferay-ui:icon-menu>

		<portlet:actionURL name="editEvento" var="editURL">
			<portlet:param name="resourcePrimKey" value="<%= primKey %>" />
		</portlet:actionURL>
		<liferay-ui:icon image="edit" message="Edit" url=" <%= editURL.toString() %>" />
	
		<portlet:actionURL name="deleteEvento" var="deleteURL">
			<portlet:param name="resourcePrimKey" value="<%= primKey %>" />
		</portlet:actionURL>
		<liferay-ui:icon-delete url="<%= deleteURL.toString() %>" />
		
	<liferay-security:permissionsURL modelResource="<%= Ubicacion.class.getName() %>"
		modelResourceDescription="<%= ubicacion.getIdubicacion() %>"
		resourcePrimKey="<%= primKey %>"
		var="permissionsURL"/>
	<liferay-ui:icon image="permissions" url="<%= permissionsURL.toString() %>" />
	
</liferay-ui:icon-menu>