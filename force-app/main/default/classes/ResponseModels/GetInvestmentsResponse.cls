public class GetInvestmentsResponse {
    public string id {get;set;}
    public string name {get;set;}
    public string imageUrl {get;set;}
    public decimal amount {get;set;}
    public double duration {get;set;}
    public string company {get;set;}
    public double interestRate {get;set;}
    public Date datePosted {get;set;}
    public string availability {get;set;}
    public string location {get;set;}
    public string about {get;set;}


    public static GetInvestmentsResponse ConvertFrom(Investment__c investment){
        GetInvestmentsResponse result = new GetInvestmentsResponse();
        result.id = investment.Id;
        result.name = investment.Name;
        result.imageUrl = investment.ImageUrl__c;
        result.interestRate = investment.Interest_Rate__c;
        result.location = investment.Location__c;
        result.datePosted = investment.CreatedDate.Date();
        result.availability = investment.Availability__c;
        result.company = investment.Company__c;
        result.about = investment.About__c;
        result.amount = investment.Amount__c;
        result.duration = investment.Duration__c;

        return result;



    }


}
