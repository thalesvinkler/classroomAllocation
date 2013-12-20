:- use_module(library(apply)).


% Sistema de alocacao de Salas da UnB

% Mapa ilustrativo                 
                                                                                                           
%  20 |	      _______            _______                                        ________________________
%  19 |------|  FIS  |----------|  ADM  |                                 -----| B                      |      
%  18 |------|_______|----------|_______|---------------------------------     |         PAT            |
%  17 |	        |		    |                                     -----|_A______________________| 
%  16 |         |                   |                                                     
%  15 |	        |	            |                                                 _______________________
%  14 |		|                   |                                           -----| B                     |
%  13 |-------------------------------------------------------------------------     |           PJC         |
%  12 |		|                   |                                           -----|_A_____________________|     
%  11 |         |                   |                                                            
%  10 | 	|      	            |                                                   _______________
%  9  |		|	            |                                                  |               |
%  8  |--------------------------------------------------------------------------------|      IPOL     |
%  7  |    _______                  |                                                  |_______________|
%  6  |---|  MAT  |                 |                                   _______________       |  
%  5  |   |_______|                 |                                  |               |      |  
%  4  |----------------------------------------------------------------|   CIC / EST   |      |  
%  3  |      |  |                   |                                  |_______________|      |  
%  2  |	     |	|		    |					     |     |          |      
%  1  |__ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __
%   0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37
%                                                                                          
%
%       x
%  8  |-------*
%  7  |      /|
%  6  |     / |				Distancia de um ponto a origem
%  5  |    /  |
%  4  |  D/   | y          D = sqrt(x*x + y*y)
%  3  |  /    |
%  2  | /     |
%  1  |/__ __ __ __ 
%  0   1  2  3  4  
%
%       x
%  8  |------ B
%  7  |      /|
%  6  |   D / |            Distancia entre dois pontos:
%  5  |    /  |
%  4  |   /   | y          D(AB) = sqrt(pow(xB-xA) + pow(yB-yA))              
%  3  |- A----|
%  2  |  |    |
%  1  |__ __ __ __ 
%  0   1  2  3  4  
%
%
%
% DUVIDAS:
%
%	1 - Como fazer o proprio codigo adicionar fatos a base da dedos?
%		O proprio codigo se escrevendo, nume logica de IA.
%		- Pois ao se alocar uma disciplina em determinada sala, como permanecer essa alocacao de forma a ela ser levada 
%			em consideracao na alocacao da próxima sala?
%		- OU.... dados todos informacoes de tudo(sala, horarios e dias das disciplina, localizacao das salas e departamentos) 
%			com apenas um comando a alocao é feita automaticamente?!
%		
%
%
%
%
%		Pois há duas possibilidades:
%			1) Base de dados de disciplinas sem horario e dia de aula - Usuario insere esses dados - ??Criar uma pilha de memoria??
%				disciplina(computacaoBasica, cic).
%				disciplina(linguagensDeProgramacao, cic).
			
%			
%			2) Base de dados de disciplinas com horario e dia de aula - Realiza busca dos horairos e dias 
%				disciplina(computacaoBasica, cic, [(seg, 14),(qua, 14),(sex, 14)]).
%				disciplina(linguagensDeProgramacao, cic, [(ter, 19), (qui, 21)]).
%
%
% 
%
%	2 - Como retornar uma lista de salas? Apenas retorna uma lista com uma sala, ou retorna a sala.
%		R: findall().
%
%
%
%


% sala(nomeSala, posX, posY, [(diaLivre, horarioLivre)|_]).
%sala(patAt010, 26, 17, []).
%sala(patAt012, 28, 17, []).
%sala(patAt014, 30, 17, []).
%sala(patAt016, 32, 17, []).

%sala(patBt010, 26, 19, []).
%sala(patBt012, 28, 19, []).
%sala(patBt014, 30, 19, []).
%sala(patBt016, 32, 19, []).

%sala(pjcAt010, 28, 12, []).
%sala(pjcAt012, 20, 12, []).
%sala(pjcAt014, 32, 12, []).
%sala(pjcAt016, 34, 12, []).

%sala(pjcBt010, 28, 14, []).
%sala(pjcBt012, 20, 14, []).
%sala(pjcBt014, 32, 14, []).
sala(pjcBt016, 34, 14, []).


% disciplina(nomeDisc, nomeDep, [(Dia, Horario)|_]).

disciplina(computacaoBasica, cic, [(seg, 14),(qua, 14),(sex, 14)]).
disciplina(linguagensDeProgramacao, cic, [(ter, 19), (qui, 21)]).
disciplina(poo, cic, [(seg, 8), (qua, 8)]).
disciplina(oac, cic, [(seg, 14), (qua, 4)]).

disciplina(calculo1, mat, [(seg, 14),(qua, 14),(sex, 14)]).
disciplina(algebra, mat,  [(ter, 19),(sex, 19)]).
disciplina(teoriaNum, mat, [(ter, 8),(qui, 8)]).

disciplina(intAdm, adm,  [(seg, 18),(qui, 18)]).

disciplina(fisica1, fis, [(seg, 10),(qua, 10)]).
disciplina(fisica2, fis, [(ter, 10),(qui, 10)]).
disciplina(fisica3, fis, [(qua, 8),(sex, 8)]).

disciplina(computacaoBasica, cic).
disciplina(linguagensDeProgramacao, cic).
disciplina(poo, cic).
disciplina(oac, cic).

% unidAcadem(nomeDep, posX, posY).

unidAcadem(cic, 24, 4).
unidAcadem(est, 26, 4).
unidAcadem(mat, 3, 6).
unidAcadem(fis, 4, 19).
unidAcadem(adm, 10, 19).

% distOrig = distancia da origem 
distOrig(X, Y, W):- pow(X,A), pow(Y,B), W is sqrt(A+B).

% distPont - distancia entre dois pontos
distPont(XA, YA, XB, YB, W):- pow(XB-XA, R1), pow(YB-YA, R2), W is sqrt(R1+R2).

pow(X, Y):- Y is X*X. 



% 1) Alocar a disciplina M automaticamente, na sala mais perto da unidAcadem UA ?
% alocaDisc(nomeDisc).

alocaDiscAuto(N):- disciplina(N, UA), unidAcadem(UA, Xa, Ya), salaPerto(Xa, Ya).

salaPerto(Xa, Ya, R):- criaListDist(Xa, Ya, L), menorDist(R, L).


% Cria lista de tuplas (NomeSala, X, Y)
salas(L):- findall((Z, Xb, Yb), sala(Z, Xb, Yb, _), L).


% Cria Lista de tuplas (NomeSala, Distancia).
% Arg = X, Y, Lista
% Return = Lista de Tuplas(NomeSala, Distancia) 

criaListDist(Xa, Ya, R1):- salas(L), montaTupla(Xa, Ya, L, R1).

montaTupla(Xa, Ya, [(Z, Xb, Yb)|RL], R1):- distPont(Xa, Ya, Xb, Yb, W), append([(Z, W)], R1, R2), montaTupla(Xa, Ya, RL, R2), !.
%SmontaTupla(Xa, Ya, R2, R2).


%montaTupla(Xa, Ya, [(Z, Xb, Yb)|RL], [(Z, W)|_]):- distPont(Xa, Ya, Xb, Yb, W), montaTupla(Xa, Ya, RL, [(Z, W)|_]).
%montaTupla(Xa, Ya, [], R2):- !.


% Verifica na lista [(Z2,W2)|R] de tuplas (com o nome da sala Zi e a distancia Wi da sala 
% a um determinado ponto) a menor distancia
% retorna a tupla (Z1,W1) sendo W1 a menor distancia encontrada e Z1 o nome da sala 
menorDist(X,[X]).
menorDist((Z1,W1),[(Z2,W2)|R]):- menorDist((Z1,W1),R), W1 < W2, !. 
menorDist((Z2,W2),[(Z2,W2)|_]).   



% 2) Alocar a disciplina M, nos horarios [H|_] dos dias [Dia|_] na sala mais perto da unidAcadem UA ?
% alocaDisc(nomeDisc, [(Dia,H)|_])


alocaDisc(N, [(Dia, Hora)|_]):- disciplina(N, UA), unidAcadem(UA, Xa, Ya), achaSalas(L), salaPerto(Xa, Ya, L), 
								horarioLivre([(Dia, Hora)|_]).



listaSalas(Z, L, [Z|L]).

conc([], L, L).
conc([X|L1],L2,[X|L3]) :- conc(L1,L2,L3).


%INICIO
%achaSalas(S):- disciplina(S,D), unidAcadem(D, Xa, Ya), sala(Z, Xb, Yb, _, _),
%			  distPont(Xa, Ya, Xb, Yb, W), W @< 13, write('- '), write(Z), nl.



%PROXIMO
% sala(nomeSala, capacidade, [seg, ter, qua, qui, sex, sab, all], [8, 10, 12 , 14, 16, 19, 21, all]).
% turma(disciplina).
