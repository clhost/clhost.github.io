# Backtracking

## How to avoid duplicates working with backtracking

<font color="orange">Medium</font> [:own-leetcode: 90. Subsets II](https://leetcode.com/problems/subsets-ii/)

<font color="orange">Medium</font> [:own-leetcode: 40. Combination Sum II](https://leetcode.com/problems/combination-sum-ii/)

---

One of the basic ideas for avoiding duplication involves sorting.

For example, we are given an array ```candidates = [10,1,2,7,6,1,5]``` and a ```target = 8```.

How to find all unique combinations in candidates where the candidate numbers sum to target?

In here we have to avoid duplicates, for example, if we found ```[1,2,5]``` we have to avoid ```[2,1,5]```.

The solution is:

```kotlin
// sort an array
// inside the loop of the backtracking recursive function
if (i != start && array[i] == array[start]) {
    continue
}
```
