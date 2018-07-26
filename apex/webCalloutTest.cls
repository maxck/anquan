@isTest
private class webCalloutTest {
     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        Date d=Date.newInstance(2018, 06, 30);
        Product2 p=new Product2(name='test',VKORG__c='1000',
                                KUNNR__c='3333321312',PRSDT__c=d,
                                MATNR__c='000000400000000568',PLTYP__c='02',SyncMessage__c='',
                                ProductCoding__c='',Supplyprice__c=0,
                                kcdw__c='',KMEIN__c='');
        insert p;
        System.debug('test product:'+p); 
        
        Test.startTest();
        webCallout.sendNotification(p.Id);
        Test.stopTest();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://123.183.162.85:51000/XISOAPAdapter/MessageServlet?senderParty=&senderService=BC_CRM&receiverParty=&receiverService=&interface=SI_CRM_SD001_SYNC_out&interfaceNamespace=http://hbaqjt.cn/CRM');
        req.setMethod('POST');
        Http h = new Http();
        //HttpResponse res =h.send(req);
        MockHttpResponseGenerator mock = new MockHttpResponseGenerator();
        HttpResponse res = mock.respond(req);
        // Verify response received contains fake values
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'text/xml');
        String actualValue = res.getBody();
        String expectedValue = '<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/"><SOAP:Header/><SOAP:Body xmlns:crm="http://hbaqjt.cn/CRM"><ns0:MT_CRM_SD001_CRM_RES xmlns:ns0="http://hbaqjt.cn/CRM"><RESULT><ProductCoding__c>000000400000000568</ProductCoding__c><PLTYP__c>02</PLTYP__c><Supplyprice__c>234.56</Supplyprice__c><kcdw__c>CNY</kcdw__c><KMEIN__c>M2</KMEIN__c><DATAB__c>20180630</DATAB__c><DATBI__c>20180701</DATBI__c></RESULT></ns0:MT_CRM_SD001_CRM_RES></SOAP:Body></SOAP:Envelope>';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode()); 

    }
}