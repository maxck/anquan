global class CustomerPatrolingService {

    @future(callout=true)
    public static void sendToOA(String serviceId){
        //客户巡检记录编号（Name），所有人(Owner)，客户名称(CustomerName__c)，联系人(lxrrw__c)
        //巡检开始时间(xjkssj__c)，联系电话(ContactNumber__c)，巡检结束时间(xjjs__c)
        //地址(Address__c)，客户巡检阶段(khxklc__c)，巡检方式(InspectionMode__c)
        //所属分公司(SubsidiaryCompany__c)，客户使用我厂产品情况(cpqk__c)，有无发现发错货物情况(CasefWrongGoods__c)
        //有无出现服务态度不好情况(ServiceAttitude__c)，有无出现问题处理不尽心情况(Unconscientious__c)
        //公司其他服务情况(ServiceSituation__c)，近期有无出现质量问题(QualityProblem__c)
        //近期产品有无包装破损运输问题(PackagingBreakage__c)，包装数量有无缺少(QuantityOfPacking__c)
        //其他质量情况(OtherQualityConditions__c)，有无出现因使用我公司产品直接导致的不良品情况(AdverseProductSituation__c)
        //有无出现因使用我公司产品间接导致的不良品情况(IndirectAdverseProductSituation__c)，有无出现产品与设备的不适应情况(NonAdaptation__c)
        //其他使用情况说明(qtsyqk__c),意见和建议(OpinionsAndSuggestions__c)，QA质量改善对策(QA__c)，备注(Remarks__c)
        CustomerInspectionRecords__c cis=[SELECT id,Name,Owner.Name,CustomerName__c,CustomerName__r.Name,lxrrw__c,lxrrw__r.Name,xjkssj__c,ContactNumber__c,
                                          xjjs__c,Address__c,khxklc__c,InspectionMode__c,SubsidiaryCompany__c,
                                          cpqk__c,CasefWrongGoods__c,ServiceAttitude__c,Unconscientious__c,ServiceSituation__c,
                                          QualityProblem__c,PackagingBreakage__c,QuantityOfPacking__c,OtherQualityConditions__c,
                                          AdverseProductSituation__c,IndirectAdverseProductSituation__c,NonAdaptation__c,
                                          qtsyqk__c,OpinionsAndSuggestions__c,QA__c,Remarks__c,SyncMessage__c FROM CustomerInspectionRecords__c
                                          where id=:serviceId];
        String userName='crm';
        String Password='crm123456';
        String subject='Request From Salesforce';
    String dataString='<formExport version=\\"2.0\\">'+
            '<summary id=\\"8988987660225758625\\" name=\\"formmain_1687\\"/>'+
            '<definitions/>'+
            '<values>'+
            '<column name=\\"客户巡检记录编号\\">'+
            '<value>'+
            cis.Name+
            '</value>'+
            '</column>'+
            '<column name=\\"所有人\\">'+
            '<value>'+
            cis.Owner.Name+
            '</value>'+
            '</column>'+
            '<column name=\\"客户名称\\">'+
            '<value>'+
            cis.CustomerName__r.Name+
            '</value>'+
            '</column>'+
            '<column name=\\"联系人\\">'+
            '<value>'+
            cis.lxrrw__r.Name+
            '</value>'+
            '</column>'+
            '<column name=\\"巡检开始时间\\">'+
            '<value>'+
            cis.xjkssj__c+
            '</value>'+
            '</column>'+
            '<column name=\\"联系电话\\">'+
            '<value>'+
            cis.ContactNumber__c+
            '</value>'+
            '</column>'+
            '<column name=\\"巡检结束时间\\">'+
            '<value>'+
            cis.xjjs__c+
            '</value>'+
            '</column>'+
            '<column name=\\"地址\\">'+
            '<value>'+
            cis.Address__c+
            '</value>'+
            '</column>'+
            '<column name=\\"客户巡检阶段\\">'+
            '<value>'+
            cis.khxklc__c+
            '</value>'+
            '</column>'+
            '<column name=\\"巡检方式\\">'+
            '<value>'+
            cis.InspectionMode__c+
            '</value>'+
            '</column>'+
            '<column name=\\"所属分公司\\">'+
            '<value>'+
            cis.SubsidiaryCompany__c+
            '</value>'+
            '</column>'+
            '<column name=\\"客户使用我厂产品情况\\">'+
            '<value>'+
            cis.cpqk__c+
            '</value>'+
            '</column>'+
            '<column name=\\"有无出现发错货物情况\\">'+
            '<value>'+
            cis.CasefWrongGoods__c+
            '</value>'+
            '</column>'+
            '<column name=\\"有无出现服务态度不好情况\\">'+
            '<value>'+
            cis.ServiceAttitude__c+
            '</value>'+
            '</column>'+
            '<column name=\\"有无出现问题处理不尽心情况\\">'+
            '<value>'+
            cis.Unconscientious__c+
            '</value>'+
            '</column>'+
            '<column name=\\"公司其他服务情况\\">'+
            '<value>'+
            cis.ServiceSituation__c+
            '</value>'+
            '</column>'+
            '<column name=\\"近期有无出现质量问题\\">'+
            '<value>'+
            cis.QualityProblem__c+
            '</value>'+
            '</column>'+
            '<column name=\\"近期产品有无包装破损运输问题\\">'+
            '<value>'+
            cis.PackagingBreakage__c+
            '</value>'+
            '</column>'+
            '<column name=\\"包装数量有无缺少\\">'+
            '<value>'+
            cis.QuantityOfPacking__c+
            '</value>'+
            '</column>'+
            '<column name=\\"其他质量情况\\">'+
            '<value>'+
            cis.OtherQualityConditions__c+
            '</value>'+
            '</column>'+
            '<column name=\\"有无出现因使用我公司产品直接导致的不良品情况\\">'+
            '<value>'+
            cis.AdverseProductSituation__c+
            '</value>'+
            '</column>'+
            '<column name=\\"有无出现因使用我公司产品间接导致的不良品情况\\">'+
            '<value>'+
            cis.IndirectAdverseProductSituation__c+
            '</value>'+
            '</column>'+
            '<column name=\\"有无出现产品与设备的不适应情况\\">'+
            '<value>'+
            cis.NonAdaptation__c+
            '</value>'+
            '</column>'+
            '<column name=\\"其他使用情况说明\\">'+
            '<value>'+
            cis.qtsyqk__c+
            '</value>'+
            '</column>'+
            '<column name=\\"意见和建议\\">'+
            '<value>'+
            cis.OpinionsAndSuggestions__c+
            '</value>'+
            '</column>'+
            '<column name=\\"QA质量改善对策\\">'+
            '<value>'+
            cis.QA__c+
            '</value>'+
            '</column>'+
            '<column name=\\"备注\\">'+
            '<value>'+
            cis.Remarks__c+
            '</value>'+
            '</column>'+
            '</values>'+
            '<subForms/>'+
            '</formExport>';
        String PostBody='{'+   
    '\"senderLoginName\":'+'\"'+username+'\"'+',' + '\"subject\":'+'\"'+subject+'\"'+','+
    '\"data\":' +'\"'+datastring+'\"'+
    '}';
        HttpRequest req =new HttpRequest();
        HttpResponse res=new HttpResponse();
        Http h1=new Http();
        req.setHeader('Content-Type','application/json'); 
        req.setHeader('token', LoginToOA.loginOA());
        req.setMethod('POST');  
        req.setEndpoint('http://123.183.162.85:8888/seeyon/rest/flow/KHXJJLD');        
        req.setBody(PostBody);
        System.debug('Response -->' + PostBody);
        try{
            res = h1.send(req);
            System.debug('response: '+res.getBody());
            Upsert new CustomerInspectionRecords__c(id=serviceId,SyncMessage__c='传输至OA: '+res.getBody());
            
        }catch(System.CalloutException e){
            System.debug('The exception is : ' + e);
        }
    }
}