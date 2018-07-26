public class WorkManagementController {
    
    public String currentId='';
    public MerchantsManagementProcess__c manage{get;set;}
    public List<KeyWork__c> keywork{get;set;}
    public date start{get;set;}
    public date endtime{get;set;}
    public String comment{get;set;}
    public date start1{get;set;}
    public date endtime1{get;set;}
    public String comment1{get;set;}
    public date start2{get;set;}
    public date endtime2{get;set;}
    public String comment2{get;set;}
    
    
    public WorkManagementController(ApexPages.StandardController controller){
        currentId=controller.getId();
        System.debug('currentId: '+currentId);
        MerchantsManagementProcess__c currentManage=[select id,jdmc__c,StageCode__c,gjgz__c,task1__c,task2__c,task3__c,task4__c,task5__c,task6__c,task7__c,task8__c,
                                                     task9__c,task10__c,task11__c,task12__c,task13__c,Comment__c from MerchantsManagementProcess__c where id=:currentId];
        manage=currentManage;
        keywork=[Select Id,Name,taskName__c,workStage__c,AddtionalComment__c,
                  StartTime__c,EndTime__c,MerchantsInfo__c
                  FROM KeyWork__c where MerchantsInfo__c=:currentId];
      
        
               
    }
    
    public PageReference Next(){
        
        if(manage.jdmc__c=='电话咨询/主动招募'&&manage.task1__c==true&&manage.task2__c==true){
            manage.jdmc__c='提交申请材料';
            KeyWork__c kw=new KeyWork__c();
            KeyWork__c kw1=new KeyWork__c();
            kw.workStage__c='电话咨询/主动招募';
            kw.taskName__c='产品优势介绍';
            kw.StartTime__c=start;
            kw.EndTime__c=endtime;
            kw.AddtionalComment__c=comment;
            kw.MerchantsInfo__c=currentId;
            insert kw;
            kw1.workStage__c='电话咨询/主动招募';
            kw1.taskName__c='加盟商准入标准介绍';
            kw1.StartTime__c=start1;
            kw1.EndTime__c=endtime1;
            kw1.AddtionalComment__c=comment1;
            kw1.MerchantsInfo__c=currentId;
            insert kw1;
           
        }else if(manage.jdmc__c=='提交申请材料'&&manage.task3__c==true){
            manage.jdmc__c='材料审核';
            KeyWork__c kw=new KeyWork__c();
            kw.workStage__c='提交申请材料';
            kw.taskName__c='潜在加盟商根据标准提交申请材料';
            kw.StartTime__c=start;
            kw.EndTime__c=endtime;
            kw.AddtionalComment__c=comment;
            kw.MerchantsInfo__c=currentId;
            insert kw;
            
        }else if(manage.jdmc__c=='材料审核'&&manage.task4__c==true){
            manage.jdmc__c='实地考察';
            KeyWork__c kw=new KeyWork__c();
            kw.workStage__c='材料审核';
            kw.taskName__c='潜在加盟商资料核实与评审';
            kw.StartTime__c=start;
            kw.EndTime__c=endtime;
            kw.AddtionalComment__c=comment;
            kw.MerchantsInfo__c=currentId;
            insert kw;
        }else if(manage.jdmc__c=='实地考察'&&manage.task5__c==true){
            manage.jdmc__c='确定加盟商准入';
            KeyWork__c kw=new KeyWork__c();
            kw.workStage__c='实地考察';
            kw.taskName__c='大区经理到潜在加盟商现场考察经营条件和状况等';
            kw.StartTime__c=start;
            kw.EndTime__c=endtime;
            kw.AddtionalComment__c=comment;
            kw.MerchantsInfo__c=currentId;
            insert kw;
           
        }else if(manage.jdmc__c=='确定加盟商准入'&&manage.task6__c==true&&manage.task7__c==true){
            manage.jdmc__c='新店选址';
            KeyWork__c kw=new KeyWork__c();
            kw.workStage__c='确定加盟商准入';
            kw.taskName__c='发布入选通知';
            kw.StartTime__c=start;
            kw.EndTime__c=endtime;
            kw.AddtionalComment__c=comment;
            kw.MerchantsInfo__c=currentId;
            insert kw;
            KeyWork__c kw1=new KeyWork__c();
            kw1.workStage__c='确定加盟商准入';
            kw1.taskName__c='签订加盟合同';
            kw1.StartTime__c=start;
            kw1.EndTime__c=endtime;
            kw1.AddtionalComment__c=comment;
            kw1.MerchantsInfo__c=currentId;
            insert kw1;
            
           
        }else if(manage.jdmc__c=='新店选址'){
            manage.jdmc__c='展厅设计及装修';
        }else if(manage.jdmc__c=='展厅设计及装修'&&manage.task8__c==true&&manage.task9__c==true&&manage.task10__c==true){
            manage.jdmc__c='选购样窗';
            KeyWork__c kw=new KeyWork__c();
            kw.workStage__c='展厅设计及装修';
            kw.taskName__c='设计平面布局图';
            kw.StartTime__c=start;
            kw.EndTime__c=endtime;
            kw.AddtionalComment__c=comment;
            kw.MerchantsInfo__c=currentId;
            insert kw;
            KeyWork__c kw1=new KeyWork__c();
            kw1.workStage__c='展厅设计及装修';
            kw1.taskName__c='立面效果图';
            kw1.StartTime__c=start;
            kw1.EndTime__c=endtime;
            kw1.AddtionalComment__c=comment;
            kw1.MerchantsInfo__c=currentId;
            insert kw1;
            KeyWork__c kw2=new KeyWork__c();
            kw2.workStage__c='展厅设计及装修';
            kw2.taskName__c='施工图';
            kw2.StartTime__c=start;
            kw2.EndTime__c=endtime;
            kw2.AddtionalComment__c=comment;
            kw2.MerchantsInfo__c=currentId;
            insert kw2;
           
            
        }else if(manage.jdmc__c=='选购样窗'&&manage.task11__c==true&&manage.task12__c==true&&manage.task13__c==true){
            manage.jdmc__c='新店开业前培训';
            KeyWork__c kw=new KeyWork__c();
            kw.workStage__c='选购样窗';
            kw.taskName__c='缴纳样窗费用';
            kw.StartTime__c=start;
            kw.EndTime__c=endtime;
            kw.AddtionalComment__c=comment;
            kw.MerchantsInfo__c=currentId;
            insert kw;
            KeyWork__c kw1=new KeyWork__c();
            kw1.workStage__c='选购样窗';
            kw1.taskName__c='样窗生产';
            kw1.StartTime__c=start;
            kw1.EndTime__c=endtime;
            kw1.AddtionalComment__c=comment;
            kw1.MerchantsInfo__c=currentId;
            insert kw1;
            KeyWork__c kw2=new KeyWork__c();
            kw2.workStage__c='选购样窗';
            kw2.taskName__c='运输及安装';
            kw2.StartTime__c=start;
            kw2.EndTime__c=endtime;
            kw2.AddtionalComment__c=comment;
            kw2.MerchantsInfo__c=currentId;
            insert kw2;
          
        }else if(manage.jdmc__c=='新店开业前培训'){
            manage.jdmc__c='开业';
        }
        try
        {
            Database.upsert(manage,MerchantsManagementProcess__c.Fields.Id);            
        }
        catch (Exception e)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'保存数据报错，请将错误信息发送至系统管理员：' + e));
            return null;
        } 
        
        PageReference acctPage = new Pagereference('/apex/vf1?id=' + currentId);
        acctPage.setRedirect(true);
        return acctPage;
    }
    
}