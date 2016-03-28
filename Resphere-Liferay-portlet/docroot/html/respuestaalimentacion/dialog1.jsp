<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>

<% 
	Respuestahumanitariav respuesta = (Respuestahumanitariav)request.getAttribute("respuestav");	
%>
<script src="http://code.jquery.com/jquery-latest.js">   
</script>
<portlet:resourceURL var="ajaxCallResourceURL">
</portlet:resourceURL>
<%String redirect = (String)request.getAttribute("backURL");
%>

<portlet:actionURL var="respuestaAgregarURL" windowState="normal" name="agregarRespuesta">
</portlet:actionURL>

<form action="<%= respuestaAgregarURL.toString() %>" method="post" id="fm">
	<aui:model-context bean="<%= respuesta%>" model="<%= Respuestahumanitariav.class %>">
	</aui:model-context>
	
	<div class="formresponse" id="tg">
	<a href="<%=redirect%>">Regresar</a>	
		<aui:fieldset label="Normas Minimas de Atencion Humanitaria">
			<aui:layout>				
				<aui:column columnWidth="50">
					<aui:input label="Sector Humanitario" name="descSectorHumanitario"
						disabled="true" type="textarea" rows="4" cols="250" />
					<aui:input label="Norma minima" name="descNormaminima"
						disabled="true" type="textarea" rows="4" cols="250" />
				</aui:column>
				<aui:column columnWidth="50">
					<aui:input label="Norma esencial" name="descNormaesencial"
						disabled="true" type="textarea" rows="4" cols="250" />
					<aui:input label="Indicador Clave" name="indicadorClave"
						disabled="true" type="textarea" rows="4" cols="250" />
				</aui:column>
				<aui:column columnWidth="50">
					<aui:input type="textarea" label="Observaciones" name="observacion" 
						rows="3" id="idcantidad" > </aui:input>
				</aui:column>
				<aui:column columnWidth="50">
					<aui:input type = "hidden" name = "idevento" id="idevento"></aui:input>
					<aui:input type = "hidden" name = "idindicadorclave" id="fhid"></aui:input>
					<aui:input type = "checkbox" name = "aplica" id="idaplica" checked="<%=Boolean.valueOf(respuesta.getAplica()) %>"></aui:input>
					<aui:button type= "submit" label="Agregar" value="Agregar"></aui:button>
									
				</aui:column>
			</aui:layout>
		</aui:fieldset>
	</div>
</form>
