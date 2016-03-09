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
import com.resphere.server.model.Mediovida;
import com.resphere.server.model.Mediovidav;
import com.resphere.service.MediovidaFacadeREST;
import com.resphere.service.MediovidavFacadeREST;

/**
 * Portlet implementation class MediosPortlet
 */
public class MediosPortlet extends MVCPortlet {

	private static Log _log = LogFactory.getLog(MediosPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.mediovidav";
			MediovidavFacadeREST servicio = new MediovidavFacadeREST(Mediovidav.class, url);
			List<Mediovidav> medios = servicio.getAllById(id);
			if(medios != null){
				for(Mediovidav item: medios)
					System.out.println(item.getIdtipodano());
				renderRequest.setAttribute("itemlistm", medios);
				super.doView(renderRequest, renderResponse);
			}else{
				_log.error("medios es null");
				super.doView(renderRequest, renderResponse);
			}
		}else{
			_log.error("medios ERROR CONEXION");
		}
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void mediosDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		_log.error("idevento en Mediosvida lanzamiento 4 is> " + idevento);
		response.setRenderParameter("idevento", idevento);
		this.id = idevento;		
	}

}
