:- multifile minor/2.
:- multifile is_language/2.
:- multifile starts/2.

master("Bestuur en beleid", ms1).
master("Business informatics", ms2).
master("Arts and society", ms3).
master("Biology of disease", ms4).
master("Applied cognitive psychology", ms5).
master("Earth, surface and water", ms6).
master("Public international law", ms7).
master("Philosophy", ms8).
master("Engelse taal en cultuur", ms9).

get_all_masters(List) :-
    findall(X, master(X, _), List).

% These pre-requisite are fictitious and act as a mock for actual data
minor("MOCK PREREQUISITE MASTER: Bestuur en beleid", mockMinor1).
minor("MOCK PREREQUISITE MASTER: Business informatics", mockMinor2).
minor("MOCK PREREQUISITE MASTER: Arts and society", mockMinor3).
minor("MOCK PREREQUISITE MASTER: Biology of disease", mockMinor4).
minor("MOCK PREREQUISITE MASTER: Applied cognitive psychology", mockMinor5).
minor("MOCK PREREQUISITE MASTER: Earth, surface and water", mockMinor6).
minor("MOCK PREREQUISITE MASTER: Public international law", mockMinor7).
minor("MOCK PREREQUISITE MASTER: Philosophy", mockMinor8).
minor("MOCK PREREQUISITE MASTER: Engelse taal en cultuur", mockMinor9).

is_language(mockMinor1, dutch).
is_language(mockMinor2, dutch).
is_language(mockMinor3, dutch).
is_language(mockMinor4, dutch).
is_language(mockMinor5, dutch).
is_language(mockMinor6, dutch).
is_language(mockMinor7, dutch).
is_language(mockMinor8, dutch).
is_language(mockMinor9, dutch).

is_language(mockMinor1, english).
is_language(mockMinor2, english).
is_language(mockMinor3, english).
is_language(mockMinor4, english).
is_language(mockMinor5, english).
is_language(mockMinor6, english).
is_language(mockMinor7, english).
is_language(mockMinor8, english).
is_language(mockMinor9, english).

starts(mockMinor1, p1).
starts(mockMinor2, p1).
starts(mockMinor3, p1).
starts(mockMinor4, p1).
starts(mockMinor5, p1).
starts(mockMinor6, p1).
starts(mockMinor7, p1).
starts(mockMinor8, p1).
starts(mockMinor9, p1).

starts(mockMinor1, p2).
starts(mockMinor2, p2).
starts(mockMinor3, p2).
starts(mockMinor4, p2).
starts(mockMinor5, p2).
starts(mockMinor6, p2).
starts(mockMinor7, p2).
starts(mockMinor8, p2).
starts(mockMinor9, p2).

starts(mockMinor1, p3).
starts(mockMinor2, p3).
starts(mockMinor3, p3).
starts(mockMinor4, p3).
starts(mockMinor5, p3).
starts(mockMinor6, p3).
starts(mockMinor7, p3).
starts(mockMinor8, p3).
starts(mockMinor9, p3).

starts(mockMinor1, p4).
starts(mockMinor2, p4).
starts(mockMinor3, p4).
starts(mockMinor4, p4).
starts(mockMinor5, p4).
starts(mockMinor6, p4).
starts(mockMinor7, p4).
starts(mockMinor8, p4).
starts(mockMinor9, p4).

pre_requisite(ms1, mockMinor1).
pre_requisite(ms2, mockMinor2).
pre_requisite(ms3, mockMinor3).
pre_requisite(ms4, mockMinor4).
pre_requisite(ms5, mockMinor5).
pre_requisite(ms6, mockMinor6).
pre_requisite(ms7, mockMinor7).
pre_requisite(ms8, mockMinor8).
pre_requisite(ms9, mockMinor9).

get_master_id(Master, MasterId) :-
    master(Master, MasterId).