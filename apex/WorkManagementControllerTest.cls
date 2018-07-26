/**
* test for NewConfigrationList
 */
@isTest(SeeAlldata=true)
private class WorkManagementControllerTest {

    static testMethod void myUnitTest() {

        // first - what user profile are they?
        Profile p = [select id from Profile limit 1];
        system.assert(p.id != null);

        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';

        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',

        UserName=uniqueUserName);
        //system.assert(u.id != null);

        //**---------  create test data ---------------------**//
        // create test data



        system.runAs(u){

        Account a1  =  new Account() ;
        a1.Name = 'test1230';
       // a1.city__c = '福州市';
        a1.province__c = '福建省';
      //  a1.Cunty__c = '1' ;
        //a1.LegalRepresentative__c = '1';
      //  a1.Duty__c = '1' ;
       // a1.ContactNumber__c = '123';
       // a1.Gender__c = '男';
        insert a1 ;

        //set opportunity
        Opportunity  opp = new Opportunity();
        opp.AccountId = a1.Id;
       // opp.FinalCustomer__c = a1.Id;
        opp.StageName = '潜在阶段';
        //opp.ProcurementMethod__c = '院内采购';
        //opp.BusinessSource__c = '渠道';
        opp.Name = 'Test Opportunity';
        opp.CloseDate = date.today();
        insert opp;

        MerchantsManagementProcess__c mm=new MerchantsManagementProcess__c();
        mm.jdmc__c='电话咨询/主动招募';
      /*  mm.jdmc__c='提交申请材料';
        mm.jdmc__c='材料审核';
        mm.jdmc__c='实地考察';
        mm.jdmc__c='确定加盟商准入';    
        mm.jdmc__c='新店选址';
        mm.jdmc__c='展厅设计及装修';
        mm.jdmc__c='选购样窗';
        mm.jdmc__c='新店开业前培训';
        mm.jdmc__c='开业';*/
        mm.task1__c=true;
        mm.task2__c=true;
        mm.task3__c=true;
        mm.task4__c=true;
        mm.task5__c=true;
        mm.task6__c=true;
        mm.task7__c=true;
        mm.task8__c=true;
        mm.task9__c=true;
        mm.task10__c=true;
        mm.task11__c=true;
        mm.task12__c=true;
        mm.task13__c=true;
        insert mm;
        
        MerchantsManagementProcess__c mm2=new MerchantsManagementProcess__c();
      //  mm.jdmc__c='电话咨询/主动招募';
        mm2.jdmc__c='材料审核';
       /* 
        mm.jdmc__c='实地考察';
        mm.jdmc__c='确定加盟商准入';    
        mm.jdmc__c='新店选址';
        mm.jdmc__c='展厅设计及装修';
        mm.jdmc__c='选购样窗';
        mm.jdmc__c='新店开业前培训';
        mm.jdmc__c='开业';*/
        
        mm2.task3__c=true;
        mm2.task4__c=true;
        mm2.task5__c=true;
        mm2.task6__c=true;
        mm2.task7__c=true;
        mm2.task8__c=true;
        mm2.task9__c=true;
        mm2.task10__c=true;
        mm2.task11__c=true;
        mm2.task12__c=true;
        mm2.task13__c=true;
        insert mm2;
        
        
        MerchantsManagementProcess__c mm1=new MerchantsManagementProcess__c();
      //  mm.jdmc__c='电话咨询/主动招募';
        mm1.jdmc__c='提交申请材料';
       /* mm.jdmc__c='材料审核';
        mm.jdmc__c='实地考察';
        mm.jdmc__c='确定加盟商准入';    
        mm.jdmc__c='新店选址';
        mm.jdmc__c='展厅设计及装修';
        mm.jdmc__c='选购样窗';
        mm.jdmc__c='新店开业前培训';
        mm.jdmc__c='开业';*/
        
        mm1.task3__c=true;
        mm1.task4__c=true;
        mm1.task5__c=true;
        mm1.task6__c=true;
        mm1.task7__c=true;
        mm1.task8__c=true;
        mm1.task9__c=true;
        mm1.task10__c=true;
        mm1.task11__c=true;
        mm1.task12__c=true;
        mm1.task13__c=true;
        insert mm1;
        
        MerchantsManagementProcess__c mm3=new MerchantsManagementProcess__c();
      //  mm.jdmc__c='电话咨询/主动招募';
        //mm1.jdmc__c='提交申请材料';
       /* mm.jdmc__c='材料审核';
        
        mm.jdmc__c='确定加盟商准入';    
        mm.jdmc__c='新店选址';
        mm.jdmc__c='展厅设计及装修';
        mm.jdmc__c='选购样窗';
        mm.jdmc__c='新店开业前培训';
        mm.jdmc__c='开业';*/
        mm3.jdmc__c='实地考察';
        mm3.task3__c=true;
        mm3.task4__c=true;
        mm3.task5__c=true;
        mm3.task6__c=true;
        mm3.task7__c=true;
        mm3.task8__c=true;
        mm3.task9__c=true;
        mm3.task10__c=true;
        mm3.task11__c=true;
        mm3.task12__c=true;
        mm3.task13__c=true;
        insert mm3;
        
        MerchantsManagementProcess__c mm4=new MerchantsManagementProcess__c();
      //  mm.jdmc__c='电话咨询/主动招募';
        //mm1.jdmc__c='提交申请材料';
       /* mm.jdmc__c='材料审核';
        
            
        mm.jdmc__c='新店选址';
        mm.jdmc__c='展厅设计及装修';
        mm.jdmc__c='选购样窗';
        mm.jdmc__c='新店开业前培训';
        mm.jdmc__c='开业';*/
        //mm3.jdmc__c='实地考察';
        mm4.jdmc__c='确定加盟商准入';
        mm4.task3__c=true;
        mm4.task4__c=true;
        mm4.task5__c=true;
        mm4.task6__c=true;
        mm4.task7__c=true;
        mm4.task8__c=true;
        mm4.task9__c=true;
        mm4.task10__c=true;
        mm4.task11__c=true;
        mm4.task12__c=true;
        mm4.task13__c=true;
        insert mm4;
        
         MerchantsManagementProcess__c mm6=new MerchantsManagementProcess__c();
      //  mm.jdmc__c='电话咨询/主动招募';
        //mm1.jdmc__c='提交申请材料';
       /* mm.jdmc__c='材料审核';
        
            
        mm.jdmc__c='新店选址';
        mm.jdmc__c='展厅设计及装修';
        
        mm.jdmc__c='新店开业前培训';
        mm.jdmc__c='开业';*/
        //mm3.jdmc__c='实地考察';
        //mm5.jdmc__c='确定加盟商准入';
        mm6.jdmc__c='选购样窗';
        mm6.task3__c=true;
        mm6.task4__c=true;
        mm6.task5__c=true;
        mm6.task6__c=true;
        mm6.task7__c=true;
        mm6.task8__c=true;
        mm6.task9__c=true;
        mm6.task10__c=true;
        mm6.task11__c=true;
        mm6.task12__c=true;
        mm6.task13__c=true;
        insert mm6;
        
            MerchantsManagementProcess__c mm5=new MerchantsManagementProcess__c();
      //  mm.jdmc__c='电话咨询/主动招募';
        //mm1.jdmc__c='提交申请材料';
       /* mm.jdmc__c='材料审核';
        
            
        mm.jdmc__c='新店选址';
        
        
        mm.jdmc__c='新店开业前培训';
        mm.jdmc__c='开业';*/
        //mm3.jdmc__c='实地考察';
        //mm5.jdmc__c='确定加盟商准入';
        //mm5.jdmc__c='选购样窗';
        mm5.jdmc__c='展厅设计及装修';
        mm5.task3__c=true;
        mm5.task4__c=true;
        mm5.task5__c=true;
        mm5.task6__c=true;
        mm5.task7__c=true;
        mm5.task8__c=true;
        mm5.task9__c=true;
        mm5.task10__c=true;
        mm5.task11__c=true;
        mm5.task12__c=true;
        mm5.task13__c=true;
        insert mm5;
            
            
            
            PageReference pageRef = Page.vf1; // Add your VF page Name here
      pageRef.getParameters().put('currentId', mm.Id);
            Test.setCurrentPage(pageRef);
           // MerchantsManagementProcess__c cfg=new MerchantsManagementProcess__c(name='test');
            ApexPages.StandardController sc=new ApexPages.StandardController(mm);
            WorkManagementController con=new WorkManagementController(sc);
            //System.assert(con!=null);
         //Test.startTest();
            Date d1=con.start;
            Date d2=con.endtime;
            
            con.comment='ok';
            con.Next();
        
        
        //Test.stopTest();
            PageReference pageRef1 = Page.vf1; // Add your VF page Name here
      pageRef1.getParameters().put('currentId', mm1.Id);
            Test.setCurrentPage(pageRef1);
           // MerchantsManagementProcess__c cfg=new MerchantsManagementProcess__c(name='test');
            ApexPages.StandardController sc1=new ApexPages.StandardController(mm1);
            WorkManagementController con1=new WorkManagementController(sc);
            //System.assert(con!=null);
         //Test.startTest();
            con1.Next();
      
            PageReference pageRef2 = Page.vf1; // Add your VF page Name here
      pageRef2.getParameters().put('currentId', mm2.Id);
            Test.setCurrentPage(pageRef2);
           // MerchantsManagementProcess__c cfg=new MerchantsManagementProcess__c(name='test');
            ApexPages.StandardController sc2=new ApexPages.StandardController(mm2);
            WorkManagementController con2=new WorkManagementController(sc);
            
            //System.assert(con!=null);
         //Test.startTest();
            con2.Next();
        //}
           PageReference pageRef3 = Page.vf1; // Add your VF page Name here
      pageRef3.getParameters().put('currentId', mm3.Id);
            Test.setCurrentPage(pageRef3);
           // MerchantsManagementProcess__c cfg=new MerchantsManagementProcess__c(name='test');
            ApexPages.StandardController sc3=new ApexPages.StandardController(mm3);
            WorkManagementController con3=new WorkManagementController(sc);
            //System.assert(con!=null);
         //Test.startTest();
            con3.Next();
        
        PageReference pageRef4 = Page.vf1; // Add your VF page Name here
      pageRef4.getParameters().put('currentId', mm4.Id);
            Test.setCurrentPage(pageRef4);
           // MerchantsManagementProcess__c cfg=new MerchantsManagementProcess__c(name='test');
            ApexPages.StandardController sc4=new ApexPages.StandardController(mm3);
            WorkManagementController con4=new WorkManagementController(sc);
            //System.assert(con!=null);
         //Test.startTest();
            con4.Next();
        PageReference pageRef5 = Page.vf1; // Add your VF page Name here
      pageRef5.getParameters().put('currentId', mm5.Id);
            Test.setCurrentPage(pageRef5);
           // MerchantsManagementProcess__c cfg=new MerchantsManagementProcess__c(name='test');
            ApexPages.StandardController sc5=new ApexPages.StandardController(mm5);
            WorkManagementController con5=new WorkManagementController(sc);
            //System.assert(con!=null);
         //Test.startTest();
            con5.Next();
            PageReference pageRef6 = Page.vf1; // Add your VF page Name here
      pageRef6.getParameters().put('currentId', mm6.Id);
            Test.setCurrentPage(pageRef6);
           // MerchantsManagementProcess__c cfg=new MerchantsManagementProcess__c(name='test');
            ApexPages.StandardController sc6=new ApexPages.StandardController(mm6);
            WorkManagementController con6=new WorkManagementController(sc);
            //System.assert(con!=null);
         //Test.startTest();
            con6.Next();
        }
    }
}