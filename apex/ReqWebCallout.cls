global class ReqWebCallout {
    
    @future (callout=true)
    webservice static void sendRequirement(String reqId){
        SalesRequirement__c syncReq=[SELECT id,name,CRMRQ__c,VKORG__c,EndDate__c,Type__c,
                                     AccountNumber__c,VTWEG__c,PoDate__c,SPART__c 
                                     FROM SalesRequirement__c 
                                     WHERE id=:reqId];
        String msg1 = '';
        String msg2 = '';
        String username = 'piuser';
        String password = '1qaz2wsx';
        String testBody = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://hbaqjt.cn/CRM">'+
            '<soapenv:Header/>'+
            '<soapenv:Body>'+
            '<crm:MT_CRM_SD003_REQ>'+
            '<T_REQ>'+
            '<CRMRQ>'+
            '?'+
            '</CRMRQ>'+
            '<VBTYP>'+
            '?'+
            '</VBTYP>'+
            '<VKORG>'+
            '?'+
            '</VKORG>'+
            '<VTWEG>'+
            '?'+
            '</VTWEG>'+
            '<SPART>'+
            '?'+
            '</SPART>'+
            '<KUNNR>'+
            '?'+
            '</KUNNR>'+
            '<AUDAT>'+
            '?'+
            '</AUDAT>'+
            '<VDATU>'+
            '?'+
            '</VDATU>'+
            '</T_REQ>'+
            '</crm:MT_CRM_SD003_REQ>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';
        System.debug(testBody);
        //Construct HTTP request and response
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username+':'+password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','text/xml');
        
        //Set Method and Endpoint and Body
        req.setMethod('POST');  
        req.setEndpoint('http://123.183.162.85:51000/XISOAPAdapter/MessageServlet?senderParty=&senderService=BC_CRM&receiverParty=&receiverService=&interface=SI_CRM_SD003_SYNC_out&interfaceNamespace=http://hbaqjt.cn/CRM');
        
        req.setBody(testBody);
        System.debug('Request Body: ' + testBody); 
        try {
            //Send endpoint 
            res = http.send(req);
            System.debug('Response Body: '+res.getBody());
            
            XmlStreamReader reader = new XmlStreamReader(res.getBody());
            SalesRequirement__c sq=new SalesRequirement__c();
            sq.Id=reqId;
                        
            boolean isSafeToGetNextXmlElement = true;
            while(isSafeToGetNextXmlElement) {
                
                if (reader.getEventType() == XmlTag.END_ELEMENT 
                    && reader.getLocalName() == 'INFO') {
                        break;
                    }
                
                if(reader.getLocalName() == 'TYPE'){
                    reader.next();
                    msg1=reader.getText();
                    while(reader.isStartElement()!= true){ 
                        reader.nextTag();
                    }
                }
                                               
                if(reader.getLocalName() == 'MESSAGE'){
                    reader.next();
                    msg2=reader.getText();
                    while(reader.isEndElement()!= true){ 
                        reader.nextTag();
                    }
                }
                if (reader.hasNext()) {
                    reader.next();
                } else {
                    isSafeToGetNextXmlElement = false;
                    break;
                }
            }
            sq.SyncMessage__c=msg1+msg2;
            System.debug('Response msg is: '+sq);
            upsert sq;
            
        } catch(System.CalloutException e) {
            System.debug('Exception: '+e);
        }
    }
    
}