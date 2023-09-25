# Monotonic stack

## Tips

1. If we encounter keywords ```subarray``` and ```minimum / maximum``` -> use a monotonic stack
2. Try dividing the task into several smaller ones and apply the third tip
3. For every task where a monotonic stack can be used, start your reasoning with a phrase 
**let's do something for each element**

## How to use a monotonic stack to find ranges for an element

<font color="red">Hard</font> [:own-leetcode: 1063. Number of Valid Subarrays](https://leetcode.com/problems/number-of-valid-subarrays/)

<font color="orange">Medium</font> [:own-leetcode: 907. Sum of Subarray Minimums](https://leetcode.com/problems/sum-of-subarray-minimums/)

<font color="orange">Medium</font> [:own-leetcode: 2104. Sum of Subarray Ranges](https://leetcode.com/problems/sum-of-subarray-ranges/)

---

It's pretty simple to use a ```monotonic stack``` to find ranges.

For example, we have an array like ```[8, 6, 3, 5, 4, 9, 2]```.

How to determine the range in which an element is minimum?

For example, for the element ```4``` it's ```(3, 5, 4, 9, 2)```.

The solution is:

```kotlin
// let's assume that we have an array "arr" of integer numbers
// let's assume that we have a stack that is created through LinkedList<Int>()

for (i in 0 .. arr.size) {
    while (!stack.isEmpty() && (i == arr.size || arr[stack.peek()] >= arr[i])) {
        val middle = stack.pop()
        val left = if (stack.isEmpty()) -1 else stack.peek()
        val right = i
        val count = (middle - left) * (right - middle) // here we count the number of ranges
    }
    stack.push(i)
}
```

So let's iterate through ```[8, 6, 3, 5, 4, 9, 2]```:
```text
i = 0, stack = []
i = 1, stack = [8]
i = 2, stack = [6], because 8 > 6 and here we find out a range for 8 (-1, 8, 6)
i = 3, stack = [3], because 6 > 3 and here we find out a range for 6 (-1, 6, 3)
i = 4, stack = [3, 5]
i = 5, stack = [3, 4], because 5 > 4 and here we find out a range for 5 (3, 5, 4)
i = 6, stack = [3, 4, 9]
i = 7, stack = [2], because 3, 4, 9 > 2 and here:

we find out a range for 9 (4, 9, 2)
we find out a range for 4 (3, .., 4, .., 2)
we find out a range for 3 (-1, 3, .., 2)
we find out a range for 2 (-1, 2, -1)
```
