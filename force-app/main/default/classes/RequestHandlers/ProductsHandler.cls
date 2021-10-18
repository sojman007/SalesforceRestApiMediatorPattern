public  class ProductsHandler implements IRequesthandler {
    

    public string getType(){
        return 'Products Handler';
    }
    public GenericResponse HandleRequest(string apiroute , RestRequest request){
        return null;
    }

    public GetProductsUserResponse GetProducts(){
        GetProductsUserResponse response = new GetProductsUserResponse();
        List<Hackathon_Product__c> products = new List<Hackathon_Product__c>([Select Id,
                                                                                name,
                                                                                price__c,
                                                                                imageUrl__c,
                                                                                description__c,
                                                                                dealer__c,
                                                                                location__c,
                                                                                CreatedDate FROM Hackathon_Product__c]);
                                                                                


        if(products != null && products.size() >0){
            response.responseCode ='200';
            response.responseDescription ='SUCCESS';
            response.userFriendlyMessage ='Products Retrieved successfully';
            response.numberOfRecords = products.size();
            response.products = new List<GetProductsResponse>();
            for(Hackathon_Product__c product : products){
                response.products.add(GetProductsResponse.ConvertFrom(product));
            }
        }else{
            response.responseCode ='404';
            response.responseDescription = 'NOT FOUND';
            response.userFriendlyMessage ='NO Products Exists in the database';
        }

        return response;
    }



}
