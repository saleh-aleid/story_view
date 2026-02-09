import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:story_view/utils/text_direction_detector.dart';

void main() {
  group('TextDirectionDetector', () {
    test('detects Arabic as RTL', () {
      expect(TextDirectionDetector.detect('مرحباً'), TextDirection.rtl);
      expect(TextDirectionDetector.detect('السلام عليكم'), TextDirection.rtl);
      expect(TextDirectionDetector.detect('مرحبا بك في عالم القصص'), TextDirection.rtl);
    });
    
    test('detects Hebrew as RTL', () {
      expect(TextDirectionDetector.detect('שלום'), TextDirection.rtl);
      expect(TextDirectionDetector.detect('שלום עולם'), TextDirection.rtl);
    });
    
    test('detects Persian as RTL', () {
      expect(TextDirectionDetector.detect('سلام'), TextDirection.rtl);
      expect(TextDirectionDetector.detect('درود'), TextDirection.rtl);
    });
    
    test('detects English as LTR', () {
      expect(TextDirectionDetector.detect('Hello'), TextDirection.ltr);
      expect(TextDirectionDetector.detect('Hello World'), TextDirection.ltr);
      expect(TextDirectionDetector.detect('Welcome to story view'), TextDirection.ltr);
    });
    
    test('detects other LTR languages correctly', () {
      expect(TextDirectionDetector.detect('Bonjour'), TextDirection.ltr); // French
      expect(TextDirectionDetector.detect('Hola'), TextDirection.ltr); // Spanish
      expect(TextDirectionDetector.detect('Ciao'), TextDirection.ltr); // Italian
      expect(TextDirectionDetector.detect('Hallo'), TextDirection.ltr); // German
      expect(TextDirectionDetector.detect('こんにちは'), TextDirection.ltr); // Japanese
      expect(TextDirectionDetector.detect('你好'), TextDirection.ltr); // Chinese
    });
    
    test('returns LTR for empty string', () {
      expect(TextDirectionDetector.detect(''), TextDirection.ltr);
    });
    
    test('detects based on first character only', () {
      // Mixed content - starts with Arabic
      expect(TextDirectionDetector.detect('مرحباً Hello'), TextDirection.rtl);
      // Mixed content - starts with English
      expect(TextDirectionDetector.detect('Hello مرحباً'), TextDirection.ltr);
    });
    
    test('handles strings with whitespace', () {
      expect(TextDirectionDetector.detect('  مرحباً'), TextDirection.ltr); // starts with space
      expect(TextDirectionDetector.detect('\nمرحباً'), TextDirection.ltr); // starts with newline
    });
    
    test('detects Arabic presentation forms', () {
      // Arabic Presentation Forms-A range (0xFB50 - 0xFDFF)
      expect(TextDirectionDetector.detect('\uFB50'), TextDirection.rtl);
      // Arabic Presentation Forms-B range (0xFE70 - 0xFEFF)
      expect(TextDirectionDetector.detect('\uFE70'), TextDirection.rtl);
    });
  });
}
