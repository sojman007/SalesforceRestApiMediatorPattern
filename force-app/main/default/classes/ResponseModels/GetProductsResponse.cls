global class GetProductsResponse {
    global string id {get;set;}
    global string name {get;set;}
    global decimal price {get;set;}
    global string imageUrl {get;set;}
    global string description {get;set;}
    global string dealer {get;set;}
    global string location {get;set;}
    global Date datePosted {get;set;}


    global static GetProductsResponse ConvertFrom(Hackathon_Product__c product){
        GetProductsResponse response = new GetProductsResponse();
        response.id = product.id;
        response.name = product.name;
        response.price = product.price__c;
        response.imageUrl = product.imageUrl__c;
        response.description = product.description__c;
        response.dealer = product.dealer__c;
        response.location = product.location__c;
        response.datePosted = product.CreatedDate.date();

        return response;
    
    }

}
