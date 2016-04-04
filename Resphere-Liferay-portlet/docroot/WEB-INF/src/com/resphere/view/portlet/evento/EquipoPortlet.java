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
import com.resphere.server.model.Equipov;
import com.resphere.service.EquipovFacadeREST;

/**
 * Portlet implementation class EquipoPortlet
 */
public class EquipoPortlet extends MVCPortlet {

	private static Log _log = LogFactory.getLog(EquipoPortlet.class);
	private String id;
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.equipov";
			EquipovFacadeREST servicio = new EquipovFacadeREST(Equipov.class, url);
			List<Equipov> equipos = servicio.getAllById(id);
			if(equipos!=null){
				_log.info("equipos en view> " + equipos.size());
				renderRequest.setAttribute("itemlisteq", equipos);				
			}else{
				_log.error("equipos es null");				
			}
		}else{
			_log.error("equipos ERROR ID");
		}
		super.doView(renderRequest, renderResponse);
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void equipoDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		if(idevento != null){		
			_log.info("idevento en equipo es " + idevento);
			response.setRenderParameter("idevento", idevento);
			this.id = idevento;		
		}else
			_log.error("idevento es null");			
	}

}
