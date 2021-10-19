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
        Map<string,Object> deserializedResponse = (Map<string,Object>)JSOn.deserializeUntyped(Json.serialize(response));
        system.debug(deserializedResponse);
        res.statusCode = Integer.valueOf(deserializedResponse.get('responseCode'));
        deserializedResponse.remove('responseCode');
        res.responseBody = Blob.valueOf(Json.serialize(deserializedResponse));


    }

    @HttpPost
    global static void HandlePostRequests(){
        
        RestRequest req = RestContext.Request;
        RestResponse res = RestContext.Response;
        string apiRoute = req.requestURI.substringAfter('agro/');
        system.debug(apiroute);
        RoutingService router = new RoutingService();
        IRequestHandler handler = router.GetRequestHandlerAtRoute(apiroute);
        System.debug(handler.getType());
        IResponse response = handler.HandleRequest(apiRoute, req);
        Map<string,Object> deserializedResponse = (Map<string,Object>)JSOn.deserializeUntyped(Json.serialize(response));
        system.debug(deserializedResponse);
        res.statusCode = Integer.valueOf(deserializedResponse.get('responseCode'));
        deserializedResponse.remove('responseCode');
        res.responseBody = Blob.valueOf(Json.serialize(deserializedResponse));


    }


    
}
