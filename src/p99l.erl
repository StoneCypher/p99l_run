
-module(p99l).

% speed run.  shameless answers if correct.





-compile(export_all).





% find the last element of a list
p1(List)    -> lists:last(List).

% find the last-but-one element of a list
p2(List)    -> lists:nth(length(List) - 1, List).

% find the kth element of a list
p3(K, List) -> lists:nth(K, List).

% count the elements in a list
p4(List)    -> length(List).

% reverse a list
p5(List)    -> lists:reverse(List).

% test for palindrome
p6(List)    -> lists:reverse(List) == List.

