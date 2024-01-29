@isTest
public class JogoTriggerHandlerTest {
    @isTest
    static void testJogoTriggerHandler() {
        // Criando dois times
        Time__c time01 = new Time__c(Name = 'primeiro time');
        Time__c time02 = new Time__c(Name = 'segundo time');
        insert new List<Time__c>{time01, time02};

        // Criando dois jogos
        Jogo__c jogoTeste01 = new Jogo__c(TimeDaCasa__c = time01.Id, TimeVisitante__c = time02.Id, PlacarTimeDaCasa__c = 2);
        Jogo__c jogoTeste02 = new Jogo__c(TimeDaCasa__c = time02.Id, TimeVisitante__c = time01.Id, PlacarTimeDaCasa__c =0);
        List<Jogo__c> Jogos = new List<Jogo__c>{jogoTeste01, jogoTeste02};
        //insert Jogos;

        // Executando o trigger manualmente
        Test.startTest();
        JogoTriggerHandler.excecute(new List<Jogo__c>{jogoTeste01, jogoTeste02});
        Test.stopTest();

	}
}
