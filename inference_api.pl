:- module(inference_api,[get_all_master_labels/1,get_all_major_labels/1,get_all_language_labels/1,get_all_period_labels/1,get_all_area_of_interest_labels/1,get_recommended_minors/4,process/4]).


:- 
[
    data/minors,
    data/majors,
    data/masters,
    data/area_of_interest/aoi_service,
    data/language/language_service,
    data/period/period_service
].

recommended(Major, Language, Period, Minor) :- 
    get_major_id(Major, MajorId),
    is_in_area_of_interest(MajorId, X),
    recommended(X, Language, Period, Minor). 

recommended(Master, Language, Period, Minor) :- 
    get_master_id(Master, MasterId),
    pre_requisite(MasterId, MinorId),
    is_in_language(MinorId, Language),
    is_in_period(MinorId, Period),
    get_minor_name(MinorId, Minor).


recommended(Area, Language, Period, Minor) :- 
    is_in_area_of_interest(MinorId, Area),
    is_in_language(MinorId, Language),
    is_in_period(MinorId, Period),
    get_minor_name(MinorId, Minor).
    

% Process the user inputs; find recommended minors based on the parameters
%
%
process(Search, Language, Period, Minors) :-
    get_recommended_minors(Search, Language, Period, Minors).

% Find all recommended minors based on the parameters
%
%
get_recommended_minors(Search, Language, Period, Minors) :-
    findall(X, recommended(Search, Language, Period, X), Minors).

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

%! get_all_major_labels
get_all_major_labels(Labels) :-
    get_all_majors(Labels).


%! get_all_major_labels
get_all_master_labels(Labels) :-
    get_all_masters(Labels).



   