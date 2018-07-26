public class RestServiceCoreLogic {

    public static RestServiceUtil.Result getInspection(RestServiceUtil.InspectionRequestParam insRequestParam)
    {
        RestServiceUtil.Result result = new RestServiceUtil.Result();

        CustomerInspectionRecords__c cr= new CustomerInspectionRecords__c();
        cr.QA__c=insRequestParam.QA;
        try
        {   
            List<CustomerInspectionRecords__c> existInspects = [select id from CustomerInspectionRecords__c where Name = :insRequestParam.InspectionCode];
            System.debug('insRequestParam.InspectionCode'+insRequestParam.InspectionCode);
            CustomerInspectionRecords__c existInspect;
            if (existInspects.size() > 0)
            {
                existInspect = existInspects.get(0);
                cr.Id = existInspect.Id;
                //cr.QA__c = existInspect.QA__c;
                update cr;
            }
            else
            {
                insert cr;
            
            }
            result.success = true;
            result.message = '信息传输成功。';
        }
        catch(Exception e)
        {
            result.success = false;
            result.message = '信息传输失败：' + e;
        }
        
        return result;
    }
}