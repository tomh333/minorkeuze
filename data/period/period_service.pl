:- 
[
    period_labels,
    periods/period_one,
    periods/period_two,
    periods/period_three,
    periods/period_four
].

is_in_period(Minor, Period) :-
    get_period_id(Period, PID),
    starts(Minor, PID).

get_period_id(Period, PID) :-
    period(Period, PID).

get_all_period(Periods) :-
    findall(X, period(X, _), Periods).