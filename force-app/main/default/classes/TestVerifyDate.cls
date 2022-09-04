/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 09-04-2022
 * @last modified by  : Rodrigo Braun
**/
@isTest
public with sharing class TestVerifyDate {
    @isTest static void TestCheckDates() {
        Date Date1 = VerifyDate.CheckDates(System.today(), System.today()+1);
        Date Date2 = VerifyDate.CheckDates(System.today(), System.today()+15);
        System.assertEquals(System.today()+15, date2);
    }

    @isTest static void testCheckDatesenddate() {
        Date d2 = VerifyDate.CheckDates(System.today(), System.today()+50);
        Date startDate = System.Date.today().toStartOfMonth(); 
        System.assertEquals(startDate.addMonths(1).addDays(-1), d2);
    }

    @isTest static void TestDateWithin30Days(){
        Boolean Date1 = VerifyDate.DateWithin30Days(System.today(), System.today()+20);
        System.assertEquals(True, date1);
    }

    @isTest static void TestSetEndOfMonthDate(){
        Date date1 = VerifyDate.SetEndOfMonthDate(date.newInstance(2022, 09, 04));
        Date expectedDate = date.newInstance(2022, 9, 30);
        System.assertEquals(expectedDate, date1);
    }
}

