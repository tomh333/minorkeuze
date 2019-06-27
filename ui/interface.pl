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
	% trace,
	
	nl,
	writeln("What major are you following?"),
	list_majors,
	read_line_to_string(user_input, InputMajor),
	map(majorChosen, InputMajor, Major),
	retractall(majorChosen(_)),
	assertz(majorChosen(Major)).

ask_minor_preferences :-
	nl,
	name(Name),
	format("Welcome ~w, let's go more in depth.~nMINOR PREFERENCES~nIf you choose an invalid option, the first or 'no preference' value will be chosen.~n~46t~72|~n", Name),
	
	writeln("In which language do you prefer your minor?"),
		writeln("1. English"),
		writeln("2. Dutch"),
		writeln("0. No preference"),
	read_line_to_string(user_input, InputLanguage),
	map(language, InputLanguage, Language),
	retractall(language(_)),
	assertz(language(Language)),
	
	period(Period),
	nl,
	writeln("In which period do you want to do your minor?"),
		writeln("1. First period"),
		writeln("2. Second period"),
		writeln("3. Third period"),
		writeln("4. Fourth period"),
		writeln("0. No preference"),
	read_line_to_string(user_input, InputPeriod),
	map(period, InputPeriod, Period),
	retractall(period(_)),
	assertz(period(Period)),
	
	goal(Goal),
	nl,
	writeln("What's your goal with your minor?"),
		writeln("1. Broadening"),
		writeln("2. Deepening"),
		writeln("3. Preparation for master"),
	read_line_to_string(user_input, InputGoal),
	map(goal, InputGoal, Goal),
	retractall(goal(_)),
	assertz(goal(Goal)),
	!.
	
show_stuff :-
	name(Name1),
	mail(Mail1),
	majorChosen(MajorChosen),
	
	language(Language1),
	period(Period1),
	goal(Goal1),
	
	format("Name: ~w,  Email: ~w,  Major: ~w, Language: ~w, Period: ~w, Goal: ~w", [Name1, Mail1, MajorChosen, Language1, Period1, Goal1]),
	!.
	