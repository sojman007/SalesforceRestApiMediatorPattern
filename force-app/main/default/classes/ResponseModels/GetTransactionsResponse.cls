global class GetTransactionsResponse {
    global string id {get;set;}
    global string accountId {get;set;}
    global string status {get;set;}
    global string description {get;set;}
    global decimal amount {get;set;}
    global DateTime transtime {get;set;}
    public string transactionType {get;set;}

    public static GetTransactionsResponse ConvertFrom(Transaction__c transactionR){
        GetTransactionsResponse response = new GetTransactionsResponse();
        response.id = transactionR.id;
        response.accountId = transactionR.account__c;
        response.amount = transactionR.amount__c;
        response.status = transactionR.status__c;
        response.description = transactionR.description__c;
        response.transtime = transactionR.CreatedDate;
        response.transactionType = transactionR.transaction_Type__c;
        
        return response;

    }




}
