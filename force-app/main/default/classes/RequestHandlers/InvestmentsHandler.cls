public  class InvestmentsHandler implements IRequestHandler {
    
    public string getType(){
        return 'Investments Handler';
    }


    public IResponse HandleRequest(string route, RestRequest request) {
        string userId = apiroute.substringAfterLast('/');
        if(request.httpMethod == 'GET'){
            return GetUserInvestments(userId);
        }
        return null;
    }


    public GetInvestmentsForUserResponse GetUserInvestments(string userId){

        GetInvestmentsForUserResponse response = new GetInvestmentsForUserResponse();
        List<Investment__c> investmentsForUser = [Select Id,
                                                        Amount__c,
                                                        About__c,
                                                        Availability__c,
                                                        Company__c,
                                                        Duration__c,
                                                        ImageUrl__c,
                                                        Interest_Rate__c,
                                                        Name,
                                                        Location__c
                                                        FROM Investment__c Where Account__c =:userId];

        if(investmentsForUser != null && investmentsForUser.size() > 0){
            response.responseCode = '200';
            response.responseDescription='SUCCESS';
            response.userFriendlyMessage ='Retreived Successfully';
            response.numberOfRecords = investmentsForUser.size();
            response.investments = new List<GetInvestmentsResponse>();
            for(Investment__c inv : investmentsForUser){
                response.investments.add(GetInvestmentsResponse.ConvertFrom(inv));
            }
        }else{
            response.responseCode ='404';
            response.responseDescription ='NOT FOUND';
            response.userFriendlyMessage =' No Investments currently exist for this User';
        }   


        return response;


    } 

    

}
