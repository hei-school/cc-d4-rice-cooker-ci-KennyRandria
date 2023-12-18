import 'package:test/test.dart';
import 'dart:io';
import 'main.dart';

void main() {
  group('Rice Cooker Tests', () {
    test('Test showMenu', () {
      final riceCooker = RiceCooker(MockInputStream());
      final output = capturePrint(() {
        riceCooker.showMenu();
      });

      expect(output, contains('Welcome to the Rice Cooker!'));
    });

    test('Test cookRice', () {
      final riceCooker = RiceCooker(MockInputStream());
      final output = capturePrint(() {
        riceCooker.cookRice();
      });

      expect(output, contains('Rice is cooked!'));
    });
  });
}

class MockInputStream extends InputStream {
  @override
  String? readLineSync({bool retainNewlines = false}) {
    return '1\n';
  }
}

String capturePrint(void Function() testFunction) {
  final spec = ZoneSpecification(print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
    capturedOutput.add(line);
  });

  return Zone.current.fork(specification: spec).run<String>(() {
    testFunction();
    return capturedOutput.join('\n');
  });
}

final capturedOutput = <String>[];
