package com.resphere.view.portlet.respuesta;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONException;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.model.Respuestahumanitaria;
import com.resphere.server.model.Eventosv;
import com.resphere.server.model.Indicadorclave;
import com.resphere.server.model.Normaesencial;
import com.resphere.server.model.Normaminima;
import com.resphere.service.EventosvFacadeREST;
import com.resphere.service.IClaveFacadeREST;
import com.resphere.service.NEsencialFacadeREST;
import com.resphere.service.NMinimaFacadeREST;
import com.resphere.service.RespuestahumanitariaFacadeREST;

/**
 * Portlet implementation class RespuestaAgua
 */
public class RespuestaAgua extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(RespuestaAgua.class);
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		String request, request1;
		request = renderRequest.getParameter("jspPage");
		request1 = ParamUtil.getString(renderRequest, "jspPage");
		String url = "http://hp-hp:8080/respherers/webresources/com.resphere.server.model.eventosv";
		EventosvFacadeREST servicio = new EventosvFacadeREST(Eventosv.class, url);
		List<Eventosv> ubicaciones = servicio.getAll();
		if(request!=null && request1!=null)
			_log.error("eventosv are> " + ubicaciones.get(2).getEvento() + " jspPage:" + request1);
		else
			_log.error("eventosv are> " + ubicaciones.get(3).getEvento() +" render is null");
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doView(renderRequest, renderResponse);
	}

	@Override
	public void doEdit(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		String request;
		request = renderRequest.getParameter("jspPage");
		String url = "http://hp-hp:8080/respherers/webresources/com.resphere.server.model.eventosv";
		EventosvFacadeREST servicio = new EventosvFacadeREST(Eventosv.class, url);
		List<Eventosv> ubicaciones = servicio.getAll();
		if(request!=null)
			_log.error("eventosv are> " + ubicaciones.get(2).getEvento() + " jspPage:" + request);
		else
			_log.error("request null");
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doEdit(renderRequest, renderResponse);
	}
	
	/*@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException{
		String renderPageName = ParamUtil.get(request, "renderPage", "respuestaAguaList-jsp");
		String renderPagePath = getInitParameter(renderPageName);
		include(renderPagePath, request, response);
		_log.debug("we are in render" + renderPageName.toString());
		super.render(request, response);
	}*/
		
	@Override
	public void  serveResource(ResourceRequest resourceRequest,
            ResourceResponse resourceResponse) throws IOException,
            PortletException {
 
        /**
         * Read form data sent by AJAX
         */
		/*String namespace = "<portlet:namespace />site:";
		String fid = (String) ParamUtil.getString(resourceRequest, "fid");		
		String cantidad = "fcantidad"+fid;
		String aplica = "faplica"+fid;*/
		String fid = (String) ParamUtil.getString(resourceRequest, "fid");
		String fidevento = (String) ParamUtil.getString(resourceRequest, "idevento");
		String fhid = (String) ParamUtil.getString(resourceRequest, "idiclave");
		String fcantidad = (String) ParamUtil.getString(resourceRequest,"cantidad");
		String faplica = (String) ParamUtil.getString(resourceRequest,"aplica");
		
		if(fcantidad != null && faplica != null && fidevento != null && fid != null){
			Respuestahumanitaria respuesta = new Respuestahumanitaria();
			respuesta.setAplica(faplica);
			respuesta.setIdevento(fidevento);
			respuesta.setIdindicadorclave(fhid);
			respuesta.setObservacion(fcantidad);
			String url = "http://hp-hp:8080/respherers/webresources/com.resphere.server.model.respuestahumanitaria";
			RespuestahumanitariaFacadeREST servicio = new RespuestahumanitariaFacadeREST(Respuestahumanitaria.class, url);
			if(servicio!=null)
				try {
					servicio.post(respuesta);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			System.out.println("fcantidad: " + fcantidad + ";faplica: " + faplica + ";fid: " + fid + ";fhid: " + fhid + ";idevento: " + fidevento);
		}
		super.serveResource(resourceRequest, resourceResponse);
		
	}
	
	 public void respuestaDetails(ActionRequest actionRequest, ActionResponse actionResponse)throws IOException, PortletException, PortalException, SystemException{
	   
		String id, action = null;
		
		id = (String)actionRequest.getParameter("id");		
		action = (String)actionRequest.getParameter("action");
		
		if(id !=null && action != null)
			_log.error("we are in action> " + id + ":" + action);
		else
			_log.error("problems in action");
	
		String urlnm = "http://hp-hp:8080/respherers/webresources/com.resphere.server.model.normaminima";
		String urlne = "http://hp-hp:8080/respherers/webresources/com.resphere.server.model.normaesencial";
		String urlic = "http://hp-hp:8080/respherers/webresources/com.resphere.server.model.indicadorclave";		
		
		NMinimaFacadeREST servicionm = new NMinimaFacadeREST(Normaminima.class, urlnm);
		List<Normaminima> nminimas = servicionm.getAllByIdSH("1");
		if(nminimas != null && nminimas != null){
			ArrayList<List<Normaesencial>> nesenciales = new ArrayList<List<Normaesencial>>();
			for(int i = 0; i < nminimas.size(); i ++){
				NEsencialFacadeREST servicione = new NEsencialFacadeREST(Normaesencial.class, urlne);
				if(servicione != null){
					nesenciales.add(servicione.getAllByIdNM(nminimas.get(i).getIdnormaminima().toString()));										
				}				
			}			
			
			ArrayList<List<Indicadorclave>> iclaves = new ArrayList<List<Indicadorclave>>();
			IClaveFacadeREST servicioic = new IClaveFacadeREST(Indicadorclave.class, urlic);
			if(servicioic != null){	
				int totalic = 0;
				for(int i = 0; i < nesenciales.size(); i++)
					for(int j = 0; j < nesenciales.get(i).size(); j++){						
						iclaves.add(servicioic.getAllByIdNE(nesenciales.get(i).get(j).getIdnormaesencial().toString()));
						totalic += iclaves.get(i).size();						
					}				
			}
//			_log.error("iclaves size = " + iclaves.size());
//			for(int i = 0; i < iclaves.size(); i ++){
//				_log.error("lista indicadores " + i + " = " + iclaves.get(i).size());
//				for(int j = 0; j < iclaves.get(i).size(); j++)
//					_log.error("id indicador " + j + " = " + iclaves.get(i).get(j).getIdindicadorclave());
//			}
//				
			actionRequest.setAttribute("idevento", id);
			actionRequest.setAttribute("nesenciales", nesenciales);
			actionRequest.setAttribute("nminimas", nminimas);
			actionRequest.setAttribute("iclaves", iclaves);
		}
		else
			_log.error("error al traer normas");		
		
		actionResponse.setRenderParameter("jspPage", "/html/respuestaagua/edit.jsp");
	  
	 } 
	
	public void viewDetails(ActionRequest request, ActionResponse response){
		
	}
	
}
