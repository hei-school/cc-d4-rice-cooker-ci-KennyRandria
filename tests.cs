using System;
using System.IO;
using NUnit.Framework;

[TestFixture]
public class Tests
{
    [Test]
    public void TestShowMenu()
    {
        string output = CaptureConsoleOutput(() => RiceCooker.ShowMenu());
        StringAssert.Contains("Welcome to the Rice Cooker!", output);
    }

    [Test]
    public void TestCookRice()
    {
        string input = "1\n";
        using (var sw = new StringWriter())
        {
            Console.SetOut(sw);
            Console.SetIn(new StringReader(input));

            RiceCooker.HandleUserChoice(RiceCooker.GetUserChoice());
            string output = sw.ToString();

            StringAssert.Contains("Starting rice cooking...", output);
            StringAssert.Contains("Rice is cooked!", output);
        }
    }

    [Test]
    public void TestKeepWarm()
    {
        string output = CaptureConsoleOutput(() => RiceCooker.KeepWarm());
        StringAssert.Contains("Warming mode enabled.", output);
    }

    [Test]
    public void TestAutoShutdown()
    {
        string output = CaptureConsoleOutput(() => RiceCooker.AutoShutdown());
        StringAssert.Contains("Automatic shut-off after cooking.", output);
    }

    [Test]
    public void TestReturnToMenu()
    {
        string output = CaptureConsoleOutput(() => RiceCooker.ReturnToMenu());
        StringAssert.Contains("Press any key to return to the main menu...", output);
    }

    private string CaptureConsoleOutput(Action action)
    {
        using (var sw = new StringWriter())
        {
            Console.SetOut(sw);
            action.Invoke();
            return sw.ToString();
        }
    }
}
