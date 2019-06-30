:- 
[   
    language_labels,
    languages/language_dutch,
    languages/language_english
].

is_in_language(_, Language) :-
    language(Language, unknown).

is_in_language(Minor, Language) :-
    get_language_id(Language, LID),
    is_language(Minor, LID).

get_language_id(LanguageLabel, LID) :-
    language(LanguageLabel, LID).

get_all_language(Languages) :-
    findall(X, language(X, _), Languages).