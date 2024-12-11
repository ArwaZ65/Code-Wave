# Day 8 Tasks - C# Program

This C# program performs the following tasks:

### Task 1: Calculate the Sum of Two Numbers
- The program prompts the user to enter two integers.
- It then calculates the sum of the two numbers and displays the result in the format:  
  `The sum of {num1} and {num2} is {sum}.`
  code
  ```
              //Task1 
            int num1, num2,sum;
            Console.WriteLine("Enter first number");
            num1=int.Parse(Console.ReadLine());
            Console.WriteLine("Enter second number");
            num2=int.Parse(Console.ReadLine());
            sum = num1 + num2;
            Console.WriteLine($"The sum of {num1} and {num2} is {sum}.");
  ```

### Task 2: Evaluate Simple Mathematical Expressions
- The program evaluates several mathematical expressions and displays the results:
  - `Result of -1 + 4 * 6`
  - `Result of (35 + 5) % 7`
  - `Result of 14 + -4 * 6 / 11`
  - `Result of 2 + 15 / 6 * 1 - 7 % 2`

These expressions demonstrate basic arithmetic operations and operator precedence.
code
```
//Task2
            Console.WriteLine($"Result of -1 + 4 * 6 is {-1 + 4 * 6}");
            Console.WriteLine($"Result of ( 35+ 5 ) % 7 is {(35 + 5) % 7}");
            Console.WriteLine($"Result of  14 + -4 * 6 / 11 is { 14 + -4 * 6 / 11}");
            Console.WriteLine($"Result of  2 + 15 / 6 * 1 - 7 % 2 is { 2 + 15 / 6 * 1 - 7 % 2}");
```

### Task 3: Compare Three Numbers
- The program prompts the user to input three integers (`a`, `b`, `c`).
- It then evaluates the following:
  1. **Largest Number Check**: Determines if each of the three numbers is the largest by comparing it with the other two.
  2. **Equality Check**: Checks if all three numbers are equal.
  3. **Sum Equality Check**: Verifies if the sum of any two numbers equals the third number.

For each of these checks, the program outputs the results in a boolean format (true or false).
code
```
//Task3
            int a, b, c;
            Console.WriteLine("Enter firse number a");
            a = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter sec number b");
            b = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter third number c");
            c = int.Parse(Console.ReadLine());
            //a biggest
            bool isFirstLargest = (a > b) && (a > c);
            Console.WriteLine($"Is the first number the largest? {isFirstLargest}");
            //b biggest
            bool isSecodLargest = (b > a) && (b > c);
            Console.WriteLine($"Is the second number the largest? {isSecodLargest}");
            //c biggest
            bool isThirdLargest = (c > b) && (c > a);
            Console.WriteLine($"Is the third number the largest? {isThirdLargest}");
            //a=b=c
            bool isEqual = (a == b) && (b == c);
            Console.WriteLine($"Are all numbers is equal ? {isEqual}");
            //a+b=c ||b+c=a || a+c=b
            bool isSumEqual = (a + b == c) || (b + c == a) || (a + c == b);
            Console.WriteLine($"Do any two numbers sum up to the third? {isSumEqual}");
```

### Program Flow:
1. User inputs values for two numbers in Task 1.
2. User inputs values for three numbers in Task 3.
3. The program evaluates and outputs the results of mathematical expressions and number comparisons.

The program ends when the user presses any key.

---

### Sample Output:
