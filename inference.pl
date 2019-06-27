% inference

% minor id
get_minor_name(Id,MinorName) :- minor(MinorName, Id).

get_minor_id(MinorName, Id) :- minor(MinorName, Id).

% area of interest
get_minor_for_area(AOI, Minors) :- 
    is_in_area(MID, AOI),
    get_minor_name(MID, Minors).

get_minors_for_area(Area, Minors) :-
     findall(X, get_minor_for_area(Area, X), Minors).
    
areas_of_minor(Minor, AOI) :-
    get_minor_id(Minor, MID),
    is_in_area(MID, AOI).

get_all_area_of_interest(Areas) :-
    findall(X, area_of_interest(X, _), Areas).

% taal
get_minor_for_language(Language, Minor) :-
    language(MID, Language),
    get_minor_name(MID, Minor).

get_minors_for_language(Language, Minors) :-
    findall(X, get_minor_for_language(Language, X), Minors).

languages_of_minor(Minor, AOI) :-
    get_minor_id(Minor, MID),
    language(MID, AOI).

% blok
get_minor_for_period(Period, Minor) :-
    starts(MID, Period),
    get_minor_name(MID, Minor).

% get minor for all criteria
get_minor(Area, Language, Period, Minor) :-
    is_in_area(MID, Area), language(MID, Language), starts(MID, Period), get_minor_name(MID, Minor).

get_minors(Area, Language, Period, Minors) :-
    findall(X, get_minor(Area, Language, Period, X), Minors).

process(Area, Language, Period, Minors) :-
    get_minors(Area, Language, Period, Minors).




