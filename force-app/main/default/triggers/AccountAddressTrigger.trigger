/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 08-31-2022
 * @last modified by  : Rodrigo Braun
**/
trigger AccountAddressTrigger on Account (before insert, before update) {

    for(Account a : Trigger.new){
        if(a.Match_Billing_Address__c == true){
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }

}