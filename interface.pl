%%%%%%%%%%%%%%%%%%%%
%% USER INTERFACE %%
%%%%%%%%%%%%%%%%%%%%

:- discontiguous menu/0.

:- use_module(inference_api).
:- [interaction_methods].

:- dynamic name/1.
:- dynamic mail/1.
:- dynamic language/1.
:- dynamic period/1.
:- dynamic goal/1.
:- dynamic area/1.
:- dynamic major/1.
:- dynamic master/1.

clear :-
  retractall(name(_)),
  asserta(name(_)),
  retractall(mail(_)),
  asserta(mail(_)),
  retractall(major(_)),
  retractall(area(_)),
  asserta(major(_)),
  asserta(area(_)),
  retractall(language(_)),
  asserta(language(_)),
  retractall(period(_)),
  asserta(period(_)),
  retractall(goal(_)),
  asserta(goal(_)).
:-clear.

menu :-
	repeat,		% backtrack to this position whenever something below fails.
	nl,
	format('~46t~72|~n'),
	writeln("Hi, this program should help you with chosing a minor. Do you want to get started?"),
	
	let_user_select_next_action(
		[
			"Let's go!",
			"Exit"
		],
		[
			start_program,
			exit_program
		]
	),

  	format('~46t~72|~n').


% Exit the program
exit_program :-	
  format("Thank you and see you next time!~n~n~n"),
  clear, 
  !.

% Start the program
start_program :-
	ask_student_info,
	ask_minor_preferences,
	show_results,
	!.

% Ask the user to enter their information
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
	assertz(mail(InputMail)).

% Ask the user about their preferences for their prospective minor
ask_minor_preferences :-
	nl,
	name(Name),
	format("Welcome ~w, let's go more in depth.~nMINOR PREFERENCES~nIf you choose an invalid option, the first or 'no preference' value will be chosen.~n~46t~72|~n", Name),
	
	nl,
	writeln("In which language do you prefer your minor?"),

	get_all_language_labels(LanguageLabels),

	read_user_select(
		LanguageLabels,  
		Language
	),
	
	retractall(language(_)),
	assertz(language(Language)),
	
	nl,
	writeln("In which period do you want to do your minor?"),

	get_all_period_labels(PeriodLabels),

	read_user_select(
		PeriodLabels, 
		Period
	),

	retractall(period(_)),
	assertz(period(Period)),
	
	nl,
	writeln("What's your goal with your minor?"),
	
	let_user_select_next_action(
		[
			"Broadening",
			"Deepening",
			"Preparation for master"
		],
		[
			ask_field_of_interest,
			ask_major,
			ask_master
		]
	).

ask_field_of_interest :-
	nl,
	writeln("What field are you most interested in?"),

	get_all_area_of_interest_labels(Labels),

	read_user_select(
		 Labels, 
		 Area
	),

	retractall(area(_)),
	assertz(area(Area)),

	show_results.

ask_major :-
	nl,
	writeln("What major are you currently following?"),

	get_all_major_labels(Labels),

	read_user_select(
		Labels,
		Major
	),

	retractall(major(_)),
	assertz(major(Major)),

	show_results.
	
show_results :-
	name(Name1),
	mail(Mail1),
	
	language(Language1),
	period(Period1),
	goal(Goal1),

	major(Major), 

	area(Area1),

	process_results([Area1, Major], Language1, Period1, Minors),

	writeln("Based on the following info:"),

	nl,
	format("Name: ~w\nEmail: ~w\nMajor: ~w\nArea: ~w\nLanguage: ~w\nPeriod: ~w\nGoal: ~w\n", [Name1, Mail1, Major, Area1, Language1, Period1, Goal1]),

	nl,

	writeln("the following minors are recommended:"),

	nl,
	show_list(Minors),
	!.

process_results([], _, _, _) :-
	nl.

process_results([H|T], Language, Period, Minors) :-
	if_then_else(
		nonvar(H),
		process(H, Language, Period, Minors),
		process_results(T, Language, Period, Minors)
		).
	