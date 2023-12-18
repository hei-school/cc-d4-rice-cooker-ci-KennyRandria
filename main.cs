using System;

class RiceCooker
{
    static void Main()
    {
        try
        {
            ShowMenu();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }
    }

    static void ShowMenu()
    {
        Console.WriteLine("Welcome to the Rice Cooker!");

        while (true)
        {
            Console.WriteLine("Choose an option:");
            Console.WriteLine("1. Cook rice");
            Console.WriteLine("2. Keep warm");
            Console.WriteLine("3. Automatic shut-off after cooking");
            Console.WriteLine("4. Quit");

            int choice = GetUserChoice();

            switch (choice)
            {
                case 1:
                    CookRice();
                    break;
                case 2:
                    KeepWarm();
                    break;
                case 3:
                    AutoShutdown();
                    break;
                case 4:
                    Console.WriteLine("Have a nice day!");
                    return;
                default:
                    Console.WriteLine("Invalid option. Please select a valid option.");
                    break;
            }
        }
    }

    static int GetUserChoice()
    {
        int choice;
        while (!int.TryParse(Console.ReadLine(), out choice))
        {
            Console.WriteLine("Please enter a valid number.");
        }
        return choice;
    }

    static void CookRice()
    {
        Console.WriteLine("Starting rice cooking...");

        for (int i = 1; i <= 3; i++)
        {
            Console.WriteLine($"Step {i}: Cooking in progress...");
            System.Threading.Thread.Sleep(2000);
        }

        Console.WriteLine("Rice is cooked!");
        Console.WriteLine("Press any key to return to the main menu...");
        Console.ReadKey();
    }

    static void KeepWarm()
    {
        Console.WriteLine("Warming mode enabled.");
        Console.WriteLine("Warming in progress...");
        ReturnToMenu();
    }

    static void AutoShutdown()
    {
        Console.WriteLine("Automatic shut-off after cooking.");
        Console.WriteLine("Turning off the rice cooker.");
        ReturnToMenu();
    }

    static void ReturnToMenu()
    {
        Console.WriteLine("Press any key to return to the main menu...");
        Console.ReadKey();
    }
}
