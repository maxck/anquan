public class RestServiceUtil {
    
    public static InspectionRequestParam parseInspectionRequest(String requestXML)
    {
        InspectionRequestParam ReuqestParam = new InspectionRequestParam();
        Result tempResult = new Result();
        try{
            XmlStreamReader reader = new XmlStreamReader(requestXML);
            while(reader.hasNext())
            {   
                //公开报价单价
                try{
                    if(reader.getLocalName() == 'QA')
                    {
                        reader.next();
                        if(String.isNotBlank(reader.getText()))
                        {
                            ReuqestParam.QA = String.valueof(reader.getText());
                        }
                    }
                }catch(Exception e){
                    system.debug('parse Inspection Request xml Exception info is' + e);
                }
                
                try{
                    if(reader.getLocalName() == 'InspectionCode')
                    {
                        reader.next();
                        if(String.isNotBlank(reader.getText()))
                        {
                            ReuqestParam.InspectionCode = String.valueof(reader.getText());
                        }
                    }
                }catch(Exception e){
                    system.debug('parse Inspection Request xml Exception info is' + e);
                }
                
                reader.next();
                
            }
            tempResult.message = '验证通过';
            tempResult.success = true;
            ReuqestParam.result = tempResult;    
        }
        catch (Exception e) {
            system.debug('parse product request xml Exception info is' + e);
            tempResult.message = '验证失败：' + e;
            tempResult.success = false;
            ReuqestParam.result = tempResult; 
            
            return ReuqestParam;
        }          
        
        return ReuqestParam;
    }
    public class InspectionRequestParam
    {
        public String QA{set;get;}
        public String InspectionCode{set;get;}
        public Result result{set;get;}
    } 
    public class Result
  {
    public Boolean success{set;get;}
    public String message{set;get;}
  }

}