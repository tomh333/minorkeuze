% minors
% minor(name, m1).
% minor(name, m2).
% minor(name, 1).
% minor(name, 1).
% minor(name, 1).

% minor(sadfafd, 2).

% area_of_interest(technology, 1).

% map(_, ID) :- minor(Minor, ID).

% get_minors(ID, L) :-
	% area_of_interest(Area, ID),
	% findall(Minor, map(Minor, ID), L).


% minor(aarde) :-
	% periode(1), language(1), area_of_interest([1,2,3]).
	
%%%%%%%%%%%%%%%%%%%%
%% USER INTERFACE %%
%%%%%%%%%%%%%%%%%%%%

:- dynamic name/1.
:- dynamic mail/1.
:- dynamic majorChosen/1.
:- dynamic language/1.
:- dynamic period/1.
:- dynamic goal/1.

use_module(inference_api).

% TODO _______________________________________________________________
% Deze lijsten zouden opgevraagd moeten worden van de inference_api en
% dan dynamisch een nummer moeten krijgen, nu moet er 1 op 1          
% bijgehouden worden dat deze strings overeenkomen met die in de data.
%       
% De methods om dit te doen bestaan al voor:
%  - Language; get_all_languages(Labels). 
%  - Period; get_all_periods(Labels). 
%  - Area of interests; get_all_area_of_interests(Labels). 
% ____________________________________________________________________

% Majors
major("Aardwetenschappen", aarde_en_milieu).
major("Sociale geografie en planologie", aarde_en_milieu).
major("Global Sustainability Science", natuur).
major("University College Utrecht", natuur).
major("Informatiekunde", informatietechnologie).
major("Kunstmatige intelligentie", informatietechnologie).
major("Rechtsgeleerdheid", recht_economie_en_bestuur).
major("Economics and Business Economics", recht_economie_en_bestuur).
major("Culturele antropologie en ontwikkelingssociologie", mens_en_gedrag).
major("Onderwijswetenschappen", mens_en_gedrag).
major("Diergeneeskunde", mens_dier_en_gezondheid).
major("Farmacie", mens_dier_en_gezondheid).
major("Kunstgeschiedenis", kunst_cultuur_en_geschiedenis).
major("Muziekwetenschap", kunst_cultuur_en_geschiedenis).
major("Islam en Arabisch", talen_en_culturen_communicatie).
major("Media en cultuur", talen_en_culturen_communicatie).
major("Religiewetenschappen", religie_filosofie_en_ethiek).
major("Filosofie", religie_filosofie_en_ethiek).

% Map majors to option numbers
map(majorChosen, "1", "Aardwetenschappen").
map(majorChosen, "2", "Sociale geografie en planologie").
map(majorChosen, "3", "Global Sustainability Science").
map(majorChosen, "4", "University College Utrecht").
map(majorChosen, "5", "Informatiekunde").
map(majorChosen, "6", "Kunstmatige intelligentie").
map(majorChosen, "7", "Rechtsgeleerdheid").
map(majorChosen, "8", "Economics and Business Economics").
map(majorChosen, "9", "Culturele antropologie en ontwikkelingssociologie").
map(majorChosen, "10", "Onderwijswetenschappen").
map(majorChosen, "11", "Diergeneeskunde").
map(majorChosen, "12", "Farmacie").
map(majorChosen, "13", "Kunstgeschiedenis").
map(majorChosen, "14", "Muziekwetenschap").
map(majorChosen, "15", "Islam en Arabisch").
map(majorChosen, "16", "Media en cultuur").
map(majorChosen, "17", "Religiewetenschappen").
map(majorChosen, "18", "Filosofie").

map(goal, "1", broadening).
map(goal, "2", deepening).
map(goal, "3", preparation).

clear :-
  retractall(name(_)),
  asserta(name(_)),
  retractall(mail(_)),
  asserta(mail(_)),
  retractall(majorChosen(_)),
  asserta(majorChosen(_)),
  retractall(language(_)),
  asserta(language(_)),
  retractall(period(_)),
  asserta(period(_)),
  retractall(goal(_)),
  asserta(goal(_)).
:-clear.