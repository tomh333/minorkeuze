:- module(language_service,[get_all_language/1,get_language_id/2,is_in_language/2]).

:- 
[   
    language_labels,
    languages/language_dutch,
    languages/language_english
].

is_in_language(Minor, Language) :-
    get_minor_id(Minor, MID),
    get_language_id(Language, LID),
    is_language(MID, LID).

get_language_id(LanguageLabel, LID) :-
    language(LanguageLabel, LID).

get_all_language(Languages) :-
    findall(X, language(X, _), Languages).