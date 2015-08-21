package com.resphere.view.portlet.evento;

import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.xml.namespace.QName;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.util.bridges.mvc.MVCPortlet;

import com.resphere.server.model.Ubicacion;

import com.resphere.service.UbicacionFacadeREST;


/**
 * Portlet implementation class ListEventosPortlet
 */
public class ListEventosPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(ListEventosPortlet.class);
	//Default Render Method.
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.ubicacion";
		UbicacionFacadeREST servicio = new UbicacionFacadeREST(Ubicacion.class, url);
		List<Ubicacion> ubicaciones = servicio.getAll();
		_log.error("ubicaciones are> " + ubicaciones.get(0).getLatitud());
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doView(renderRequest, renderResponse);
	}

	//"Dispara" el evento y envia el id
	public void viewDetails(ActionRequest request, ActionResponse response){
		String id = null;
		id = (String)request.getParameter("search");
		_log.error("idevento en action is> " + id);
		QName qName = new QName("http://liferay.com/events","ipc.pitch");		
		response.setEvent(qName, id);
		QName qName2 = new QName("http://liferay.com/events","ipc.pitch2");		
		response.setEvent(qName2, id);
		QName qName3 = new QName("http://liferay.com/events","ipc.pitch3");		
		response.setEvent(qName3, id);
		QName qName4 = new QName("http://liferay.com/events","ipc.pitch4");		
		response.setEvent(qName4, id);
		
		try {
			response.sendRedirect("/web/resphere/evaluacion");			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
