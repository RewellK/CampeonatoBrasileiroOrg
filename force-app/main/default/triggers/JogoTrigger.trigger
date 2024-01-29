trigger JogoTrigger on Jogo__c (after insert) {
	
    JogoTriggerHandler.alterarDadosDosTimes(Trigger.new);

}