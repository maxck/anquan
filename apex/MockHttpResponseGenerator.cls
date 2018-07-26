@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('http://123.183.162.85:51000/XISOAPAdapter/MessageServlet?senderParty=&senderService=BC_CRM&receiverParty=&receiverService=&interface=SI_CRM_SD001_SYNC_out&interfaceNamespace=http://hbaqjt.cn/CRM', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'text/xml');
        res.setBody('<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/"><SOAP:Header/><SOAP:Body xmlns:crm="http://hbaqjt.cn/CRM"><ns0:MT_CRM_SD001_CRM_RES xmlns:ns0="http://hbaqjt.cn/CRM"><RESULT><ProductCoding__c>000000400000000568</ProductCoding__c><PLTYP__c>02</PLTYP__c><Supplyprice__c>234.56</Supplyprice__c><kcdw__c>CNY</kcdw__c><KMEIN__c>M2</KMEIN__c><DATAB__c>20180630</DATAB__c><DATBI__c>20180701</DATBI__c></RESULT></ns0:MT_CRM_SD001_CRM_RES></SOAP:Body></SOAP:Envelope>');
        res.setStatusCode(200);
        return res;
    }
}