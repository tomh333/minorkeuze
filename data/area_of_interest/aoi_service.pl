:- [
    aoi_labels,
    areas/minors/aoi_informatietechnologie,
    areas/minors/aoi_aarde_en_mileu,
    areas/minors/aoi_kunst_cultuur_en_geschiedenis,
    areas/minors/aoi_mens_dier_en_gezondheid,
    areas/minors/aoi_mens_en_gedrag,
    areas/minors/aoi_natuur,
    areas/minors/aoi_recht_economie_en_bestuur,
    areas/minors/aoi_religie_filosofie_en_ethiek,
    areas/minors/aoi_talen_en_cultuur_communicatie,
    areas/majors/aoi_majors
].

is_in_area_of_interest(Minor, Area) :-
    get_area_of_interest_id(Area, AID),
    is_in_area(Minor, AID).

get_area_of_interest_id(AreaLabel, AID) :-
    area_of_interest(AreaLabel, AID).

get_all_area_of_interest(Areas) :-
    findall(X, area_of_interest(X, _), Areas).

% get_minor_for_area(AOI, Minors) :- 
%     is_in_area(MID, AOI),
%     get_minor_name(MID, Minors).

% get_minors_for_area(Area, Minors) :-
%      findall(X, get_minor_for_area(Area, X), Minors).
    
% areas_of_minor(Minor, AOI) :-
%     get_minor_id(Minor, MID),
%     is_in_area(MID, AOI).