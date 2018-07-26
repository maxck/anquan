global class webCallout {
    
    @future (callout=true)
    webservice static void sendNotification(String Product2id) {
        Product2 syncProduct2=[SELECT id,name,VKORG__c,KUNNR__c,PRSDT__c,MATNR__c,PLTYP__c,SyncMessage__c,
                               ProductCoding__c,Supplyprice__c,
                               kcdw__c,KMEIN__c,
                               ExternalId FROM Product2 
                               WHERE id=:Product2id];
        String username = 'piuser';
        String password = '1qaz2wsx';
        String testBody = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://hbaqjt.cn/CRM">' + 
            '<soapenv:Header/>' +
            '<soapenv:Body>' +
            '<crm:MT_CRM_SD001_CRM_REQ>' +
            '<VKORG__c>' +
            syncProduct2.VKORG__c +
            '</VKORG__c>' +  
            '<KUNNR__c>'+
            syncProduct2.KUNNR__c +
            '</KUNNR__c>' + 
            '<PRSDT__c>' + 
            String.valueOf(syncProduct2.PRSDT__c).replace('-','')+
            '</PRSDT__c>' +
            '<PLTYP__c>' +
            syncProduct2.PLTYP__c+
            '</PLTYP__c>'+
            '<MATNR__c>'+
            syncProduct2.MATNR__c+
            '</MATNR__c>' + 
            '</crm:MT_CRM_SD001_CRM_REQ>' + 
            '</soapenv:Body>' + 
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
        req.setEndpoint('http://123.183.162.85:51000/XISOAPAdapter/MessageServlet?senderParty=&senderService=BC_CRM&receiverParty=&receiverService=&interface=SI_CRM_SD001_SYNC_out&interfaceNamespace=http://hbaqjt.cn/CRM');
        
        req.setBody(testBody);
        System.debug('VKORG -->' + testBody); 
        try {
            //Send endpoint 
            res = http.send(req);
            System.debug('response: '+res.getBody());
            
            XmlStreamReader reader = new XmlStreamReader(res.getBody());
            Product2 pd2=new Product2();
            pd2.Id=Product2id;
            pd2.SyncMessage__c=String.valueOf(res.getBody());
            
            boolean isSafeToGetNextXmlElement = true;
            while(isSafeToGetNextXmlElement) {
                
                if (reader.getEventType() == XmlTag.END_ELEMENT 
                    && reader.getLocalName() == 'RESULT') {
                        break;
                    }
                
                if(reader.getLocalName() == 'ProductCoding__c'){
                    reader.next();
                    pd2.ProductCoding__c=reader.getText();
                    while(reader.isStartElement()!= true){ 
                        reader.nextTag();
                    }
                }
                
                if(reader.getLocalName() == 'PLTYP__c'){
                    reader.next();
                    pd2.PLTYP__c=reader.getText();
                    while(reader.isStartElement()!= true){ 
                        reader.nextTag();
                    }
                }
                
                if(reader.getLocalName() == 'Supplyprice__c'){
                    reader.next();
                    pd2.Supplyprice__c=Decimal.valueOf(reader.getText().trim());
                    while(reader.isStartElement()!= true){ 
                        reader.nextTag();
                    }
                    
                }
                
                if(reader.getLocalName() == 'kcdw__c'){
                    reader.next();
                    pd2.kcdw__c=reader.getText();
                    while(reader.isStartElement()!= true){ 
                        reader.nextTag();
                    }
                }
                
                if(reader.getLocalName() == 'KMEIN__c'){
                    reader.next();
                    pd2.KMEIN__c = reader.getText();
                    while(reader.isStartElement()!= true){ 
                        reader.nextTag();
                    }
                }
                
                if(reader.getLocalName() == 'DATAB__c'){
                    reader.next();
                    pd2.DATAB__c=reader.getText();
                    while(reader.isStartElement()!= true){ 
                        reader.nextTag();
                    }
                }
                             
                if(reader.getLocalName() == 'DATBI__c'){
                    reader.next();
                    pd2.DATBI__c=reader.getText();
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
            System.debug('Product string is: '+pd2);
            upsert pd2;
            
        } catch(System.CalloutException e) {
            System.debug('Exception: '+e);
        }
        
    }
    
    
    
}