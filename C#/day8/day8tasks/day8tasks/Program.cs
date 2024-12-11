using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace day8tasks
{
    class Program
    {
        static void Main(string[] args)
        {
            //Task1 
            int num1, num2,sum;
            Console.WriteLine("Enter first number");
            num1=int.Parse(Console.ReadLine());
            Console.WriteLine("Enter second number");
            num2=int.Parse(Console.ReadLine());
            sum = num1 + num2;
            Console.WriteLine($"The sum of {num1} and {num2} is {sum}.");
            //Task2
            Console.WriteLine($"Result of -1 + 4 * 6 is {-1 + 4 * 6}");
            Console.WriteLine($"Result of ( 35+ 5 ) % 7 is {(35 + 5) % 7}");
            Console.WriteLine($"Result of  14 + -4 * 6 / 11 is { 14 + -4 * 6 / 11}");
            Console.WriteLine($"Result of  2 + 15 / 6 * 1 - 7 % 2 is { 2 + 15 / 6 * 1 - 7 % 2}");
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

            Console.ReadKey();
        }
    }
}
