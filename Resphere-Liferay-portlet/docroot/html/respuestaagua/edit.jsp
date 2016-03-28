<%@taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui1"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>

<script src="http://code.jquery.com/jquery-latest.js">   
</script>

<portlet:resourceURL var="ajaxCallResourceURL">
</portlet:resourceURL>
<%String currentURL = (String)PortalUtil.getCurrentURL(request); 
	String evento = (String)request.getAttribute("evento");
	String lugar = (String)request.getAttribute("lugar");
	String descripcion = evento.toUpperCase() + " en " + lugar;%>
	
<aui:fieldset label="<%=descripcion%>">		
</aui:fieldset>

<liferay-ui:search-container emptyResultsMessage="No existen normas minimas" delta="50">
	<liferay-ui:search-container-results>
	<%	List<Respuestahumanitariav> respuestasv = (List<Respuestahumanitariav>)request.getAttribute("respuestasAgua");
		System.out.println("edit.jsp after render > " + request.getAttribute("idevento"));
		
		if(respuestasv != null){
			for(Respuestahumanitariav item: respuestasv){
				if(item.getAplica().equals("A") || item.getAplica().equals("1") || item.getAplica().equals("on")){				
					item.setAplica("A");
				}else{				
					item.setAplica("P");
				}
				item.setIdevento((String)request.getAttribute("idevento"));
			}
			results = ListUtil.subList(respuestasv, searchContainer.getStart(), searchContainer.getEnd());
			total = respuestasv.size();			
			pageContext.setAttribute("results", results);			
		}
		else
			System.out.println("problemas al extraer normas");						
		%>
	</liferay-ui:search-container-results>		
	<liferay-ui:search-container-row className="com.resphere.server.model.Respuestahumanitariav" keyProperty="idindicadorclave" modelVar="respuestad">			
		<portlet:actionURL name="respuestaAccion" var="actionURL">            
	            <portlet:param name="idevento" value='<%=String.valueOf(respuestad.getIdevento())%>'/>
	            <portlet:param name="idindicadorclave" value='<%=String.valueOf(respuestad.getIdindicadorclave())%>'/>	            
	            <portlet:param name="backURL" value="<%= currentURL %>" />
	            <portlet:param name="action" value="edit"/>
	        </portlet:actionURL>
		<liferay-ui:search-container-column-text name="Norma Minima" property="normaMinima"/>	
		<liferay-ui:search-container-column-text name="Norma Esencial" property="normaEsencial"/>
		<liferay-ui:search-container-column-text name="Indicador Clave" property="indicadorClave"/>
		<liferay-ui:search-container-column-text name="Estado" property="aplica"/>		
		<liferay-ui:search-container-column-text name="Accion">
			<a href="<%=actionURL.toString() %>">Edit</a>
		</liferay-ui:search-container-column-text>
			
	</liferay-ui:search-container-row>	
	
	<liferay-ui:search-iterator paginate="<%=false%>" />
</liferay-ui:search-container>

<div id="dialog" title="Titulo dialog" style="display:none;">    
	<p>Contenido de la ventana.</p>
</div>
    

<script>
	function abrir_dialog() {
        $( "#dialog" ).dialog();
    };
</script>


<script type="text/javascript">
	YUI().use(
  'aui-toggler',
  function(Y) {
	$('.formresponse').click(function() {
    var status = $(this).attr('id');    
    new Y.TogglerDelegate({
        animated: true,
        closeAllOnExpand: true,
        container: '#'+status,
        content: '.content',
        expanded: false,
        header: '.header',
        transition: {
          duration: 0.2,
          easing: 'cubic-bezier(0, 0.1, 0, 1)'
        }
      }
    );
    });
  }
);
</script>
 
<script type="text/javascript">
	$(document).ready(function() {
		/*
		$(function() {
		    enable_cb();
		    $("#idaplica").click(enable_cb);
		});
		
		function enable_cb() {
		    $("input.idaplica").prop("disabled", !this.checked);
		}*/
	    // process the form
	    $('form').submit(function(event) {
			var formID = $(this).closest('form').attr('id');     
			
	        $.ajax({
	            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
	            url         : '<%= ajaxCallResourceURL.toString() %>', // the url where we want to POST
	            data        : $('#'+formID).serialize(), // our data object
	            dataType    : 'json', // what type of data do we expect back from the server
	            encode          : true
	        })
	            // using the done promise callback
	            .done(function(data) {
	                alert(data); 
	            });
	        // stop the form from submitting the normal way and refreshing the page
	        event.preventDefault();
	    });

	});
	
	/*var idform1 = $("form").attr('id');
	alert(idform1);
	var form = $(idform1);
		
	$(this).submit(function () { 
		$.ajax({
			type: $(this).attr('method'),
			url: $(this).attr('action'),
			data: $(this).serialize(),
			success: function (data) {
			var result=data;
			$('#result').attr("value",result);
			 
			}
		});	 
		return false;
	});*/
	
	/*var idform1 = $("form").attr('id');
	alert(idform1);
	var form = $(idform1);
		
	form.submit(function () { 
		$.ajax({
			type: form.attr('method'),
			url: form.attr('action'),
			data: form.serialize(),
			success: function (data) {
			var result=data;
			$('#result').attr("value",result);
			 
			}
		});	 
		return false;
	});*/
	/*
	$(document).ready(function() {
		// process the form
    	$('form').submit(function(event) {
    		// process the form
    		var form = this.form;
        $.ajax({
            type        : $(form).attr('method'), // define the type of HTTP verb we want to use (POST for our form)
            url         : $(form).attr('action'), // the url where we want to POST
            data        : $(form).serialize, // our data object
            dataType    : 'json', // what type of data do we expect back from the server
            encode      : true,
            success		: function(data){
            	alert(form);
            }
        });
        //event.preventDefault();
    	});
	//event.preventDefault();
	return false;
	});*/
</script>

</script> 
 <!-- 
<aui:script use="aui-io-request-deprecated,aui-node">
	Liferay.provide(window,'guardarrespuesta', function(name) {
		var A = AUI();		
		var idform = '<portlet:namespace />fm';
		
		var url = '<%= ajaxCallResourceURL.toString() %>';				
		var aplica = "faplica"+name;
		var cantidad = "fcantidad"+name;
		
		A.io.request(url,{
			method : 'POST',
				data: { fid: name},
				form: { id: idform },
			on: {
					failure: function() {
					},					
					success: function(event, id, obj) {
						var instance = this;
						var message = instance.get('responseData');						
						
					}
				}
			});
	});	
 -->

</aui:script>


