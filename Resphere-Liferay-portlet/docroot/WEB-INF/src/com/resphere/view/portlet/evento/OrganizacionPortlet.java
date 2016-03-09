package com.resphere.view.portlet.evento;

import java.io.IOException;
import java.util.List;

import javax.portlet.Event;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
import javax.portlet.PortletException;
import javax.portlet.ProcessEvent;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.server.model.Accion;
import com.resphere.server.model.Organizacion;
import com.resphere.service.AccionFacadeREST;
import com.resphere.service.OrganizacionFacadeREST;

/**
 * Portlet implementation class OrganizacionPortlet
 */
public class OrganizacionPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(Organizacion.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.organizacion";
			String urla = "http://localhost:8080/respherers/webresources/com.resphere.server.model.accion";
			OrganizacionFacadeREST servicio = new OrganizacionFacadeREST(Organizacion.class, url);
			AccionFacadeREST servicioa = new AccionFacadeREST(Accion.class, urla);
			List<Organizacion> organizaciones = servicio.getAllById(id);
			List<Accion> acciones = servicioa.getAllById(id);
			if(organizaciones != null){
				for(Organizacion item: organizaciones)
					System.out.println(item);
				renderRequest.setAttribute("itemlisto", organizaciones);			
				if(acciones != null){
					for(Accion itema: acciones)
						System.out.println();
					renderRequest.setAttribute("itemlistac", acciones);
				}
				super.doView(renderRequest, renderResponse);
			}else{
				_log.error("organizaciones es null");
				super.doView(renderRequest, renderResponse);
			}
		}else{
			_log.error("organizaciones ERROR CONEXION");
		}
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void organizacionDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		if(idevento != null){		
			_log.info("idevento en organizaciones es " + idevento);
			response.setRenderParameter("idevento", idevento);
			this.id = idevento;		
		}else
			_log.error("idevento es null");			
	}
}
