public class TimeDAO {
	    public static Time__c getTime(Id TimeId){
            List<Time__c> TimeReturn = [SELECT CartoesAmarelos__c,CartoesVermelhos__c,GolsContra__c,GolsPro__c,Name,Pontos__c	
                    FROM Time__c WHERE Time__c.Id =: TimeId LIMIT 1];
            return TimeReturn[0];
    }
}