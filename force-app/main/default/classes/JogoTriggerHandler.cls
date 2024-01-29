public class JogoTriggerHandler {

    public static void excecute(List<Jogo__c> lstJogosAtuais){
        for(Jogo__c iJogo : lstJogosAtuais){
            alterarDadosDosTimes(iJogo);
        }
    }

    public static void AlterarDadosEmpate(Time__c timeVisitante,Time__c timeCasa, Jogo__c jogoAtual){
		
        	timeCasa.GolsPro__c += jogoAtual.PlacarTimeDaCasa__c;
            timeCasa.GolsContra__c += jogoAtual.PlacarTimeVisitante__c;
			timeCasa.CartoesAmarelos__c += jogoAtual.CartoesAmarelosCasa__c;
			timeCasa.CartoesVermelhos__c += jogoAtual.CartoesVermelhosCasa__c;
			timeCasa.Pontos__c += 1;
			update TimeCasa;

            timeVisitante.GolsPro__c += jogoAtual.PlacarTimeVisitante__c;
            timeVisitante.GolsContra__c += jogoAtual.PlacarTimeDaCasa__c;
            timeVisitante.CartoesAmarelos__c += jogoAtual.CartoesAmarelosVisitante__c;
            timeVisitante.CartoesVermelhos__c += jogoAtual.CartoesVermelhosVisitante__c;
            timeVisitante.Pontos__c += 1;
			update TimeVisitante;
        
    }
    public static void alterarDadosDosTimes(Jogo__c jogoAtual){
        Time__c Vencedor;
        Time__c Perdedor;
        
        if(jogoAtual.ResultadoDoJogo__c == 'Vitória time da Casa'){
			Vencedor = TimeDAO.getTime(jogoAtual.TimeDaCasa__c);
            Perdedor = TimeDAO.getTime(jogoAtual.TimeVisitante__c);

			//atualizar os dados do Vencedor
            Vencedor.GolsPro__c += jogoAtual.PlacarTimeDaCasa__c;
            Vencedor.GolsContra__c += jogoAtual.PlacarTimeVisitante__c;
			Vencedor.Pontos__c = Vencedor.Pontos__c + 3;
           	Vencedor.CartoesAmarelos__c += jogoAtual.CartoesAmarelosCasa__c;
			Vencedor.CartoesVermelhos__c += jogoAtual.CartoesVermelhosCasa__c;

			//atualizar os dados do Perdedor
            Perdedor.GolsPro__c += jogoAtual.PlacarTimeVisitante__c;
            Perdedor.GolsContra__c += jogoAtual.PlacarTimeDaCasa__c;
			Perdedor.Pontos__c += 0;
            Perdedor.CartoesAmarelos__c += jogoAtual.CartoesAmarelosVisitante__c;
			Perdedor.CartoesVermelhos__c += jogoAtual.CartoesVermelhosVisitante__c;

			update Vencedor;
            update Perdedor;
        
        
		if(jogoAtual.ResultadoDoJogo__c == 'Vitória time Visitante'){
            Vencedor = TimeDAO.getTime(jogoAtual.TimeVisitante__c);
            Perdedor = TimeDAO.getTime(jogoAtual.TimeDaCasa__c);
            
			//atualizar os dados do Vencedor
            Vencedor.GolsPro__c += jogoAtual.PlacarTimeVisitante__c;
            Vencedor.GolsContra__c += jogoAtual.PlacarTimeDaCasa__c;
			Vencedor.Pontos__c += 3;
            Vencedor.CartoesAmarelos__c += jogoAtual.CartoesAmarelosVisitante__c;
            Vencedor.CartoesVermelhos__c += jogoAtual.CartoesVermelhosVisitante__c;
			
			//atualizar os dados do Perdedor
            Perdedor.GolsPro__c += jogoAtual.PlacarTimeDaCasa__c;
            Perdedor.GolsContra__c += jogoAtual.PlacarTimeVisitante__c;
			Perdedor.Pontos__c += 0;
            Perdedor.CartoesAmarelos__c += jogoAtual.CartoesVermelhosCasa__c;
            Perdedor.CartoesVermelhos__c += jogoAtual.CartoesAmarelosCasa__c;

			update Vencedor;
            update Perdedor;
			}

        if(jogoAtual.ResultadoDoJogo__c == 'Empate'){
            AlterarDadosEmpate(TimeDAO.getTime(jogoAtual.TimeDaCasa__c),TimeDAO.getTime(jogoAtual.TimeVisitante__c),jogoAtual);
        }

        }
    
    }
}