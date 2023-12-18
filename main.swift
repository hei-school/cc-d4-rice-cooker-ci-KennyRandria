import Foundation

class RiceCooker {
    var inputStream: InputStream
    var output: String = ""

    init(inputStream: InputStream) {
        self.inputStream = inputStream
    }

    func main() {
        do {
            try showMenu()
        } catch {
            print("An error occurred: \(error)")
        }
    }

    func showMenu() throws {
        print("Welcome to the Rice Cooker!")

        while true {
            print("Choose an option:")
            print("1. Cook rice")
            print("2. Keep warm")
            print("3. Automatic shut-off after cooking")
            print("4. Quit")

            guard let choice = Int(readLine() ?? "") else {
                print("Please enter a valid number.")
                continue
            }

            switch choice {
            case 1:
                try cookRice()
            case 2:
                keepWarm()
            case 3:
                autoShutdown()
            case 4:
                print("Goodbye!")
                return
            default:
                print("Invalid option. Please select a valid option.")
            }
        }
    }

    func cookRice() throws {
        print("Starting rice cooking...")

        for i in 1...3 {
            print("Step \(i): Cooking in progress...")
            Thread.sleep(forTimeInterval: 2)
        }

        print("Rice is cooked!")
        returnToMenu()
    }

    func keepWarm() {
        print("Warming mode enabled.")
        print("Warming in progress...")
        returnToMenu()
    }

    func autoShutdown() {
        print("Automatic shut-off after cooking.")
        print("Turning off the rice cooker.")
        returnToMenu()
    }

    func returnToMenu() {
        print("Press any key to return to the main menu...")
        _ = readLine()
    }
}

let riceCooker = RiceCooker(inputStream: FileHandle.standardInput)
riceCooker.main()
