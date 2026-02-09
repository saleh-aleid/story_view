import 'package:flutter/material.dart';

/// Utility class for detecting text direction based on content
/// فئة أداة لاكتشاف اتجاه النص بناءً على المحتوى
class TextDirectionDetector {
  /// Detects text direction based on the first character
  /// يكتشف اتجاه النص بناءً على أول حرف
  /// 
  /// Returns [TextDirection.rtl] for RTL languages (Arabic, Hebrew, Persian, Urdu)
  /// Returns [TextDirection.ltr] for LTR languages and empty strings
  static TextDirection detect(String text) {
    if (text.isEmpty) return TextDirection.ltr;
    
    final firstCharCode = text.runes.first;
    
    // RTL Unicode ranges / نطاقات Unicode للغات RTL
    // Hebrew: 0x0590 - 0x05FF
    // Arabic: 0x0600 - 0x06FF
    // Arabic Supplement: 0x0750 - 0x077F
    // Arabic Presentation Forms-A: 0xFB50 - 0xFDFF
    // Arabic Presentation Forms-B: 0xFE70 - 0xFEFF
    
    if ((firstCharCode >= 0x0590 && firstCharCode <= 0x05FF) ||
        (firstCharCode >= 0x0600 && firstCharCode <= 0x06FF) ||
        (firstCharCode >= 0x0750 && firstCharCode <= 0x077F) ||
        (firstCharCode >= 0xFB50 && firstCharCode <= 0xFDFF) ||
        (firstCharCode >= 0xFE70 && firstCharCode <= 0xFEFF)) {
      return TextDirection.rtl;
    }
    
    return TextDirection.ltr;
  }
}
