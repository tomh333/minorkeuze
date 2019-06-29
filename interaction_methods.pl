% Show the user a list and ask them to select an option
read_user_select([HL|TL], Choiche) :-
    if_then_else(
        read_user_select_from_list([HL|TL], [HL|TL], 1, _, Choiche),
        option_chosen_message(Choiche),
        error_message(
            [read_user_select([HL|TL], Choiche)]
        )
    ).

% Show the user a list of actions and ask them to select an action, then perform that action
let_user_select_next_action([HL|TL], Actions, Choiche) :-
    if_then_else(
        read_user_select_from_list([HL|TL], [HL|TL], 1, Index, Choiche),
        option_chosen_message(Choiche, Actions, Index),
        error_message(
            [read_user_select([HL|TL], Choiche)]
        )
    ).

error_message([ActionToRepeat|_]) :- 
    nl,
    writeln("The option entered is not in the range of possible options, please try again."),
    call(ActionToRepeat). 

option_chosen_message(Option) :-
    format("Selected option: ~w",[Option]),
    nl.

option_chosen_message(Option, Actions, Index) :-
    nth1(Index, Actions, ActionToCall),
    format("Selected option: ~w",[Option]),
    nl,
    call(ActionToCall).

% Overload when the choiche is not needed as return value
let_user_select_next_action([HL|TL], Actions) :-
    let_user_select_next_action([HL|TL], Actions, _).

% Show a list to the user
show_list([LH|LT]) :-
	writeln(LH),
	show_list(LT).

show_list([]) :-
	nl.

% Recursive helper methods
read_user_select_from_list([], List, _, Index, Choiche) :-
	read_line_to_string(user_input, SelectedIndexString),
    atom_number(SelectedIndexString, Index),
    nth1(Index, List, Choiche).

read_user_select_from_list([HL|TL], List, Count, Index, Choiche) :-
	format("~w: ~w \n", [Count, HL]),
	NewCount is Count+1,
	read_user_select_from_list(TL, List, NewCount, Index, Choiche).

if_then_else(Condition, Action1, _) :- Condition, !, Action1.  
if_then_else(_, _, Action2) :- Action2.

