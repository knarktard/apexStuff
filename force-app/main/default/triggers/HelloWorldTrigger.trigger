/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 08-31-2022
 * @last modified by  : Rodrigo Braun
**/
trigger HelloWorldTrigger on Account (before insert) {

    system.debug('Hello World');

}