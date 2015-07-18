
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





% enlist consecutive duplicates
p9([])              -> [];
p9([ First | Rem ]) -> p9_work(First, Rem, [], []).

p9_work(Current, [],              Box, Extracted) -> lists:reverse([[Current] ++ Box] ++ Extracted);
p9_work(Current, [Current | Rem], Box, Extracted) -> p9_work(Current, Rem, [Current] ++ Box, Extracted);
p9_work(Current, [New     | Rem], Box, Extracted) -> p9_work(New,     Rem, [],               [[Current] ++ Box] ++ Extracted).





% runlength encoding of lists, specifies lists as output, would like tuples; a sad
p10([])              -> [];
p10([ First | Rem ]) -> p10_work(First, Rem, 1, []).

p10_work(Current, [],              L, Extracted) -> lists:reverse([[L,Current]] ++ Extracted);
p10_work(Current, [Current | Rem], L, Extracted) -> p10_work(Current, Rem, L+1, Extracted);
p10_work(Current, [New     | Rem], L, Extracted) -> p10_work(New,     Rem, 1,   [[L,Current]] ++ Extracted).





% modified runlength encoding of lists
p11(List)    -> [ case Length of 1 -> Item; _N -> [Length, Item] end  || [Length, Item] <- p10(List) ].

% decode rle/mrle
p12(MRLE)    -> lists:append([ case I of [Count, Item] -> lists:duplicate(Count, Item); Other -> [Other] end || I <- MRLE ]).

% p13 specifies an implementation detail of p10 which was how i already did it anyway - count, don't box then take length.
p13(L)       -> p10(L).

% duplicate each list item once.
p14(List)    -> lists:append([ [L,L] || L <- List ]).

% given a list and a multiplier, duplicate each list item multiplier times.
p15(List, M) -> lists:append([ lists:duplicate(M, L) || L <- List ]).





% drop nth
p16(List, N) when N > 0 ->
    p16(List, N, []).

p16(List, N, Work) ->
    case length(List) >= N of
        true ->
            {Pref, Suf} = lists:split(N, List),
            p16(Suf, N, [lists:droplast(Pref)] ++ Work);
        false ->
            lists:append(lists:reverse([List] ++ Work))
    end.





% split
p17(List, N) -> lists:split(N, List).

% extract the 1-indexed slice, caps included
p18(List, Start, End) -> {_, S} = lists:split(Start-1, List), {E, _} = lists:split((End+1)-Start, S), E.

% rotate left N
prem(X, Range) -> ((X rem Range) + (2*Range)) rem Range.   % lawl positive modulus
p19(List, Rot) -> {L,R} = lists:split(prem(Rot, length(List)), List), R ++ L.