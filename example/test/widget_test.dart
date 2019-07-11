import 'package:chip_list_choice_example/ChipListSample1.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chip_list_choice/ChipListChoice.dart';

void main() {
  const MethodChannel channel = MethodChannel('chip_list_choice');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  testWidgets('ChipList Choice Test', (WidgetTester tester) async {
    await tester.pumpWidget(ChipListSample1());
  });
}
