
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

% flatten
p7(DList)   -> lists:flatten(DList).





% eliminate consecutive duplicates
p8([])              -> [];
p8([ First | Rem ]) -> p8_work(First, Rem, []).

p8_work(Current, [],              Extracted) -> lists:reverse([Current] ++ Extracted);
p8_work(Current, [Current | Rem], Extracted) -> p8_work(Current, Rem, Extracted);
p8_work(Current, [New     | Rem], Extracted) -> p8_work(New,     Rem, [Current] ++ Extracted).
