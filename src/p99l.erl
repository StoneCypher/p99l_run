
-module(p99l).

% speed run.  shameless answers if correct.





-export([

    p1/1,
    p2/1

]).





% find the last element of a list
p1(List) -> lists:last(List).

% find the last-but-one element of a list
p2(List) -> lists:nth(length(List) - 1, List).
