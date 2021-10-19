public class RoutingService {
    
    private List<string> keywords =new List<string>{'account','user','login','transactions',
                                                    'user','investments','products' ,'profile','create'};
    
    private map<String,string> routeRegister = new map<String,string>{
        'account/login'=>'AuthHandler',
        'account/create'=>'AuthHandler',
        'transactions/user' =>'TransactionsHandler',
        'profile'=>'UserHandler',
        'investments/user'=>'InvestmentsHandler',
        'products'=>'ProductsHandler'
    };

    
    

    public IRequestHandler GetRequestHandlerAtRoute(string apiroute){
        
        system.debug('old route ' + apiroute);
        List<string> deconstructed = apiroute.split('/');
        string newRoute = '';
        for(string item :deconstructed){
            if(keywords.contains(item)){
                newRoute+= item+'/';
            }
        }
        newRoute = newRoute.removeEnd('/');
        System.debug('new route ' +newRoute);
        try{
            Type t = Type.forName(routeRegister.get(newRoute));
            if(t!= null){
                return (IRequestHandler)t.newInstance();
            }
        }catch(Exception e){
            return new NullRequestHandler();
        }
        return new NullRequestHandler();
      }






}
