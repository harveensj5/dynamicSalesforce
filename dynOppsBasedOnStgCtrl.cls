/********************************************

********************************************/
public with sharing class dynOppsBasedOnStgCtrl 
{
    public List<Opportunity> lst_Opps{set;get;}
    public List<Opportunity> lstStgOpps{get;set;}
    public List<Opportunity> lstStgOpps1{get;set;}
    public List<Opportunity> lstStgOpps2{get;set;}
    public List<Opportunity> lstStgOpps3{get;set;}
    public List<Opportunity> lstStgOpps4{get;set;}
    public List<Opportunity> lstStgOpps5{get;set;}
    public List<Opportunity> lstStgOpps6{get;set;}
    public List<Opportunity> lstStgOpps7{get;set;}
    public List<Opportunity> lstStgOpps8{get;set;}
    public List<Opportunity> lstStgOpps9{get;set;}
    public List<Opportunity> lstStgOpps10{get;set;}
    public List<Opportunity> lstStgOpps11{get;set;}
    public List<Opportunity> lstStgOpps12{get;set;}
    public List<Opportunity> lstStgOpps13{get;set;}
    public List<Opportunity> lstStgOpps14{get;set;}
    public List<Opportunity> lstStgOpps15{get;set;}
    public List<Opportunity> lstStgOpps16{get;set;}
    public List<Opportunity> lstStgOpps17{get;set;}
    public List<Opportunity> lstStgOpps18{get;set;}
    
    transient List<Schema.PicklistEntry> schmPikEntries;
    public String strStgName{get;set;}
    
    

        
    public dynOppsBasedOnStgCtrl()
    {
        lst_Opps = new List<Opportunity>();
        
        lst_Opps = [SELECT ID,Name,StageName FROM Opportunity LIMIT 49999];
        
        
        Schema.DescribeFieldResult schmFldReslt = Opportunity.StageName.getDescribe();
        
        schmPikEntries = schmFldReslt.getPicklistValues();
        
        system.debug('------------------schmPikEntries------------------'+schmPikEntries.size());
    }
    
    
    public Component.Apex.PageBlock getDynDetails() 
    {
        Component.Apex.PageBlock pgBlck = new Component.Apex.PageBlock(title = 'Opportunities based on Stage');
        
        
        integer count = 1;
        
        for(Schema.PicklistEntry schmPikEntry : schmPikEntries)
        {
            strStgName = schmPikEntry.getValue();
            system.debug('------------------strStgName------------------'+strStgName);
            
            lstStgOpps = new List<Opportunity>();
            
            //prepare list of Opps of particular stage
            for(Opportunity opp : lst_Opps)
            {
                if((opp.StageName).equalsIgnoreCase(schmPikEntry.getValue()))
                {                    
                    lstStgOpps.add(opp);
                }            
            }
                 
             system.debug('------------------lstStgOpps------------------'+lstStgOpps);                
                        
            if(lstStgOpps.size()>0)
            {
                Component.Apex.PageBlockSection pgSec = new Component.Apex.PageBlockSection(); 
                Component.Apex.PageBlockTable pgBlckTab = new Component.Apex.PageBlockTable(var = 'opp');
                Component.Apex.Column col1 = new Component.Apex.Column();
                Component.Apex.Column col2 = new Component.Apex.Column();
            
                if(count == 1)
                { 
                    lstStgOpps1 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps1}';             
                }    
                else if(count == 2)
                {
                    lstStgOpps2 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps2}';             
                }
                else if(count == 3)        
                { 
                    lstStgOpps3 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps3}';
                }                 
                else if(count == 4)
                {
                    lstStgOpps4 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps4}';             
                }
                else if(count == 5)        
                {
                    lstStgOpps5 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps5}';             
                }
                else if(count == 6)
                {
                    lstStgOpps6 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps6}';             
                }
                else if(count == 7)        
                { 
                    lstStgOpps7 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps7}';
                }                 
                else if(count == 8)
                { 
                    lstStgOpps8 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps8}';             
                }    
                else if(count == 9)        
                {
                    lstStgOpps9 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps9}';             
                }    
                else if(count == 10)
                { 
                    lstStgOpps10 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps10}';             
                }    
                else if(count == 11)        
                {
                    lstStgOpps11 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps11}';             
                }    
                else if(count == 12)
                { 
                    lstStgOpps12 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps12}';             
                }    
                else if(count == 13)        
                {
                    lstStgOpps13 = lstStgOpps;                    
                    pgBlckTab.expressions.value = '{!lstStgOpps13}';             
                }
                else if(count == 14)
                {    
                    lstStgOpps14 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps14}';
                }                 
                else if(count == 15)        
                { 
                    lstStgOpps15 = lstStgOpps;                    
                    pgBlckTab.expressions.value = '{!lstStgOpps15}';             
                }    
                else if(count == 16)
                { 
                    lstStgOpps16 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps16}';             
                }
                else if(count == 17)        
                { 
                    lstStgOpps17 = lstStgOpps;                    
                    pgBlckTab.expressions.value = '{!lstStgOpps17}';             
                }    
                /*else if(count == 18)
                {
                    lstStgOpps18 = lstStgOpps;
                    pgBlckTab.expressions.value = '{!lstStgOpps18}';             
                }*/
                    
                    
                //add prepared list to pageBlkTable                                
             
                col1.expressions.value = '{!opp.Name}';
                col2.expressions.value = '{!opp.StageName}';
                
                
                pgBlckTab.childComponents.add(col1);
                pgBlckTab.childComponents.add(col2);
                pgSec.title = strStgName;
                pgSec.childComponents.add(pgBlckTab);
        
                pgBlck.childComponents.add(pgSec);
            }
            
            count++;
        }
            
        return pgBlck;
    }
    
    
    public class WrapOpportunity
    {
        public String strStgName{get; set;}
        public List<Opportunity> lst_StgOpps{get; set;}

        public WrapOpportunity(String stgName, List<Opportunity> Opps) 
        {
            strStgName = stgName;
            lst_StgOpps = Opps;
        }
    }
}