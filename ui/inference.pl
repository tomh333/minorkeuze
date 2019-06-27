%%%%%%%%%%%%%%%
%% INFERENCE %%
%%%%%%%%%%%%%%%

get_all_majors(Majors) :-
	findall(X, major(X, _), Majors).

list_majors :-
	get_all_majors(Majors),
	length(Majors, MajorLength),
    print_list(Majors, MajorLength),

printlist([], 0).
    
print_list([X|List], ListLength) :-
	length(List, TailLength),
	Counter is ListLength - TailLength,
	format("~w. ~w", [Counter, X]),
	nl,
	print_list(List, ListLength).

:- menu.
