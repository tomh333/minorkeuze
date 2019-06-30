%% VOEG HIER master(_) OOK TOE ALS DIE BESTAAT, EN DAN WERKT DE UITLEG ALS HET GOED IS VANZELF
minorExp(_) :-
	area(_), major(_), language(_), period(_), goal(_).

% Provide explanations
explain(Conclusion, Reasons):-
  clause(Conclusion, Goals), % returns the subgoals of a rule.
	Goals,
	!,
	get_reasons(Goals, Reasons).


% Parse the goals into Prop-Value pairs.
% Here we are only concerned with the Values actually.
get_reasons(Goal, Reasons) :-
	functor(Goal, Pred, _),  % gets the predicate of a goal
	Pred \= ,,  % comma (conjunction), the goals are split in the next rule
  write_reason(Pred, Reasons), !.
get_reasons(Goal, Reasons) :-
	arg(1, Goal, Subgoal_1), get_reasons(Subgoal_1, R1),
	arg(2, Goal, Subgoal_2), get_reasons(Subgoal_2, R2),
	append(R1, R2, Reasons).


% write_reason(Pred, [Reason]) <-
%   Reason is a string with a explanation related to predicate Pred.
%   If predicate Pred is not defined (free variable), Reason is empty.
%
write_reason(area, [Reason]) :-
	goal(Goal),
	Goal == "Broadening",
	area(Value),
	nonvar(Value), !,
	string_upper(Value, UpValue),
	swritef(Reason, " - The goal of your minor is to broaden your knowledge and you are interested in the area of %w\n", [UpValue]).
write_reason(major, [Reason]) :-
	goal(Goal),
	Goal == "Deepening",
    !,
    major(Major),
    string_upper(Major, UpValue),
	swritef(Reason, " - Your current major is %w and the goal of your minor is to deepen your knowledge in this field\n", [UpValue]).
write_reason(language, [Reason]) :-
	language(Value),
    nonvar(Value), !,
    string_upper(Value, UpValue),
    swritef(Reason, " - Your preference for the language of the minor was: %w\n", [UpValue]).


write_reason(period, [Reason]) :-
	period(Value),
	nonvar(Value), !,
	string_upper(Value, UpValue),
	swritef(Reason, " - Your preference for the period of the minor was: %w\n", [UpValue]).
write_reason(master, [Reason]) :-
	goal(Goal),
	Goal == "Preparation for master",
	period(Value),
	nonvar(Value), !,
	string_upper(Value, UpValue),
	swritef(Reason, " - You wanted to prepare for your master ...... %w\n", [UpValue]).
write_reason(_, []).


% Prints the reason for the recommendations
print_reasons(Reasons) :-	
	prin(Reasons).


% Go through the list of reasons, printing them to screen
%
prin([P]) :- format("~w~n~n", P), !.
prin([H|T]) :- format("~w", H), prin(T).
