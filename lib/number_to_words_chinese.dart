library number_to_words_chinese;

/// Convert number to chinese words.
class NumberToWordsChinese {
  NumberToWordsChinese._();

  /// Covert number to chinese words.
  static String convert(num num) {
    // if (num == -9223372036854775808) {
    //   return _zero;
    // }
    final StringBuffer stringBuffer = StringBuffer();
    if (num < 0) {
      stringBuffer.write(_negative);
      num = num.abs();
    }
    stringBuffer.write(_intToChinese(num.toInt()));
    stringBuffer.write(_doubleToChinese(num.toDouble()));
    return stringBuffer.toString();
  }

  /// Covert int number to chinese words.
  static String _intToChinese(int num) {
    String str = '';
    int n = num.abs();

    if (n == 0) {
      return _zero;
    }

    List<String> unitsListCopy = _unitList.toList();
    while (n > 0) {
      final unit = unitsListCopy.removeAt(0);
      final int digit = n % 10;
      str = _digitList[digit] + unit + str;
      n = n ~/ 10;
    }

    final smallUnit = _unitList[1] + _unitList[2] + _unitList[3];
    final bigUnit = _unitList[4] +
        _unitList[8] +
        _unitList[12] +
        _unitList[16] +
        _unitList[20];
    const zero = _zero;

    str = str.replaceAllMapped(
      RegExp("($zero)[$smallUnit]"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp("([$bigUnit])[^$smallUnit]+([$bigUnit])"),
      (match) {
        return match.group(1)! + zero;
      },
    ).replaceAllMapped(
      RegExp("([$smallUnit])$zero+([$bigUnit])"),
      (match) {
        return match.group(1)! + match.group(2)! + zero;
      },
    ).replaceAllMapped(
      RegExp("($zero)+"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp(zero + r"+$"),
      (match) {
        return '';
      },
    ).replaceAllMapped(
      RegExp("^${_digitList[1]}${_unitList[1]}"),
      (match) {
        return _unitList[1];
      },
    );
    return str;
  }

  /// Covert decimal number to chinese words.
  static String _doubleToChinese(double num) {
    if (num % 1 == 0) return '';

    String str = '';
    final String n = num.abs().toString().split('.').last;
    final List<String> nSplit = n.split('');
    for (String i in nSplit) {
      str += _digitList[int.parse(i)];
    }

    return _dot + str;
  }
}

/// Chinese zero
const String _zero = '零';

/// Chinese digit list from 0 - 9
const List<String> _digitList = [
  _zero,
  '一',
  '二',
  '三',
  '四',
  '五',
  '六',
  '七',
  '八',
  '九',
];

/// Chinese unit list
const List<String> _unitList = [
  '',
  '十',
  '百',
  '千',
  '萬',
  '十',
  '百',
  '千',
  '億',
  '十',
  '百',
  '千',
  '兆',
  '十',
  '百',
  '千',
  '京',
  '十',
  '百',
  '千',
  '垓',
];

/// Chinese negative
const String _negative = '負';

/// Chinese dot
const String _dot = '點';
