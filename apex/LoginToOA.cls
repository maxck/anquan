global class LoginToOA {
    
    @future(callout=true)
    public static void getSessionId()
    {
      loginOA();
    }
    
    public static String loginOA(){  
        String sessionId= '';
        String username = 'crm';
        String password = 'crm123456';
        String jsonstring = '{"userName":"'+username+'","'+'password":"'+password+'"}';
        HttpRequest req =new HttpRequest();
        HttpResponse res=new HttpResponse();
        Http h1=new Http();
        req.setHeader('Content-Type','application/json');
        
        req.setMethod('POST');  
        req.setEndpoint('http://123.183.162.85:8888/seeyon/rest/token');
        
        req.setBody(jsonstring);
        System.debug('Response -->' + jsonstring);
        try{
            res = h1.send(req);
            System.debug('response: '+res.getBody());
            JSONParser parser = JSON.createParser(res.getBody());
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
                        if(parser.getText()=='id'){
                            parser.nextToken();
                            sessionId= parser.getText();
                            break;
                        }
                }
            }
            System.debug('sessionId is : '+sessionId);
                }catch(System.CalloutException e){
                    System.debug('The exception is : '+e);
                }
          return sessionId;
            } 
        }