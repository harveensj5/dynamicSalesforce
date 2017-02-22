/**********************************************

**********************************************/

public with sharing class dynDisplayOppFldsCtrl 
{

 
    public Opportunity ObjOpp{get;set;}    
    public Boolean open{get;set;}
    
    public dynDisplayOppFldsCtrl()
    {
        ObjOpp = new Opportunity();
    }
    
    
    //open Dyn comp,Save button
    public PageReference displayDynFlds() 
    {
        open = True;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'Please fill dynamic fileds'));
        return null;
    }
    
    //prepare pageBlockSection 
    public Component.Apex.PageBlockSection getDynDetails() 
    {
        Component.Apex.PageBlockSection pgBlckSec = new Component.Apex.PageBlockSection(Title = 'Dynamic Opportunity Fields');
        Component.Apex.InputField fld1 = new Component.Apex.InputField();
        Component.Apex.InputField fld2 = new Component.Apex.InputField();
        Component.Apex.InputField fld3 = new Component.Apex.InputField();
        Component.Apex.InputField fld4 = new Component.Apex.InputField();
        Component.Apex.InputField fld5 = new Component.Apex.InputField();                                
        
            if(ObjOpp.Picklist_A__c == 'a1' && ObjOpp.Picklist_B__c == 'b1')
            {
                fld1.expressions.value = '{!ObjOpp.Customer_Name__c}';
                fld2.expressions.value = '{!ObjOpp.Email_Id__c}';
                fld3.expressions.value = '{!ObjOpp.Mobile_Number__c}';
                fld4.expressions.value = '{!ObjOpp.Contact_Me__c}';
                fld5.expressions.value = '{!ObjOpp.Time_to_Contact__c}';
                
                pgBlckSec.childComponents.add(fld1);
                pgBlckSec.childComponents.add(fld2);
                pgBlckSec.childComponents.add(fld3);
                pgBlckSec.childComponents.add(fld4);
                pgBlckSec.childComponents.add(fld5);                
            }
            else if(ObjOpp.Picklist_A__c == 'a1' && ObjOpp.Picklist_B__c == 'b2')
            {
                fld1.expressions.value = '{!ObjOpp.Customer_Name__c}';
                fld1.required = True;
                fld2.expressions.value = '{!ObjOpp.Email_Id__c}';
                fld2.required = True;
                
                pgBlckSec.childComponents.add(fld1);
                pgBlckSec.childComponents.add(fld2);                
            }
            else if(ObjOpp.Picklist_A__c == 'a2' && ObjOpp.Picklist_B__c == 'b1')
            {
                fld1.expressions.value = '{!ObjOpp.Customer_Name__c}';
                fld1.required = True;               
                fld3.expressions.value = '{!ObjOpp.Mobile_Number__c}';
                fld3.required = True;
                fld4.expressions.value = '{!ObjOpp.Contact_Me__c}';
                fld4.required = True;
                fld5.expressions.value = '{!ObjOpp.Time_to_Contact__c}';
                
                pgBlckSec.childComponents.add(fld1);                
                pgBlckSec.childComponents.add(fld3);
                pgBlckSec.childComponents.add(fld4);
                pgBlckSec.childComponents.add(fld5);                
            }
            else if(ObjOpp.Picklist_A__c == 'a2' && ObjOpp.Picklist_B__c == 'b2')
            {
                fld1.expressions.value = '{!ObjOpp.Customer_Name__c}';
                fld1.required = True;
                fld2.expressions.value = '{!ObjOpp.Email_Id__c}';
                fld2.required = True;
                fld3.expressions.value = '{!ObjOpp.Mobile_Number__c}';
                fld3.required = True;
                fld4.expressions.value = '{!ObjOpp.Contact_Me__c}';
                fld4.required = True;
                fld5.expressions.value = '{!ObjOpp.Time_to_Contact__c}';
                fld5.required = True;
                
                pgBlckSec.childComponents.add(fld1);
                pgBlckSec.childComponents.add(fld2);
                pgBlckSec.childComponents.add(fld3);
                pgBlckSec.childComponents.add(fld4);
                pgBlckSec.childComponents.add(fld5);                
            }
        
        return pgBlckSec;
    }
    
    
    public PageReference saveOpp() 
    {
        if(ObjOpp != null)
            Database.insert(ObjOpp,false);
            
            PageReference pg = new PageReference('/'+ObjOpp.Id);
        return pg;
    }


}