<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>

<portlet:resourceURL var="ajaxCallResourceURL">
</portlet:resourceURL>
<liferay-ui:search-container emptyResultsMessage="No existen eventos" delta="10">
	<liferay-ui:search-container-results>
	<% 	List<Eventosv> tempResults = (List<Eventosv>)request.getAttribute("itemlist"); 
		if(tempResults!=null){
			results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
			total = tempResults.size();
			pageContext.setAttribute("results", results);
			pageContext.setAttribute("total", total);
		}else{
			System.out.println("lista vacia");
		}
	%>
	
	</liferay-ui:search-container-results>	
		<liferay-ui:search-container-row className="com.resphere.server.model.Eventosv" keyProperty="idevento" modelVar="eventov">
			<portlet:actionURL name="showRespuestaAguaDetail" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(eventov.getIdevento())%>'/>
	            <portlet:param name="pageName" value="respuestaAguaDetail-jsp"/>
	        </portlet:actionURL>	        
	        <% PortletPreferences prefs = renderRequest.getPreferences();
				String id = (String)prefs.getValue("id", ""); 
	        	prefs.setValue("id", String.valueOf(eventov.getIdevento()));
	        	prefs.store();%>    		
			<liferay-ui:search-container-column-text name="Evento" property="evento" href="<%=leaveApplicationURL.toString()%>"/>
			<liferay-ui:search-container-column-text name="Latitud" property="latitud" />
			<liferay-ui:search-container-column-text name="Longitud" property="longitud" />
			<liferay-ui:search-container-column-text name="Provincia" property="provincia"/>
			<liferay-ui:search-container-column-text name="Canton" property="canton"/>
			<liferay-ui:search-container-column-text name="Parroquia" property="parroquia"/>	
				
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>

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
										<input type="checkbox" name="<portlet:namespace />aplica" label="aplica" id="idaplica"> aplica</input>
										<input type = "hidden" name = "<portlet:namespace />idiclave" value = "<%=idform %>" id="fhid"></input>
										<input type = "hidden" name = "<portlet:namespace />idevento" value = "<%=idevento %>" id="idevento"></input>
										<textarea name="<portlet:namespace />cantidad" label="" cols="120" rows="2"  id="idcantidad" class="idaplica"> </textarea>		
										<aui:button type= "submit" label="Agregar" value="Agregar"  onclick="abrir_dialog()"></aui:button>																					
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