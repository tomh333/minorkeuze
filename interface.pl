%%%%%%%%%%%%%%%%%%%%
%% USER INTERFACE %%
%%%%%%%%%%%%%%%%%%%%
:- discontiguous menu/0.

menu :-
	repeat,		% backtrack to this position whenever something below fails.
	nl,
	format('~46t~72|~n'),
	writeln("Hi, this program should help you with chosing a minor. Do you want to get started?"),
	writeln("1. Let's go!"),
	writeln("0. Exit"),
  format('~46t~72|~n'),
	read_line_to_string(user_input, Choice),
	process_choice(Choice),
	Choice == "0". % if Choice is not 0: fail, backtrack to repeat.

% Executes when user chooses option 0
process_choice("0") :-	% user choice is 0: succeed.
  format("Thank you and see you next time!~n~n~n"),
  clear, 
  !.

% Gather information from the user when user chooses option 1
process_choice("1") :-
	ask_student_info,
	ask_minor_preferences,
	show_stuff,
	!.

% Questions are layed out in fixed order
% First ask about the student_info

ask_student_info :-
	nl,
	format("STUDENT INFORMATION ~n~46t~72|~n"),
	
	writeln("What's your name?"),
	read_line_to_string(user_input, InputName),
	retractall(name(_)),
	assertz(name(InputName)),
  
	nl,
	writeln("What's your e-mailaddress?"),
	read_line_to_string(user_input, InputMail),
	retractall(mail(_)),
	assertz(mail(InputMail)),
	
	nl,
	writeln("What major are you following?"),
	\+ list_majors,
	read_line_to_string(user_input, InputMajor),
	map(majorChosen, InputMajor, Major),
	retractall(majorChosen(_)),
	assertz(majorChosen(Major)).

ask_minor_preferences :-
	nl,
	name(Name),
	format("Welcome ~w, let's go more in depth.~nMINOR PREFERENCES~nIf you choose an invalid option, the first or 'no preference' value will be chosen.~n~46t~72|~n", Name),
	
	nl,
	writeln("In which language do you prefer your minor?"),

	get_all_language_labels(LanguageLabels),

	read_user_select_from_list(
		LanguageLabels, 
		LanguageLabels, 
		1, 
	 	Language),
	
	retractall(language(_)),
	assertz(language(Language)),
	
	nl,
	writeln("In which period do you want to do your minor?"),

	get_all_period_labels(PeriodLabels),

	read_user_select_from_list(
		PeriodLabels, 
		PeriodLabels, 
		1, 
	 	Period),

	retractall(period(_)),
	assertz(period(Period)),
	
	nl,
	writeln("What's your goal with your minor?"),
		writeln("1. Broadening"),
		writeln("2. Deepening"),
		writeln("3. Preparation for master"),
	read_line_to_string(user_input, InputGoal),
	map(goal, InputGoal, Goal),
	retractall(goal(_)),
	assertz(goal(Goal)),
	process_goal_choiche(InputGoal),	
	!.

% In case the goal choiche is broadening, ask user to select an area of interest
process_goal_choiche("1") :-
	nl,
	writeln("What field are you most interested in?"),

	get_all_area_of_interest_labels(Labels),

	read_user_select_from_list(
		Labels, 
		Labels, 
		1, 
	 	Area),

	retractall(area(_)),
	assertz(area(Area)).

read_user_select_from_list([], List, _, Choiche) :-
	read_line_to_string(user_input, SelectedIndexString),
	atom_number(SelectedIndexString, X),	
	nth1(X, List, Choiche).

read_user_select_from_list([HL|TL], List, Count, Choiche) :-
	format("~w: ~w \n", [Count, HL]),
	NewCount is Count+1,
	read_user_select_from_list(TL, List, NewCount, Choiche).

show_list([]) :-
	nl.

show_list([LH|LT]) :-
	writeln(LH),
	show_list(LT).
	
show_stuff :-
	name(Name1),
	mail(Mail1),
	majorChosen(MajorChosen),
	area(Area1),
	language(Language1),
	period(Period1),
	goal(Goal1),

	writeln("Based on the following info:"),

	nl,
	format("Name: ~w\nEmail: ~w\nMajor: ~w\nArea: ~w\nLanguage: ~w\nPeriod: ~w\nGoal: ~w\n", [Name1, Mail1, MajorChosen, Area1, Language1, Period1, Goal1]),

	process(Area1,Language1,Period1,Minors),

	nl,

	writeln("the following minors are recommended:"),

	nl,
	show_list(Minors),
	!.
	