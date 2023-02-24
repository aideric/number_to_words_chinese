import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_words_chinese/number_to_words_chinese.dart';

void main() {
  group(
    'NumberToWordsChinese Test 1 digit',
    () {
      final Map<int, String> map = {
        0: '零',
        1: '一',
        2: '二',
        3: '三',
        4: '四',
        5: '五',
        6: '六',
        7: '七',
        8: '八',
        9: '九',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 1 digit (negative)',
    () {
      final Map<int, String> map = {
        -1: '負一',
        -2: '負二',
        -3: '負三',
        -4: '負四',
        -5: '負五',
        -6: '負六',
        -7: '負七',
        -8: '負八',
        -9: '負九',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 2 digits',
    () {
      final Map<int, String> map = {
        10: '十',
        11: '十一',
        12: '十二',
        13: '十三',
        14: '十四',
        15: '十五',
        16: '十六',
        17: '十七',
        18: '十八',
        19: '十九',
        20: '二十',
        21: '二十一',
        22: '二十二',
        23: '二十三',
        24: '二十四',
        25: '二十五',
        26: '二十六',
        27: '二十七',
        28: '二十八',
        29: '二十九',
        30: '三十',
        31: '三十一',
        32: '三十二',
        33: '三十三',
        34: '三十四',
        35: '三十五',
        36: '三十六',
        37: '三十七',
        38: '三十八',
        39: '三十九',
        40: '四十',
        41: '四十一',
        42: '四十二',
        43: '四十三',
        44: '四十四',
        45: '四十五',
        46: '四十六',
        47: '四十七',
        48: '四十八',
        49: '四十九',
        50: '五十',
        51: '五十一',
        52: '五十二',
        53: '五十三',
        54: '五十四',
        55: '五十五',
        56: '五十六',
        57: '五十七',
        58: '五十八',
        59: '五十九',
        60: '六十',
        61: '六十一',
        62: '六十二',
        63: '六十三',
        64: '六十四',
        65: '六十五',
        66: '六十六',
        67: '六十七',
        68: '六十八',
        69: '六十九',
        70: '七十',
        71: '七十一',
        72: '七十二',
        73: '七十三',
        74: '七十四',
        75: '七十五',
        76: '七十六',
        77: '七十七',
        78: '七十八',
        79: '七十九',
        80: '八十',
        81: '八十一',
        82: '八十二',
        83: '八十三',
        84: '八十四',
        85: '八十五',
        86: '八十六',
        87: '八十七',
        88: '八十八',
        89: '八十九',
        90: '九十',
        91: '九十一',
        92: '九十二',
        93: '九十三',
        94: '九十四',
        95: '九十五',
        96: '九十六',
        97: '九十七',
        98: '九十八',
        99: '九十九',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 3 digits',
    () {
      final Map<int, String> map = {
        100: '一百',
        101: '一百零一',
        110: '一百一十',
        111: '一百一十一',
        -123: '負一百二十三',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 4 digits',
    () {
      final Map<int, String> map = {
        1000: '一千',
        1001: '一千零一',
        1010: '一千零一十',
        1011: '一千零一十一',
        1100: '一千一百',
        1101: '一千一百零一',
        1110: '一千一百一十',
        1111: '一千一百一十一',
        -1234: '負一千二百三十四',
        -4321: '負四千三百二十一',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 5 digits',
    () {
      final Map<int, String> map = {
        10000: '一萬',
        10001: '一萬零一',
        10010: '一萬零一十',
        10011: '一萬零一十一',
        10100: '一萬零一百',
        10101: '一萬零一百零一',
        10110: '一萬零一百一十',
        10111: '一萬零一百一十一',
        11000: '一萬一千',
        11001: '一萬一千零一',
        11010: '一萬一千零一十',
        11011: '一萬一千零一十一',
        11100: '一萬一千一百',
        11101: '一萬一千一百零一',
        11110: '一萬一千一百一十',
        11111: '一萬一千一百一十一',
        -12345: '負一萬二千三百四十五',
        -54321: '負五萬四千三百二十一',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 6 digits',
    () {
      final Map<int, String> map = {
        100000: '十萬',
        200000: '二十萬',
        -100000: '負十萬',
        -200000: '負二十萬',
        123456: '十二萬三千四百五十六',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 7 digits',
    () {
      final Map<int, String> map = {
        1000000: '一百萬',
        2000000: '二百萬',
        -1000000: '負一百萬',
        -2000000: '負二百萬',
        1234567: '一百二十三萬四千五百六十七',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 8 digits',
    () {
      final Map<int, String> map = {
        10000000: '一千萬',
        20000000: '二千萬',
        -10000000: '負一千萬',
        -20000000: '負二千萬',
        12345678: '一千二百三十四萬五千六百七十八',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 9 digits',
    () {
      final Map<int, String> map = {
        100000000: '一億',
        200000000: '二億',
        -100000000: '負一億',
        -200000000: '負二億',
        123456789: '一億二千三百四十五萬六千七百八十九',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test 10 digits',
    () {
      final Map<int, String> map = {
        1000000000: '十億',
        2000000000: '二十億',
        -1000000000: '負十億',
        -2000000000: '負二十億',
        1234567891: '十二億三千四百五十六萬七千八百九十一',
      };
      for (MapEntry<int, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese Test double',
    () {
      final Map<double, String> map = {
        0.0: '零',
        1.1: '一點一',
        2.2: '二點二',
        3.3: '三點三',
        4.4: '四點四',
        5.5: '五點五',
        6.6: '六點六',
        7.7: '七點七',
        8.8: '八點八',
        9.9: '九點九',
        9.99: '九點九九',
        9.999: '九點九九九',
        9.9999: '九點九九九九',
        9.0900: '九點零九',
        9.0909: '九點零九零九',
        9.0009: '九點零零零九',
        -9.8765: '負九點八七六五',
      };
      for (MapEntry<double, String> mapEntry in map.entries) {
        test(
          'Test ${mapEntry.key}',
          () {
            expect(
              NumberToWordsChinese.convert(mapEntry.key),
              mapEntry.value,
            );
          },
        );
      }
    },
  );

  group(
    'NumberToWordsChinese',
    () {
      test(
        'Test 999999',
        () {
          expect(
            NumberToWordsChinese.convert(999999),
            '九十九萬九千九百九十九',
          );
        },
      );
      test(
        'Test 1001',
        () {
          expect(
            NumberToWordsChinese.convert(1001),
            '一千零一',
          );
        },
      );
      test(
        'Test 9223372036854775807',
        () {
          expect(
            NumberToWordsChinese.convert(9223372036854775807),
            '九百二十二京三千三百七十二兆零三百六十八億五千四百七十七萬五千八百零七',
          );
        },
      );
      test(
        'Test -9223372036854775807',
        () {
          expect(
            NumberToWordsChinese.convert(-9223372036854775807),
            '負九百二十二京三千三百七十二兆零三百六十八億五千四百七十七萬五千八百零七',
          );
        },
      );
      // test(
      //   'Test -9223372036854775808',
      //   () {
      //     expect(
      //       NumberToWordsChinese.convert(-9223372036854775808),
      //       '零',
      //     );
      //   },
      // );
      test(
        'Test 0',
        () {
          expect(
            NumberToWordsChinese.convert(0),
            '零',
          );
        },
      );
      test(
        'Test -0',
        () {
          expect(
            NumberToWordsChinese.convert(-0),
            '零',
          );
        },
      );
    },
  );
}
