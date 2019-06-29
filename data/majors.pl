get_major_name(Id,MajorName) :- major(MajorName, Id).

get_major_id(MajorName, Id) :- major(MajorName, Id).

get_all_majors(List) :-
    findall(X, major(X, _), List).

% Majors
major("Aardwetenschappen", m1).
major("Sociale geografie en planologie", m2).
major("Global Sustainability Science", m3).
major("University College Utrecht", m4).
major("Informatiekunde", m5).
major("Kunstmatige intelligentie", m6).
major("Rechtsgeleerdheid", m7).
major("Economics and Business Economics", m8).
major("Culturele antropologie en ontwikkelingssociologie", m9).
major("Onderwijswetenschappen", m10).
major("Diergeneeskunde", m11).
major("Farmacie", m12).
major("Kunstgeschiedenis", m13).
major("Muziekwetenschap", m14).
major("Islam en Arabisch", m15).
major("Media en cultuur", m16).
major("Religiewetenschappen", m17).
major("Filosofie", m18).