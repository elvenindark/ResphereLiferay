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
import com.resphere.server.model.Salud;
import com.resphere.service.SaludFacadeREST;

/**
 * Portlet implementation class SaludPortlet
 */
public class SaludPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(SaludPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.salud";
			SaludFacadeREST servicio = new SaludFacadeREST(Salud.class, url);
			List<Salud> saluds = servicio.getAllById(id);
			if(saluds!=null){
				for(Salud item: saluds)
					System.out.println(item);
				renderRequest.setAttribute("itemlistsa", saluds);
				super.doView(renderRequest, renderResponse);
			}else{
				_log.error("servicios es null");
				super.doView(renderRequest, renderResponse);
			}
		}else{
			_log.error("servicios ERROR CONEXION");
		}
	}

	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void saludDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		if(idevento != null){		
			_log.info("idevento en salud es " + idevento);
			response.setRenderParameter("idevento", idevento);
			this.id = idevento;		
		}else
			_log.error("idevento es null");			
	}
}
