# Monotonic stack


## How to use monotonic stack to find boundaries for an element

[:own-leetcode: 907. Sum of Subarray Minimums](https://leetcode.com/problems/sum-of-subarray-minimums/)

It's pretty simple to use ```monotonic stack``` to find boundaries.

For example, we have an array like ```[8, 6, 3, 5, 4, 9, 2]```.

How to determine the range in which an element is minimum?

For example, for the element ```4``` it's ```[3, 5, 4, 9, 2]```.

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
i = 2, stack = [6], because 8 > 6 and here we find out the range for 8 (-1, 8, 6)
i = 3, stack = [3], because 6 > 3 and here we find out the range for 6 (-1, 6, 3)
i = 4, stack = [3, 5]
i = 5, stack = [3, 4], because 5 > 4 and here we find out the range for 5 (3, 5, 4)
i = 6, stack = [3, 4, 9]
i = 7, stack = [2], because 3, 4, 9 > 2 and here:

we find out the range for 9 (4, 9, 2)
we find out the range for 4 (3, .., 4, .., 2)
we find out the range for 3 (-1, 3, .., 2)
we find out the range for 2 (-1, 2, -1)
```
