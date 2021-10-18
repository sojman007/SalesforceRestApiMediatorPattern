public  class AuthHandler implements IRequestHandler {
    
    //private string fieldsOfInterest = '';

    public GenericResponse HandleRequest(string apiRoute,RestRequest req){
        return null;

    }

    public string getType(){
        return 'Auth Handler';
    }

    public LogInResponse Login(string email , string password){
        List<Hackathon_Account__c> accounts = [SELECT 
                                    Id, 
                                    First_Name__c,
                                    Name, 
                                    Bvn__c, 
                                    Nin__c, 
                                    Email__c,
                                    Net_Worth__c, 
                                    Account_Type__c,
                                    Deleted__c,
                                    Password__c,
                                    Phone_Number__c FROM Hackathon_Account__c WHERE Email__c =:email AND Deleted__c =false];
        LogInResponse res = new LogInResponse();
        if(accounts != null && accounts.size() >0){
            Hackathon_Account__c accountOfInterest  = accounts.get(0);
            
            if(accountOfInterest.Password__c == password){
                res.responseCode ='200';
                res.responseDescription ='SUCCESS';
                res.userFriendlyMessage ='LogIn Successful';
                res.profileInfo = AccountUserDetail.ConvertFrom(accountOfInterest);
            }
            
        }
        else{
            res.responseCode = '401';
            res.responseDescription = 'FAILURE';
            res.userFriendlyMessage ='Invalid login credentials';
        }

        return res;
    }



    public GenericResponse CreateAccount(CreateAccountModel create){
        GenericResponse res = new GenericResponse();
        Hackathon_Account__c account = new Hackathon_Account__c();
        account.Bvn__c = create.bvn  ;
        account.First_Name__c=  create.firstName;
        account.Name =create.lastName;
        account.Email__c = create.email;
        account.Phone_Number__c = create.phoneNumber;
        account.Account_Type__c = create.accountType;
        account.Nin__c =create.nin;
        account.Net_Worth__c= create.netWorth;

        try {
            insert account;
            res.responseCode ='200';
            res.responseDescription ='SUCCESS';
            res.userFriendlyMessage='User ' + account.Email__c + ' created successfully';
        }catch(DmlException e){
            res.responseCode ='500';
            res.responseDescription ='FAILED';
            res.userFriendlyMessage='User ' + account.Email__c + ' NOT created';

        }
        
        return res;

    }


}
