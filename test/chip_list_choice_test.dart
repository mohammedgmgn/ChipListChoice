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

  test('getPlatformVersion', () async {
    expect(await ChipListChoice.platformVersion, '42');
  });
}
