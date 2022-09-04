/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountHandler
{
    public static Account insertNewAccount(String sName)
    {
        Account acc= new Account();
        acc.Name = sName;
        try
        {
            insert acc;
            return acc;
        }
        catch(Exception ee)
        {
            return null;
        }
    }
}