public  class AccountUserDetail extends CreateAccountModel{
    public string id {get;set;}
    public boolean deleted {get;set;}

    


    public  static AccountUserDetail ConvertFrom(Hackathon_Account__c a){
        AccountUserDetail result = new AccountUserDetail();
        result.bvn = a.Bvn__c;
        result.firstName = a.First_Name__c;
        result.lastName = a.Name;
        result.dateCreated = a.CreatedDate.Date();
        result.deleted = false;
        result.email = a.Email__c;
        result.phoneNumber = a.Phone_Number__c;
        result.accountType = a.Account_Type__c;
        result.nin = a.Nin__c;
        result.netWorth = a.Net_Worth__c;
        result.id = a.Id;

        return result;


    }


    public static Hackathon_Account__c ConvertTo(){
        return null;

    }
}
