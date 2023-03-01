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
    stringBuffer.write(_doubleToChinese(num));
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

    const smallUnit = _ten + _hundred + _thousand;
    const bigUnit = _tenThousand +
        _hundredMillion +
        _trillion +
        _tenQuadrillion +
        _hundredQuintillion;

    str = str.replaceAllMapped(
      RegExp("($_zero)[$smallUnit]"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp("([$bigUnit])[^$smallUnit]+([$bigUnit])"),
      (match) {
        return match.group(1)! + _zero;
      },
    ).replaceAllMapped(
      RegExp("([$smallUnit])$_zero+([$bigUnit])"),
      (match) {
        return match.group(1)! + match.group(2)! + _zero;
      },
    ).replaceAllMapped(
      RegExp("($_zero)+"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp(_zero + r"+$"),
      (match) {
        return '';
      },
    ).replaceAllMapped(
      RegExp("^$_one$_ten"),
      (match) {
        return _ten;
      },
    );
    return str;
  }

  /// Covert decimal number to chinese words.
  static String _doubleToChinese(num num) {
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

/// Chinese number to words constant

/// Chinese zero (0)
const String _zero = '零';

/// Chinese one (1)
const String _one = '一';

/// Chinese two (2)
const String _two = '二';

/// Chinese three (3)
const String _three = '三';

/// Chinese four (4)
const String _four = '四';

/// Chinese five (5)
const String _five = '五';

/// Chinese six (6)
const String _six = '六';

/// Chinese seven (7)
const String _seven = '七';

/// Chinese eight (8)
const String _eight = '八';

/// Chinese nine (9)
const String _nine = '九';

/// Chinese digit list from 0 - 9
const List<String> _digitList = [
  _zero,
  _one,
  _two,
  _three,
  _four,
  _five,
  _six,
  _seven,
  _eight,
  _nine,
];

/// Chinese ten (10)
const String _ten = '十';

/// Chinese hundred (100)
const String _hundred = '百';

/// Chinese thousand (1000)
const String _thousand = '千';

/// Chinese ten thousand (10000)
const String _tenThousand = '萬';

/// Chinese hundred million (100000000)
const String _hundredMillion = '億';

/// Chinese trillion (1000000000000)
const String _trillion = '兆';

/// Chinese ten quadrillion (10000000000000000)
const String _tenQuadrillion = '京';

/// Chinese hundred quintillion (100000000000000000000)
const String _hundredQuintillion = '垓';

/// Chinese unit list
const List<String> _unitList = [
  '',
  _ten,
  _hundred,
  _thousand,
  _tenThousand,
  _ten,
  _hundred,
  _thousand,
  _hundredMillion,
  _ten,
  _hundred,
  _thousand,
  _trillion,
  _ten,
  _hundred,
  _thousand,
  _tenQuadrillion,
  _ten,
  _hundred,
  _thousand,
  _hundredQuintillion,
];

/// Chinese negative (-)
const String _negative = '負';

/// Chinese dot (.)
const String _dot = '點';
