import 'dart:io';

void main() {
  try {
    showMenu();
  } catch (e) {
    print("An error occurred: $e");
  }
}

void showMenu() {
  print("Welcome to the Rice Cooker!");

  while (true) {
    print("Choose an option:");
    print("1. Cook rice");
    print("2. Keep warm");
    print("3. Automatic shut-off after cooking");
    print("4. Quit");

    int choice = getUserChoice();

    switch (choice) {
      case 1:
        cookRice();
        break;
      case 2:
        keepWarm();
        break;
      case 3:
        autoShutdown();
        break;
      case 4:
        print("Goodbye!");
        return;
      default:
        print("Invalid option. Please select a valid option.");
        break;
    }
  }
}

int getUserChoice() {
  while (true) {
    stdout.write("Enter the number of your choice: ");
    String? input = stdin.readLineSync();

    try {
      if (input != null) {
        return int.parse(input);
      } else {
        print("Please enter a valid number.");
      }
    } catch (e) {
      print("Please enter a valid number.");
    }
  }
}

void cookRice() {
  print("Starting rice cooking...");

  // Simulation of the rice cooking process
  for (int i = 1; i <= 3; i++) {
    print("Step $i: Cooking in progress...");
    sleep(Duration(seconds: 2)); // Simulates cooking time
  }

  print("Rice is cooked!");
  returnToMenu();
}

void keepWarm() {
  print("Warming mode enabled.");
  // Actual logic for warming mode
  print("Warming in progress...");
  returnToMenu();
}

void autoShutdown() {
  print("Automatic shut-off after cooking.");
  // Actual logic for automatic shut-off
  print("Turning off the rice cooker.");
  returnToMenu();
}

void returnToMenu() {
  stdout.write("Press any key to return to the main menu...");
  stdin.readLineSync();
}
