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
import com.resphere.server.model.Acceso;
import com.resphere.server.model.Tipoacceso;
import com.resphere.service.AccesoFacadeREST;
import com.resphere.service.TipoaccesoFacadeREST;

/**
 * Portlet implementation class AccesoPortlet
 */
public class AccesoPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(AccesoPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.acceso";
			String urlta = "http://localhost:8080/respherers/webresources/com.resphere.server.model.tipoacceso";
			AccesoFacadeREST acceso = new AccesoFacadeREST(Acceso.class, url);
			TipoaccesoFacadeREST tipo = new TipoaccesoFacadeREST(Tipoacceso.class, urlta);
			List<Tipoacceso> tipos = tipo.getAllById(id);
			Acceso item = acceso.get(id);
			if(item != null && tipos.get(0) != null){
				renderRequest.setAttribute("itema", item);
				renderRequest.setAttribute("itemta", tipos.get(0));
				super.doView(renderRequest, renderResponse);
			}else{
				_log.error("acceso es null");
				super.doView(renderRequest, renderResponse);
			}
		}else{
			_log.error("acceso ERROR CONEXION");
		}
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void accesoDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		if(idevento != null){		
			_log.info("idevento en acceso es " + idevento);
			response.setRenderParameter("idevento", idevento);
			this.id = idevento;		
		}else
			_log.error("idevento es null");			
	}
}
