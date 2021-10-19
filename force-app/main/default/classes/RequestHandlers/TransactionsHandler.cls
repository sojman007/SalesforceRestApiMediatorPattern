public class TransactionsHandler {
    

    public IResponse handleRequest(string apiroute, RestRequest request){
        string userId = apiroute.substringAfterLast('/');
        if(request.httpMethod == 'GET'){
            return GetUsersTransactions(userId);
        }
    }


    public string getType(){
        return 'Transactions Handler';
    }

    public GetTransactionsForUserResponse GetUsersTransactions(string userId){

        GetTransactionsForUserResponse response = new GetTransactionsForUserResponse();
        List<Transaction__c> TransactionsForUser = [Select Id,
                                                        Account__c,
                                                        Description__c,
                                                        Transaction_Type__c,
                                                        Amount__c,
                                                        Status__c,
                                                        CreatedDate
                                                        FROM Transaction__c Where Account__c =:userId];

        if(TransactionsForUser != null && TransactionsForUser.size() > 0){
            response.responseCode = '200';
            response.responseDescription='SUCCESS';
            response.userFriendlyMessage ='Retreived Successfully';
            response.numberOfRecords = TransactionsForUser.size();
            response.Transactions = new List<GetTransactionsResponse>();
            for(Transaction__c trans : TransactionsForUser){
                response.Transactions.add(GetTransactionsResponse.ConvertFrom(trans));
            }
        }else{
            response.responseCode ='404';
            response.responseDescription ='NOT FOUND';
            response.userFriendlyMessage =' No Transactions currently exist for this User';
        }   


        return response;






    }




}
