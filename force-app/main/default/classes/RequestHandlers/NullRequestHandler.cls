public  class NullRequestHandler implements IRequestHandler {
    
    public string getType(){
        return 'Null Handler';
    }

    public GenericResponse HandleRequest(string route , RestRequest request){
        GenericResponse response = new GenericResponse();
        response.responseCode ='500';
        response.responseDescription ='FAILED';
        response.userFriendlyMessage ='No request handler found for request at route : '+route;

        return response;
    }

}
