package com.resphere.view.portlet.evento;

import java.io.IOException;

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
import com.resphere.server.model.Evento;
import com.resphere.server.model.Ubicacion;
import com.resphere.service.UbicacionFacadeREST;

/**
 * Portlet implementation class UbicacionPortlet
 */
public class UbicacionPortlet extends MVCPortlet {
 

	private static Log _log = LogFactory.getLog(ListEventosPortlet.class);
	private String id;
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch2")
	public void ubicacionDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();	
		_log.error("idevento en Ubicacion pitch2 is> " + idevento);
		response.setRenderParameter("idevento", idevento);
		this.id = idevento;
	}
	
	//Default Render Method.
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {	
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.ubicacion";
			UbicacionFacadeREST servicio = new UbicacionFacadeREST(Ubicacion.class, url);
			Ubicacion ubicacion = new Ubicacion();
			ubicacion = servicio.get(id);			
			_log.info("idevento en Ubicacion view is> " + ubicacion.getIdevento());
			//renderRequest.setAttribute("latitud", ubicacion.getLatitud());
			renderRequest.setAttribute("ubicacion", ubicacion);
		}else
			renderRequest.setAttribute("descripcion", "waiting for response");
		super.doView(renderRequest, renderResponse);
	}
}
