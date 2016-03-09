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
import com.resphere.server.model.Nrecuperacionv;
import com.resphere.server.model.Nrrhhv;
import com.resphere.server.model.Nurgentev;
import com.resphere.service.NrecuperacionvFacadeREST;
import com.resphere.service.NrrhhvFacadeREST;
import com.resphere.service.NurgentevFacadeREST;

/**
 * Portlet implementation class NecesidadesPortlet
 */
public class NecesidadesPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(NecesidadesPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String urlnu = "http://localhost:8080/respherers/webresources/com.resphere.server.model.nurgentev";
			String urlnrh = "http://localhost:8080/respherers/webresources/com.resphere.server.model.nrrhhv";
			String urlnru = "http://localhost:8080/respherers/webresources/com.resphere.server.model.nrecuperacionv";
			NurgentevFacadeREST servicionu = new NurgentevFacadeREST(Nurgentev.class, urlnu);
			NrrhhvFacadeREST servicionrh = new NrrhhvFacadeREST(Nrrhhv.class, urlnrh);
			NrecuperacionvFacadeREST servicionru = new NrecuperacionvFacadeREST(Nrecuperacionv.class, urlnru);
			List<Nurgentev> nurgentes = servicionu.getAllById(id);
			List<Nrecuperacionv> nrecuperaciones = servicionru.getAllById(id);
			List<Nrrhhv> nrrhhs = servicionrh.getAllById(id);
			if(nurgentes!=null)
				renderRequest.setAttribute("itemlistnu", nurgentes);
			else
				_log.error("nurgentes es null");
			if(nrecuperaciones!=null)
				renderRequest.setAttribute("itemlistnru", nrecuperaciones);
			else
				_log.error("nrecuperaciones es null");
			if(nrrhhs!=null)
				renderRequest.setAttribute("itemlistnrh", nrrhhs);
			else
				_log.error("nrrhhs es null");
			super.doView(renderRequest, renderResponse);
		}else
			_log.error("NO SE HA CONSEGUIDO ID");
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void necesidadesDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		if(idevento != null){		
			_log.info("idevento en Necesidades es " + idevento);
			response.setRenderParameter("idevento", idevento);
			this.id = idevento;		
		}else
			_log.error("idevento es null");			
	}
}
