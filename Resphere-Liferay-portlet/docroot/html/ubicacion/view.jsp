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
		<aui:input name="provincia" label="Provincia" disabled="true" type="textarea" rows="2" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="canton" label="Cantón" disabled="true" type="textarea" rows="2"/>
	</aui:column>
	<aui:column columnWidth="30">
		<aui:input name="parroquia" label="Parroquia" disabled="true" type="textarea" rows="2" />
	</aui:column>
	<aui:column columnWidth="30">
		<aui:input name="sector" label="Sector" disabled="true" type="textarea" rows="2" />
	</aui:column>
</aui:layout>
<aui:layout>	
	<aui:column columnWidth="20">
		<aui:input name="latitud"  label="Latitud" disabled="true" type="text"/>
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="longitud" label="Longitud" disabled="true" type="text" />
	</aui:column>
	<aui:column columnWidth="10">
		<aui:input name="altitud" label="Altitud" disabled="true" type="text" />
	</aui:column>
</aui:layout>



