import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluiap/fluiap.dart';

void main() {
  const MethodChannel channel = MethodChannel('fluiap');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Fluiap.platformVersion, '42');
  });
}
