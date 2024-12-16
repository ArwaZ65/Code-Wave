# Day 9 Tasks - C# Program

This document provides solutions and explanations for four common C# programming tasks:

### Task 1: Convert String to Integer with Non-Numeric Characters
Problem
-Write a program that attempts to convert a string containing non-numeric characters to an integer. If the string cannot be converted, handle the exception and display an error message.
  code
  ```
        string input = "123abc";
        try
        {
            int result = Convert.ToInt32(input);
            Console.WriteLine($"Converted integer: {result}");
        }
        catch (FormatException)
        {
            Console.WriteLine("Error: The string contains non-numeric characters and cannot be converted to an integer.");
        }
  ```
-I use error handling for string-to-integer conversion when the input string contains invalid characters.
-If the input is not a valid number, a FormatException is thrown and caught, and an appropriate error message is displayed.

### Task 2:Extract a Substring from a String
-Write a program to extract a substring from a given string based on a specified start index and length.
```
             string word = "Hello World!";
            //Substring(startIndex, length)
            string substring = word.Substring(4, 5);
            Console.WriteLine($"Extracted substring is {substring}");
```
-Uses the Substring() method to extract a portion of the string.
-Substring function take 2 parameters (startindex,length)
-The program specifies the starting index and the number of characters to extract.

### Task 3:Combine Two Strings into One
-Write a program that takes two string variables and combines them into a single string with a space in between.
```
           string string1 = "Arwa";
            string string2 = "Zakria";
            string combinestring = string1 + " " + string2;
            Console.WriteLine(combinestring);
```
-Concatenates two strings using the + operator and includes a space between them.

### Task 4: Temperature Check Using Ternary Operator
-Write a program that checks if the temperature is:

--Below 10 degrees: "Just Cold"
--Above 30 degrees: "Just Hot"
--Between 10 and 30 degrees (inclusive): "Just Good"
```
           Console.WriteLine("Enter the temprature please : ");
            int temprature = int.Parse(Console.ReadLine());
            string actualresult = temprature < 10 ? "Just Cold" :
                            temprature > 30 ? "Just Hot" :
                            "Just Hot";
            Console.WriteLine($"Temperature Status: {actualresult}");
```
-Uses nested ternary operators to simplify multiple conditions.
-Depending on the temperature input, the program assigns one of three statuses: "Just Cold", "Just Hot", or "Just Good".
-Ternary operator is (condition ? expression_if_true : expression_if_false;).

