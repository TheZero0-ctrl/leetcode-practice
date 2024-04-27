# leetcode-practise

## Hash Table
- [login-mayhem](https://github.com/TheZero0-ctrl/leetcode-practice/tree/main/login-mayhem)
- [uniq-snowflakes](https://github.com/TheZero0-ctrl/leetcode-practice/tree/main/uniq-snowflakes)

## Binary Trees
> A binary tree is a hierarchical data structure composed of nodes, where each node has at most two children, commonly referred to as the "left" child and the "right" child.
- Node at the top referred as the root node
- Any node that has no children is called a leaf node
- Height of a tree is the number of edges in the longest path from the root node to a leaf node
- Full binary tree is a binary tree in which every node has either zero or two children
- [binary-search-tree](https://github.com/TheZero0-ctrl/leetcode-practice/tree/main/bst)
- [halloween-haul](https://github.com/TheZero0-ctrl/leetcode-practice/tree/main/halloween-haul)

## Tree
- [descendant-distance](https://github.com/TheZero0-ctrl/leetcode-practice/tree/main/descendant-distance)

## Memoization and Dynamic Programming
These four steps offer a general plan for tackling many other optimization problems.
1. Structure of Optimal Solutions:
  - Break down the main problem into smaller subproblems.
  - Example: In Burger Fervor, decompose the problem by considering the final burger consumed.
  - Subproblems: Filling t – m minutes or t – n minutes, depending on the duration of the final burger.
  - Subproblems must be smaller than the original problem.
  - Ensures reaching a base case eventually.
  - Optimal solution to a problem contains optimal solutions to its subproblems.
  - Example: In Burger Fervor, optimal solution for t includes optimal solution for t – m or t – n minutes.
  - Example with m = 4, n = 9, and t = 54.
  - Optimal solution S includes a 9-minute burger and an optimal solution for 45 minutes.
  - Suboptimal solutions for subproblems result in suboptimal overall solutions.
  - Problems with optimal substructure are suitable for memoization or dynamic programming.
2. Step 2: Recursive Solution:**
  - Step 1 indicates the potential for memoization and dynamic programming to solve the problem efficiently.
  - Step 1 not only hints at memoization and dynamic programming but also presents a recursive approach.
  - The recursive approach involves trying each possibility for an optimal solution and solving subproblems optimally using recursion.
  - In Burger Fervor: An optimal solution for exactly t minutes could involve either an m-minute burger and an optimal solution for t – m minutes or an n-minute burger and an optimal solution for t – n minutes.
  - Recursion is employed to solve the smaller subproblems of t – m and t – n.
  - Recursion is necessary as subproblems (t – m and t – n) are smaller than the original problem t.
  - The number of recursive calls varies based on the number of candidate solutions competing for optimality.
3. Step 3: Memoization:
  - Despite having a correct solution from Step 2, execution time might be unreasonably high.
  - This inefficiency arises due to the repetition of solving the same subproblems, known as overlapping subproblems.
  - Memoization becomes necessary when there are overlapping subproblems.
  - Overlapping subproblems occur when solving one subproblem requires solving another subproblem multiple times.
  - Memoization involves storing the solution to a subproblem the first time it's solved.
  - Subsequently, when the same subproblem arises again, its solution is retrieved from memory rather than recalculating it.
4. Step 4: Dynamic Programming:**
  - The solution achieved in Step 3 typically addresses efficiency concerns adequately.
  - Sometimes, there's a preference to eliminate recursion altogether.
  - Dynamic programming replaces recursion with a systematic approach, solving subproblems in a specific order from smallest to largest.
  - It utilize loops instead of recursion.
  - All subproblems are explicitly solved in order of increasing size.
  - Both techniques are often equivalent in efficiency for many problems.
  - Choice between them depends on personal preference and problem complexity.
  - Memoization solves subproblems on demand, while dynamic programming solves all subproblems systematically.
  - Consider the Burger Fervor test case with burgers taking 2 and 4 minutes to eat, and 90 minutes available.
  - Memoization avoids solving subproblems for odd numbers of minutes that don't result from subtracting multiples of 2 and 4 from 90.
  - Dynamic programming, on the other hand, solves all subproblems up to 90.
  - Memoization might be faster if large portions of the subproblem space remain unused.
  - However, the recursive overhead should be balanced against this advantage.
  - Experimentation with both solutions can determine which is more efficient for a given problem.
  - Memoized solutions are often termed "top-down" solutions.
  - Dynamic programming solutions are referred to as "bottom-up" solutions.
  - "Top-down" involves recursion from large subproblems to small ones, while "bottom-up" starts with the smallest subproblems and progresses upward.
- [burger-fervor](https://github.com/TheZero0-ctrl/leetcode-practice/tree/main/burger-fervor)
- [hockey-rivalry](https://github.com/TheZero0-ctrl/leetcode-practice/tree/main/hockey-rivalry)

