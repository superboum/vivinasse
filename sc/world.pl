:- use_module(library(clpr)).

dangerous(jumptown).

safe(Place, dangerous) :- place(Place), dangerous(Place).
safe(Place, safe) :- place(Place), \+ dangerous(Place).

safety(safe, safe, safe).
safety(_, dangerous, dangerous).
safety(dangerous, _, dangerous).

buyableCargo(Cost, SCU, MaxUEC, CanBuy) :-
  {
    CanBuy =< SCU * 100,
    CanBuy =< MaxUEC / Cost,
    Cost >= 0, MaxUEC >= 0, SCU >= 0, CanBuy >= 0
  }.

expectableProfit(Bought, CostBuy, CostSell, Profit) :-
  {
    Profit = Bought * (CostSell - CostBuy),
    Bought >= 0, CostSell >= 0, CostBuy >= 0
  }.

trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  buy(Departure, Merchandise, CostBuy),
  sell(Arrival, Merchandise, CostSell),
  buyableCargo(CostBuy, SCU, MaxUEC, CanBuy),
  expectableProfit(CanBuy, CostBuy, CostSell, Profit).

twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  trip(Departure, Arrival, Merchandise1, CanBuy1, SCU, MaxUEC, Profit1),
  trip(Arrival, Departure, Merchandise2, CanBuy2, SCU, MaxUEC + Profit1, Profit2),
  {
    FinalProfit = Profit1 + Profit2
  }.
