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

<form action="<%= ajaxCallResourceURL.toString() %>" method="post" id="fm">
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
<script type="text/javascript">
	$(document).ready(function() {		
	    // process the form
	    $('form').submit(function(event) {
			var formID = $(this).closest('form').attr('id');     
			
	        $.ajax({
	            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
	            url         : '<%= ajaxCallResourceURL.toString() %>', // the url where we want to POST
	            data        : $('#'+formID).serialize(), // our data object
	            dataType    : 'json', // what type of data do we expect back from the server
	            encode      : true
	        })
	            // using the done promise callback
	            .done(function(data) {
	                alert(data); 
	            });
	        // stop the form from submitting the normal way and refreshing the page
	        event.preventDefault();
	    });

	});


</script>
