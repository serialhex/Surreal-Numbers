# Surreal Numbers

## Forms
A form is a pair of sets of surreal numbers, called its left set and its right set. A form with left set L and right set R is written { L | R }. When L and R are given as lists of elements, the braces around them are omitted.
Either or both of the left and right set of a form may be the empty set. The form { { } | { } } with both left and right set empty is also written { | }.

## Construction Rule
A form { L | R } is numeric if the intersection of L and R is the empty set and each element of R is greater than every element of L, according to the order relation ≤ given by the comparison rule below.

## Equivalence Rule
Two numeric forms x and y are forms of the same number (lie in the same equivalence class) if and only if both x ≤ y and y ≤ x. (In layman's terms: if neither number is greater or less than the other, they must be equal.)

## Order
The recursive definition of surreal numbers is completed by defining comparison:
Given numeric forms x = { XL | XR } and y = { YL | YR }, x ≤ y if and only if:

* there is no  such that y ≤  (every element in the left part of x is smaller than y), and
* there is no xL such that  ≤ x (every element in the right part of y is bigger than x).

A comparison y ≤ c between a form y and a surreal number c is performed by choosing a form z from the equivalence class c and evaluating y ≤ z; and likewise for c ≤ x and for comparison b ≤ c between two surreal numbers.
