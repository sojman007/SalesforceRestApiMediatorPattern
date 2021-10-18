@RestResource(urlmapping='/agro/*')
global class HackatonRestApi {
    
    @HttpGet
    global static void HandleGetRequests(){
        
        RestRequest req = RestContext.Request;
        string apiRoute = req.requestURI.substringAfter('agro/');
        system.debug(apiroute);
        RoutingService router = new RoutingService();
        IRequestHandler handler = router.GetRequestHandlerAtRoute(apiroute);
        System.debug(handler.getType());
        IResponse response = handler.HandleRequest(apiRoute, req);

    }



    
}
