using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            //1
            string input = "123c";
            try
            {
                int result = Convert.ToInt32(input);
                Console.WriteLine($"Converted integer: {result}");
            }
            catch (FormatException)
            {
                Console.WriteLine("Error: The string contains non-numeric characters and cannot be converted to an integer.");
            }
            //2
            string word = "Hello World!";
            //Substring(startIndex, length)
            string substring = word.Substring(4, 5);
            Console.WriteLine($"Extracted substring is {substring}");

            //3
            string string1 = "Arwa";
            string string2 = "Zakria";
            string combinestring = string1 + " " + string2;
            Console.WriteLine(combinestring);
            
            //4 
            Console.WriteLine("Enter the temprature please : ");
            int temprature = int.Parse(Console.ReadLine());
            string actualresult = temprature < 10 ? "Just Cold" :
                            temprature > 30 ? "Just Hot" :
                            "Just Hot";
            Console.WriteLine($"Temperature Status: {actualresult}");
            Console.ReadKey();
        }
        
    }
}
