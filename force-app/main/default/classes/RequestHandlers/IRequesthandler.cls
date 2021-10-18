public interface IRequesthandler {
    
    object HandleRequest(string apiRoute ,RestRequest req);
    string getType();

}
