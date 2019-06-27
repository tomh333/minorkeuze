:- module(inference_api,[get_all_language_labels/1,get_all_period_labels/1,get_all_area_of_interest_labels/1,get_minor/4,get_minors/4,process/4]).

:- use_module(data/area_of_interest/aoi_service).
:- use_module(data/period/period_service).
:- use_module(data/language/language_service).

% Process the user inputs; find recommended minors based on the parameters
%
%
process(Area, Language, Period, Minors) :-
    get_minors(Area, Language, Period, Minors).

% Find all recommended minors based on the parameters
%
%
get_minors(Area, Language, Period, Minors) :-
    findall(X, get_minor(Area, Language, Period, X), Minors).

%! Find a recommended minor based on the parameters
%
%
get_minor(Area, Language, Period, Minor) :-
    is_in_area_of_interest(Minor, Area), is_in_language(Minor, Language), is_in_period(Minor, Period).

%!	get_all_area_of_interest_labels
%
%
get_all_area_of_interest_labels(Labels) :-
    get_all_area_of_interest(Labels).

%!	get_all_period_labels
%
%
get_all_period_labels(Labels) :-
    get_all_period(Labels).

%!	get_all_language_labels
%
%
get_all_language_labels(Labels) :- 
    get_all_language(Labels).



   