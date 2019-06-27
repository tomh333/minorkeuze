:- module(period_service,[get_all_period/1,get_period_id/2,is_in_period/2]).

:- 
[
    period_labels,
    periods/period_one,
    periods/period_two,
    periods/period_three,
    periods/period_four
].

is_in_period(Minor, Period) :-
    get_minor_id(Minor, MID),
    get_period_id(Period, PID),
    starts(MID, PID).

get_period_id(Period, PID) :-
    period(Period, PID).

get_all_period(Periods) :-
    findall(X, period(X, _), Periods).