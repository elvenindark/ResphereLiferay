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
 
	private static Log _log = LogFactory.getLog(OrganizacionPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){			
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.organizacion";
			OrganizacionFacadeREST servicio = new OrganizacionFacadeREST(Organizacion.class, url);
			List<Organizacion> organizaciones = servicio.getAllById(this.id);
			String urla = "http://localhost:8080/respherers/webresources/com.resphere.server.model.accion";			
			AccionFacadeREST servicioa = new AccionFacadeREST(Accion.class, urla);
			_log.info("idevento for search organizacion> " + this.id);						
			List<Accion> acciones = servicioa.getAllById(this.id);
			if(organizaciones != null){		
				renderRequest.setAttribute("itemlisto", organizaciones);
				_log.info("organizaciones not null> " + organizaciones.size());
			}else
				_log.info("organizaciones null");
			if(acciones != null){			
				renderRequest.setAttribute("itemlistac", acciones);
				_log.info("acciones not null> " + acciones.size());
			}else
				_log.info("acciones null");
			super.doView(renderRequest, renderResponse);			
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
