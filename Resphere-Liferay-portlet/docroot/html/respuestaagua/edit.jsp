<%@taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui1"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js">   
</script>

<portlet:resourceURL var="ajaxCallResourceURL">
</portlet:resourceURL>

<liferay-ui:search-container emptyResultsMessage="No existen normas minimas" delta="10">
	<liferay-ui:search-container-results>
	<%	List<Normaminima> nminimas = (List<Normaminima>)request.getAttribute("nminimas");
		if(nminimas != null){
			results = ListUtil.subList(nminimas, searchContainer.getStart(), searchContainer.getEnd());
			total = nminimas.size();
			pageContext.setAttribute("results", results);			
		}
		else
			System.out.println("problemas al extraer normas");				
		%>
	</liferay-ui:search-container-results>	
	<%int k = 0; %>
	<liferay-ui:search-container-row className="com.resphere.server.model.Normaminima" keyProperty="idnormaminima" modelVar="normaminima">			
		<liferay-ui:search-container-column-text name="Normas Minimas">					
			<liferay-ui:panel collapsible="true" defaultState="open" title="<%=normaminima.getNormaminima() %>">				
				<%							
					PortletPreferences prefs = renderRequest.getPreferences();
					//String idevento = (String)prefs.getValue("id", "");
					String idevento = (String)request.getAttribute("idevento");
					ArrayList<List<Normaesencial>> nesenciales = (ArrayList<List<Normaesencial>>)request.getAttribute("nesenciales");
					ArrayList<List<Indicadorclave>> iclaves = (ArrayList<List<Indicadorclave>>)request.getAttribute("iclaves");					
					if(nesenciales == null)
						System.out.println("problemas al extraer normas esenciales");					
					int idnesenciales = nesenciales.get(Integer.valueOf(row.getRowId())-1).size();
					for(int j = 0; j < nesenciales.get(Integer.valueOf(row.getRowId())-1).size(); j++)					
					{
						//System.out.println("Array[" + j + "]" + "->row(" + row.getRowId() + ")" + " iteracion:" + k);
					%>										
				<liferay-ui:panel collapsible="true" defaultState="open" title="<%=nesenciales.get(Integer.valueOf(row.getRowId())-1).get(j).getDescripcion() %>">					
					<%										
						if(iclaves == null)
							System.out.println("problemas al extraer indicadores clave");							
						for(int i = 0; i < iclaves.get(k).size(); i++)
						{
					 %>
					 <%	String idform = String.valueOf(iclaves.get(k).get(i).getIdindicadorclave());				 
					 	String fm = "fm"+idform;
					 	String tg =  "tg" + idform;	 %>	
					 <form action="<%= ajaxCallResourceURL.toString() %>" method="post" id="<%=fm%>">	
					 	<div class="formresponse" id="<%=tg%>">
					 		<p class="header toggler-header-collapsed"><span>+  </span><%=iclaves.get(k).get(i).getIndicadorclave() %></p>
					 			<p class="content toggler-content-collapsed">									
										<input type="checkbox" name="aplica" label="aplica" id="idaplica"> aplica</input>
										<input type = "hidden" name = "idiclave" value = "<%=idform %>" id="fhid"></input>
										<input type = "hidden" name = "idevento" value = "<%=idevento %>" id="idevento"></input>
										<textarea name="cantidad" label="" cols="120" rows="2"  id="idcantidad" class="idaplica"> </textarea>		
										<button type= "submit" label="Agregar">Guardar</button>											
								</p>
							</div>
						</form>
					</liferay-ui:panel>		
					 <%
					 k++;
					 } %>
				</liferay-ui:panel>
				<%} %>
			
				
		</liferay-ui:search-container-column-text>		
	
	</liferay-ui:search-container-row>	
	
	<liferay-ui:search-iterator paginate="false"/>
</liferay-ui:search-container>

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
<aui:script use="aui-io-request,aui-node">
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
 <portlet:renderURL var="editRespuestaAgua">
 	<portlet:param name="itemlist" value="itemlist"/>
	<portlet:param name="jspPage" value="/html/respuestaagua/view.jsp"/>
</portlet:renderURL>
<a href="<%=editRespuestaAgua%>">volver</a>

