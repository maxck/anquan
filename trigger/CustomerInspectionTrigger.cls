trigger CustomerInspectionTrigger on CustomerInspectionRecords__c (After insert,After update) {
  for(CustomerInspectionRecords__c newcis : Trigger.new) 
    {
        if (Trigger.isUpdate)
        {   
            CustomerInspectionRecords__c oldcis = Trigger.oldMap.get(newcis.Id);
            if (oldcis.khxklc__c != newcis.khxklc__c && newcis.khxklc__c == '发现质量问题')
            {
                CustomerPatrolingService.sendToOA(newcis.Id);
            }
        }
    }
}