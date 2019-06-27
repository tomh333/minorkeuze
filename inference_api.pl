:- module(inference_api,[get_all_language_labels/1,get_all_period_labels/1,get_all_area_of_interest_labels/1,get_minor/4,get_minors/4,process/4]).

:- 
[
    data/minors,
    data/area_of_interest/aoi_service,
    data/language/language_service,
    data/period/period_service
].

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
    get_minor_id(Minor, MID),
    is_in_area_of_interest(MID, Area), is_in_language(MID, Language), is_in_period(MID, Period),
    get_minor_name(MID, Minor).

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



   