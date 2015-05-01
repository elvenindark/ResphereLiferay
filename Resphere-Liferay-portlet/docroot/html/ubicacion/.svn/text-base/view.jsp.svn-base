<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<% 
	Ubicacion ubicacion = (Ubicacion)request.getAttribute("ubicacion");
%>
<portlet:defineObjects />

<aui:model-context bean="<%= ubicacion%>" model="<%= Ubicacion.class %>">
	
</aui:model-context>
<aui:layout>
<aui:column columnWidth="20">
		<aui:input name="provincia" type="text" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="canton"  disabled="true" type="text"/>
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="parroquia" type="text" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="sector" type="text" />
	</aui:column>
</aui:layout>
<aui:layout>	
	<aui:column columnWidth="20">
		<aui:input name="latitud"  label="latitud" disabled="true" type="text"/>
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="longitud" type="text" />
	</aui:column>
	<aui:column columnWidth="10">
		<aui:input name="altitud" type="text" />
	</aui:column>
</aui:layout>



